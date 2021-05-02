Import-Module ".\Obfuscated.psm1"

$tree = Get-Obfuscated
$tree.fulltreesWithNLeaves(3)

