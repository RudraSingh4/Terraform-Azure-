#create a Variable
$var = "This is a string"
write-output $var
write-output $var.length

#Create a Array
$dayarray="Mon", "Sun", "Tue", "Wed"
foreach ($col in $dayarray)
{
    Write-Output $col
}