provider "aws" {
  region  = "ap-northeast-1"
  profile = var.profile

  default_tags {
    tags = {
      TfName = var.tf.name
      TfEnv  = var.tf.env
    }
  }
}

provider "aws" {
  alias   = "useast1"
  region  = "us-east-1"
  profile = var.profile

  default_tags {
    tags = {
      TfName = var.tf.name
      TfEnv  = var.tf.env
    }
  }
}
