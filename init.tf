data "template_file" "ec2_init_script" {
  template = file("./scripts/ec2_init.sh")
}

data "template_cloudinit_config" "ec2_init_config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.ec2_init_script.rendered
  }
}