#!/bin/bash

set -x  # Enable debugging

# Define the path to the CloudFormation template file.
TEMPLATE_FILE="$PWD/cloudformation.yml"

# Define the name of the CloudFormation stack to be created.
STACK_NAME="vpctest"

# Check if the CloudFormation template file exists.
if [ ! -f "$TEMPLATE_FILE" ]; then
  echo "Error: CloudFormation template file not found at $TEMPLATE_FILE"
  exit 1
fi

# Use the AWS CLI to create the CloudFormation stack.
aws cloudformation create-stack \
  --stack-name "$STACK_NAME" \
  --template-body "file://$TEMPLATE_FILE"

# Check the exit status of the previous command.
if [ $? -eq 0 ]; then
  echo "Stack creation initiated successfully for stack: $STACK_NAME"
else
  echo "Error: Failed to create CloudFormation stack."
  exit 1
fi