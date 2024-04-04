data "aws_ssm_parameter" "ecs_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

data "template_file" "bootstrap_script" {
  template = templatefile("${path.module}/userdata/userdata.sh.tpl",
    {
      cluster_name = "${aws_ecs_cluster.main_cluster_ecs.name}"
    }
  )
}



