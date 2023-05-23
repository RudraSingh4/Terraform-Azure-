resource "local_file" "name" {
 count = length(var.name)

 filename = "${var.name[count.index]}.py"

 content = "skdvhb"

}