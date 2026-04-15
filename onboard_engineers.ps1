# S13: Automated Engineer Onboarding Script (Fixed)
$securePassword = ConvertTo-SecureString "TitanPassword123!" -AsPlainText -Force

for ($i = 1; $i -le 5; $i++) {
    $username = "Eng_User$i"
    New-ADUser -Name $username `
               -SamAccountName $username `
               -Path "OU=Engineering,DC=titan,DC=local" `
               -AccountPassword $securePassword `
               -Enabled $true `
               -ChangePasswordAtLogon $true
}