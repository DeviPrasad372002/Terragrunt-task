include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../network/vpc"
}

terraform {
  source = "../../../modules/ec2"
}
#windows-ec2
inputs = {
  instance_type = "t3.nano"
  ami_id        = "ami-02b60b5095d1e5227"
  environment   = "prod"
  subnet_id     = dependency.vpc.outputs.public_subnet_ids[0]
  vpc_id        = dependency.vpc.outputs.vpc_id
}
