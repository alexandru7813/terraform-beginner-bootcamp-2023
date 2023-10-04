terraform {
    #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
#   cloud {
#     organization = "CTMSolutions"

#     workspaces {
#       name = "terra-house-1"
#     }
#   }
  # required_providers {
  #   # random = {
  #   #   source = "hashicorp/random"
  #   #   version = "3.5.1"
  #   # }
  #   aws = {
  #     source = "hashicorp/aws"
  #     version = "5.19.0"
  #   }
  # }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
}
