# Azure Terraform Deployment with Azure Pipelines

This repository contains Terraform code for provisioning and managing various Azure resources. The infrastructure is defined using reusable Terraform modules for different Azure services. The resources are deployed using an Azure Pipelines CI/CD pipeline, which automates the process of provisioning and managing these resources.

## Resources Defined in the Repository

The Terraform code manages the following Azure resources:

- **API Management**: Manages API services, including creating, configuring, and securing APIs.
- **Data Factory**: Deploys data integration services for transforming and moving data.
- **Function App**: Automates serverless functions to execute code on demand.
- **Key Vault**: Stores and manages secrets, keys, and certificates securely.
- **PostgreSQL Server**: Creates and manages PostgreSQL databases on Azure.
- **Static Web App**: Deploys static content, such as websites or single-page applications (SPA).
- **Storage Account**: Defines Azure Storage accounts for data storage.
- **Virtual Network**: Creates network resources for connecting your Azure services securely.
- **Web App**: Deploys web applications on Azure.

Each of these resources is defined in individual Terraform modules, allowing for modular and reusable infrastructure code.

## Deployment with Azure Pipelines

The repository includes an Azure Pipelines YAML configuration file (`azure-pipelines.yml`) for automating the deployment process. The pipeline is designed to execute the following steps:

1. **Terraform Init**: Initializes Terraform, configuring backend settings and downloading necessary provider plugins.
2. **Terraform Plan**: Creates an execution plan to show the changes that will be applied to the Azure environment.
3. **Terraform Apply**: Applies the execution plan to provision and update resources in Azure.

This enables a fully automated and repeatable process for managing Azure infrastructure with Terraform.

## Prerequisites

To use this repository, ensure the following:

1. **Azure Subscription**: You must have an Azure subscription where resources will be provisioned.
2. **Azure CLI**: The Azure CLI should be installed for managing authentication and resources.
3. **Terraform**: Terraform must be installed for local testing and infrastructure management.
4. **Azure DevOps Account**: An Azure DevOps account is required to trigger and run the Azure Pipeline.

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Configure Azure Credentials

To authenticate Azure Pipelines with your Azure subscription, configure a service connection in Azure DevOps.

1. Go to the **Project Settings** in Azure DevOps.
2. Under **Service connections**, add a new **Azure Resource Manager** connection.
3. Select the subscription and provide necessary credentials (client ID, tenant ID, and client secret).

### 3. Review the Terraform Code

Navigate to the module directories to review the individual Terraform modules:

- `api_management/`
- `data_factory/`
- `function_app/`
- `key_vault/`
- `postgresql_server/`
- `static_web_app/`
- `storage_account/`
- `virtual_network/`
- `web_app/`

Ensure that each module has been customized to your requirements (e.g., resource names, configurations).

### 4. Modify the Azure Pipelines YAML File

Ensure that the `azure-pipelines.yml` file is correctly set up for your Azure environment. Some key parameters include:

- **Terraform Cloud/Backend configuration**: If you're using a remote backend like Azure Storage, update the backend settings.
- **Environment variables**: Set any necessary variables, such as Azure region, resource group name, etc.

### 5. Run the Azure Pipeline

1. Push the repository to your Azure DevOps project.
2. The pipeline should trigger automatically based on the defined triggers in `azure-pipelines.yml`.
3. Monitor the pipeline execution in the **Pipelines** section of Azure DevOps.

### 6. Monitor and Verify Deployment

After the pipeline completes, verify the resources have been provisioned in the Azure portal:

- Navigate to the respective resource types (e.g., API Management, Web App, PostgreSQL, etc.).
- Check if all resources have been created as expected.

## Terraform Workflow

In case you want to manually run Terraform commands for testing or validation, follow these steps:

1. **Initialize Terraform**:  
   Initializes the Terraform configuration and downloads the necessary plugins.
   ```bash
   terraform init
   ```

2. **Create an Execution Plan**:  
   Shows the proposed changes without actually applying them.
   ```bash
   terraform plan
   ```

3. **Apply the Plan**:  
   Applies the changes to your Azure environment.
   ```bash
   terraform apply
   ```

4. **Destroy Resources**:  
   Removes all resources created by Terraform.
   ```bash
   terraform destroy
   ```

## Troubleshooting

- **Error during pipeline execution**: Check the Azure DevOps pipeline logs for detailed error messages.
- **Azure authentication issues**: Ensure your Azure DevOps service connection has the correct permissions for the resources being managed.
- **Resource not created**: Verify your Terraform configurations and Azure settings (e.g., resource group, location, etc.).

## Contributing

Feel free to contribute to this repository by submitting issues or pull requests. Ensure that your code follows the existing Terraform module structure and the conventions used in this repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

This `README.md` provides an overview of the repository structure, setup, and deployment process, ensuring a smooth experience when using this Terraform-based Azure deployment pipeline.