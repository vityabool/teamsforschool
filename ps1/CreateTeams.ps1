# Connecting to Teams
Connect-MicrosoftTeams
$team = Get-Team -DisplayName 'Викладачі'

Get-TeamUser -GroupId $team.GroupId

foreach ($user in $teachers_mail ) {
    $user
}

foreach ($user in $teacher_mail) { Add-TeamUser -GroupId $team.GroupId -User $user -Role Owner }

# Getting all users of the group Викладачі
$team_teachers = Get-Team -DisplayName 'Викладачі'
$teachers = Get-TeamUser -GroupId $team_teachers.GroupId
$teacher_mail = $teachers.User

# Creating single class
New-Team 
    -DisplayName "9-А" 
    -Description "Учні 9-А класу" 
    -Visibility Private 
    -AllowChannelMentions $true 
    -AllowOwnerDeleteMessages $true 
    -AllowTeamMentions $true 
    -AllowUserDeleteMessages $true 
    -AllowUserEditMessages $true 
    -MailNickName 9-А
    -ShowInTeamsSearchAndSuggestions $true

# Add all teachers as owners of the group 9-A
$team = Get-Team -DisplayName '9-А'
foreach ($user in $teacher_mail) { 
    Add-TeamUser -GroupId $team.GroupId -User $user -Role Owner 
}

# Creating all classes and adding all teachers as owners to all calsses
# Defining e-mail aliases for each calss
$c_mail  = "10-A", "10-B", "5-V",  "5-G",  "6-A", "6-V", "6-G", "7-A", "7-B", "7-V", "7-G", "8-A", "8-B", "8-V", "9-A", "9-B", "9-V"
# Defining classes display names in Cyrillic
$classes = "10-А", "10-Б", "5-В",  "5-Г",  "6-А", "6-В", "6-Г", "7-А", "7-Б", "7-В", "7-Г", "8-А", "8-Б", "8-В", "9-А", "9-Б", "9-В"

# Adding all classes 
$i = 0;
$sep = "---";
foreach ( $class in $classes ) { 
    New-Team 
        -DisplayName $class 
        -Description "Учні $class класу" 
        -Visibility Private 
        -AllowChannelMentions $true 
        -AllowOwnerDeleteMessages $true 
        -AllowTeamMentions $true 
        -AllowUserDeleteMessages $true 
        -AllowUserEditMessages $true 
        -MailNickName $c_mail[$i] 
        -ShowInTeamsSearchAndSuggestions $true; 
    $sep; 
    $i++ 
}

# Adding all teachers as owners to all classes
foreach ( $class in $classes ) {
    $team = Get-Team -DisplayName $class
    foreach ($user in $teacher_mail) { 
        Add-TeamUser -GroupId $team.GroupId -User $user -Role Owner 
    }
}