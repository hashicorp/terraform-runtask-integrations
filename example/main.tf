# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "aws_instance" "this" {
  ami           = "ami-674cbc1e"
  instance_type = "m5.8xlarge"

  root_block_device {
    volume_size = 50
  }

  ebs_block_device {
    device_name = "data"
    volume_type = "io1"
    volume_size = 1000
    iops        = 800
  }
}

resource "aws_lambda_function" "this" {
  function_name = "hello_world"
  role          = "arn:aws:lambda:us-east-1:account-id:resource-id"
  handler       = "exports.test"
  runtime       = "nodejs12.x"
  memory_size   = 1024
}
