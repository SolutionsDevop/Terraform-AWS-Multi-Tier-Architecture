# Providers are plugins that enables interaction with an API
# Terraform uses provider to know which services it needs to interact with
# and we have cloud providers and saas providers.

provider "aws" {
  profile = "default" # Using the profile will use my aws credentials locally
  region  = var.region-name
}

