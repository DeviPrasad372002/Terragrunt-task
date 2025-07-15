include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../network/vpc"
}

terraform {
  source = "../../../modules/ec2"
}

inputs = {
  instance_type = "t2.micro"
  ami_id        = "ami-020cba7c55df1f615"
  environment   = "dev"
  subnet_id     = dependency.vpc.outputs.public_subnet_ids[0]
  vpc_id        = dependency.vpc.outputs.vpc_id
}
