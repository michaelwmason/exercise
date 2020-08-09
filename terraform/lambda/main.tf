provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "terraform-michaelwmason"
    key    = "lambda"
    region = "us-east-2"
  }
}

resource "aws_lambda_function" "exercise" {
   function_name = "Exercise"

   # The bucket name as created earlier with "aws s3api create-bucket"
   s3_bucket = "terraform-michaelwmason"
   s3_key    = "v1.0.0/exercise.zip"

   # "main" is the filename within the zip file (main.js) and "handler"
   # is the name of the property under which the handler function was
   # exported in that file.
   handler = "michael.exercise.LambdaHandler"
   runtime = "java11"
   memory_size = 256

   role = aws_iam_role.lambda_exec.arn
 }

resource "aws_iam_role" "lambda_exec" {
   name = "serverless_example_lambda"

   assume_role_policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
     {
       "Action": "sts:AssumeRole",
       "Principal": {
         "Service": "lambda.amazonaws.com"
       },
       "Effect": "Allow",
       "Sid": ""
     }
   ]
 }
 EOF

 }

