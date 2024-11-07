#!/bin/bash

# Function to prompt user for confirmation
prompt_user() {
    read -p "$1 (y/n): " response
    case $response in
        [yY] | [yY][eE][sS])
            return 0
            ;;
        *)
            echo "Operation cancelled."
            return 1
            ;;
    esac
}

# Step 1: Prompt the user for confirmation before destroying resources
echo "This will destroy all resources created by Terraform. Are you sure?"
if ! prompt_user "Do you want to proceed?"; then
    exit 0
fi

# Step 2: Run terraform destroy
cd ../terraform || { echo "Terraform directory not found!"; exit 1; } # Navigate to the Terraform directory
echo "Running terraform destroy..."
terraform destroy -auto-approve

# Step 3: Clean up Terraform files
echo "Cleaning up Terraform files..."

# Remove Terraform state files, plan files, and cached directories
rm -rf .terraform
rm -f terraform.tfstate terraform.tfstate.backup
rm -f *.tfplan

echo "Terraform resources destroyed and cleanup completed."
