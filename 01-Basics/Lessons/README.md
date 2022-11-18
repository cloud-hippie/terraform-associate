# Terraform Basics 

Terraform has a lot of different types of resources. Each of these resources has a specific type and a specific set of attributes determined by the provider.

While each providers resource types are different, they all have the same basic structure.

## Resources

Resources are the building blocks of Terraform. Each resource has a specific type and a specific set of attributes determined by the provider. 

```hcl
resource "aws_instance" "example" {
  ami = "ami-12345678"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
```

The above creates a resource called "aws_instance" with the name "example". The ami is the AMI ID of the instance. The instance type is the type of instance. The tags are the tags that are applied to the instance.

## Providers

Providers are the different providers that Terraform uses. Each provider has a specific set of attributes that determine how the provider interacts with the given API. 

```hcl
terraform {
  backend "s3" {
    bucket = "terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
```
