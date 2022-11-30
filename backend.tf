terraform {

  backend "s3" {
    region         = "us-east-1"
    bucket         = "ronaldorigobucket"
    dynamodb_table = "ronaldorigobucket-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
    key            = "firstbucket/terraform.tfsate"
  }
}