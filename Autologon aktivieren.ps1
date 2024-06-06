# Pfad zum Registrierungsschlüssel
$Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# Name des Eintrags
$Name = "AutoAdminLogon"

# Neuer Wert
$Value = "1"

# Benutzername des aktuellen Benutzers
$Username = [Environment]::UserName

# Passwortabfrage
$Password = Read-Host -AsSecureString "Bitte geben Sie Ihr Passwort ein"

# Konvertieren des sicheren Passworts in einen Klartext
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)
$PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

# Setzen des neuen Werts
Set-ItemProperty -Path $Path -Name $Name -Value $Value
Set-ItemProperty -Path $Path -Name "DefaultUserName" -Value $Username
Set-ItemProperty -Path $Path -Name "DefaultPassword" -Value $PlainPassword

Write-Host "Die Einstellung wurde geändert. Benutzer müssen nun keinen Benutzernamen und kein Kennwort mehr eingeben."
