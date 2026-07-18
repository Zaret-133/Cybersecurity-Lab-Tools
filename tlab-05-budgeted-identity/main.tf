# =================================================================
# 0. PROVIDER & DYNAMIC AMI LOOKUP
# =================================================================
provider "aws" {
  region = "us-east-2" 
}

resource "random_id" "id" {
  byte_length = 4
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# =================================================================
# STEP 2: FINANCIAL FIREWALL (AWS BUDGET)
# =================================================================
resource "aws_budgets_budget" "cost_guardrail" {
  name              = "titan-fintech-monthly-budget"
  budget_type       = "COST"
  limit_amount      = "10.0"
  limit_unit        = "USD"
  time_period_start = "2026-07-01_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["zaret.belioska@gmail.com"] # REPLACE WITH YOUR EMAIL
  }
}

# =================================================================
# STEP 3: SECURE STORAGE VAULT (PRIVATE S3 BUCKET)
# =================================================================
resource "aws_s3_bucket" "vault" {
  bucket        = "titan-fintech-vault-zp-${random_id.id.hex}" 
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "vault_privacy" {
  bucket = aws_s3_bucket.vault.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# =================================================================
# STEP 4: LEAST PRIVILEGE IAM ARCHITECTURE
# =================================================================
resource "aws_iam_role" "vault_role" {
  name = "Titan-EC2-Vault-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
      }
    ]
  })
}

resource "aws_iam_policy" "put_only_policy" {
  name        = "Titan-S3-Vault-Put-Only"
  description = "Allows surgical s3:PutObject permissions to the secure vault bucket."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:PutObject"]
        Effect   = "Allow"
        Resource = ["${aws_s3_bucket.vault.arn}/*"] 
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.vault_role.name
  policy_arn = aws_iam_policy.put_only_policy.arn
}

# =================================================================
# STEP 5: COMPUTE INSTANCE WITH ROLE ATTACHED
# =================================================================
resource "aws_iam_instance_profile" "instance_profile" {
  name = "Titan-EC2-Vault-Profile"
  role = aws_iam_role.vault_role.name
}

resource "aws_instance" "secure_compute" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t3.micro" # Changed from t2 to t3
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  tags = {
    Name = "Titan-Secure-Compute-Vault"
  }
}
