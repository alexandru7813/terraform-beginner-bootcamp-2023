terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
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

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  # bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Welcome to Dracula's Castle!"
  description = <<DESCRIPTION
Dracula's Castle is an amazing B&B.
A fantastic location that people are dying to visit.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  # domain_name = "3fdq3gz.cloudfront.net"
  town = "missingo"
  content_version = 1
}
