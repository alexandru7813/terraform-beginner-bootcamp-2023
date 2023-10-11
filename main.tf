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
  cloud {
    organization = "CTMSolutions"

    workspaces {
      name = "terra-house-1"
    }
  }
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

module "home_dracula_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.dracula.public_path
  content_version = var.dracula.content_version
}

resource "terratowns_home" "home" {
  name = "Welcome to Dracula's Castle!"
  description = <<DESCRIPTION
Experience the enchantment of Dracula's Castle like never before.
Our Bed and Breakfast offers a unique and cozy stay in the heart of Transylvania.
DESCRIPTION
  domain_name = module.home_dracula_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.dracula.content_version
}

module "home_moon_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.moon.public_path
  content_version = var.moon.content_version
}

resource "terratowns_home" "home_moon" {
  name = "Welcome to Our Futuristic Moon Resort"
  description = <<DESCRIPTION
Escape to the extraordinary with our Moon Resort,
a stunning spherical oasis nestled on the lunar surface.
Experience luxury like never before.
DESCRIPTION
  domain_name = module.home_moon_hosting.domain_name
  town = "video-valley"
  content_version = var.moon.content_version
}
