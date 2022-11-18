# 02-AWS

This is the beginning of the journey into AWS. We will be using Terraform to create resources.

# Getting Started with AWS

We are going to get setup with the AWS CLI. This will allows us to interact with the AWS API and create resources. This will also help us to manage the resources we create within Terraform.


Here is the [official documentation](https://aws.amazon.com/cli/) for the AWS CLI.

It is worth noting that macOS users will need to install the [Homebrew](https://brew.sh/) package manager.

```bash
brew install awscli
```

Once the AWS CLI is installed, we now need to configure it and get keys.

Navigate to the AWS Console and create a new IAM user.

Go to console.aws.amazon.com and create a new IAM user.

Once logged in, select IAM > Users > Create User.

Create a user and grant the user the ability to access the AWS Console and programmatic access to the AWS API.

You may need to create a new group that has Administrator access to the AWS Console. Create the group with Administrator access and add the user to the group.

At the end when the user is created, copy the Access Key ID and Secret Access Key and paste them into the AWS CLI. You can also download the credentials file and save it to your computer.

The values we will need are: Access Key ID and Secret Access Key.

Within a terminal, run the following.

```bash
aws configure
```

This will prompt you for the following values: Access Key ID, Secret Access Key, and Region.

You should now be able to run `aws s3 ls` and see the buckets you have access to. If you do not see buckets, but get a 0 exit code, all is well.


# Bucket

One of the most popular AWS services is S3. S3 is a storage service that stores data in buckets.

This is perfect for storing static website content, or for storing media files, such as images, videos, or audio. They can be used for capturing data, or for storing data that is not sensitive. 

In this lesson, we will create a bucket to be able to store our TF state file.

1. Create a bucket with the name "terraform-state-<username>". This will be the name of the bucket we will store our state file in.

2. Configure the terraform backend to store the state in the bucket. 

```hcl
terraform {
  backend "s3" {
    bucket = "terraform-state-<username>"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
```

At this point, we have modified the provider that we originally got when we used `terraform init`, so we need to run `terraform init` again.

```bash
terraform init
```

You will notice that terraform has detected the backend is no Longer local, but in s3. This is because we have configured the backend to be in s3. Enter `yes` when prompted.

Terraform will move the file to the new bucket. 

You can verify the file is there by using the new AWS CLI

```bash
aws s3 ls s3://terraform-state-<username>
```

## CodeCodeCode

AWS also offers a suite of seervices that allow you to manage code. CodeCommit, CodeBuild, CodePipeline, and CodeDeploy are all examples of code management services.

Student Activity:
- Define the services

Chat
- Definitions and roles.
- Draw out the services


