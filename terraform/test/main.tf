provider "aws" {
  version = "~> 2.0"
  region = "eu-north-1"
}

resource "aws_s3_bucket" "host" {
  bucket = "bekk-aws-tf-workshop-host"
  acl    = "private"

  tags = {
    Managed = "Terraform"
  }
}

resource "aws_s3_bucket" "asset" {
  bucket = "bekk-aws-tf-workshop-asset"
  acl    = "private"

  tags = {
    Managed = "Terraform"
  }
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = "bucket-policy"
  policy = templatefile("policy/public_bucket.json.tpl", {bucket_arn = aws_s3_bucket.asset.arn })
  
}