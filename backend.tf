terraform {
  backend "s3" {
    bucket = "terraformexe"
    key = "statefile/terraform.tfstate"
   region = var.region 
  }
}