# Connecting to Office 365
$365Logon = Get-Credential
$Session = New-PSSession 
    -ConfigurationName Microsoft.Exchange 
    -ConnectionUri https://outlook.office365.com/powershell-liveid/ 
    -Credential $365Logon 
    -Authentication Basic 
    -AllowRedirection

Import-PSSession $Session


# Add all users from input_users.csv to Викладачі
# 1st line of CSV contains header `UserPrincipalName` 
# All other rows - emails of the users
$sub = Import-Csv .\input_users.csv
$sub | Foreach 
    {
     Add-UnifiedGroupLinks 
        -Identity 'Викладачі' 
        -LinkType Members  
        -Links $_.UserPrincipalName 
    }
# Show all new members
Get-UnifiedGroupLinks -Identity 'Викладачі' -LinkType Members
# Conunt number of users in the group
Get-UnifiedGroupLinks -Identity 'Викладачі' -LinkType Members | Measure-Object

