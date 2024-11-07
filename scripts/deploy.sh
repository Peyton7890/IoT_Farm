#!/bin/bash

# Prompt the user to configure AWS CLI
read -p "Do you want to run 'aws configure' to set up your AWS credentials? (y/n): " aws_configure_response

if [[ "$aws_configure_response" == "y" || "$aws_configure_response" == "Y" ]]; then
    echo "Running 'aws configure'..."
    aws configure
else
    echo "Skipping 'aws configure'. Ensure your AWS CLI is configured properly."
fi

# Navigate to the Terraform directory
cd ../terraform || { echo "Terraform directory not found!"; exit 1; }

# Check if Terraform has been initialized
if [ ! -d ".terraform" ]; then
    echo "Terraform has not been initialized. Running 'terraform init'..."
    terraform init
else
    echo "Terraform is already initialized."
fi

# Run Terraform plan
echo "Running 'terraform plan' to create an execution plan..."
terraform plan -out=tfplan

# Prompt user to apply the changes
read -p "Do you want to apply the changes? (y/n): " apply_response

if [[ "$apply_response" == "y" || "$apply_response" == "Y" ]]; then
    echo "Applying the Terraform changes..."
    terraform apply "tfplan"
else
    echo "Changes not applied. Exiting."
fi
