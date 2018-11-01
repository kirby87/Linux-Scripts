cls

$scope = "Global"

Function Get-GroupMember{
    Param(
        [parameter(Mandatory=$true)]
        [string]
        $scope
    )
$Groups = Get-ADGroup -Filter {
    GroupScope -eq $scope -and Members -ne "NULL"
} -Properties Name | Select-Object Name, @{
    Name="GroupMembers";Expression={
        (Get-ADGroupMember -Identity "$_" | 
            Select-Object -ExpandProperty SamAccountName) -join "`n"
    }
}
}
$Groups | Format-Table -AutoSize -Wrap

Function Get-GroupUsers{
$Users = foreach( $Group in $Groups ){
    Get-ADGroupMember -Identity $Group | foreach {
            [PSCustomObject]@{
            Group = $Group.Name
            UserName = $_.SamAccountName
            }
        }
    }
 }
$Users | Format-Table -AutoSize -Wrap
#$Users | Out-GridView
