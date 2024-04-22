// Provider configuration.
provider "aws" {
    region = "ap-southeast-2"
    profile = "aws-sso-profile"
    shared_credentials_files = ["~/.aws/credentials"]
}