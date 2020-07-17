# Terraform-Multiple-Environment-Role-creation

Enviroment Based Terraform Resource Creation

Description:
This repo is to demostrate to use same terraform code for both staging and prodution environment, In this repo we will be creating App-Dev & App-Ops roles, which will have different permissions based on the environment.

Input Requirement:
	Environment (production/staging)

	Since we create SAML trust roles, we should create and pass IDP provider aws arn, while executing terraform plan & apply

	Default region will be "eu-west-1", you change this main.tf(root Directory)

Terraform Version : v0.12.20