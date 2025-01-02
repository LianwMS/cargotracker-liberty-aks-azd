
# Deploy Cargo Tracker to Open Liberty on Azure Kubernetes Service (AKS)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Azure-Samples/cargotracker-liberty-aks-azd)
[![Open in Dev Containers](https://img.shields.io/static/v1?style=for-the-badge&label=Dev%20Containers&message=Open&color=blue&logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/azure-samples/cargotracker-liberty-aks-azd)

This sample shows you how to deploy an existing Liberty application to AKS using Liberty on AKS solution templates. When you're finished, you can continue to manage the application via the Azure CLI or Azure Portal.

Cargo Tracker is a Domain-Driven Design Jakarta EE application. The application is built with Maven and deployed to Open Liberty running on Azure Kubernetes Service (AKS). The application is exposed by Azure Application Gateway service. For quickstart uses the [official Azure offer for running Liberty on AKS](https://aka.ms/liberty-aks), see [Deploy a Java application with Open Liberty or WebSphere Liberty on an Azure Kubernetes Service (AKS) cluster](https://learn.microsoft.com/azure/aks/howto-deploy-java-liberty-app).

[Features](#features) • [Gettting Started](#getting-started) • [Guidance](#guidance)

![cargotracker-liberty-aks.png](images/cargotracker-liberty-aks.png)

## Important Security Notice (Template Owners, do not remove!)

This template, the application code and configuration it contains, has been built to showcase Microsoft Azure specific services and tools. We strongly advise our customers not to make this code part of their production environments without implementing or enabling additional security features.


<!-- Documentation page is a WIP, this link does not exist yet -->
For a more comprehensive list of best practices and security recommendations for Intelligent Applications, [visit our official documentation](#link)”

## Features

The following technologies are part of the project:
* Java 17
* Maven
* Azure Kubernetes Service (AKS)
* Open Liberty
* Azure Application Gateway
* [Azure CLI (az)](https://github.com/Azure/azure-cli))
* [Azure Developer CLI (azd)](https://github.com/microsoft/azd))

This project provides the following features:
* Deploy an existing Liberty application to AKS using Liberty on AKS solution templates
* Best practices to build Domain-Driven Design Jakarta EE applications.
* Find the shortest path for cargo transportation with Azure Open AI services

## Getting Started

- Github codespaces
- VS Code Dev Containers
- Local Environment

All the steps of this lab have been tested in the GitHub CodeSpace. This is the preferred option for running this template.

### GitHub Codespaces

You can run this template by using GitHub Codespaces. The button will open a web-based VS Code instance in your browser:

1. Open the template (this may take several minutes)
   [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Azure-Samples/cargotracker-liberty-aks-azd)
2. Open a terminal window
3. Sign into your Azure account:

    ```shell
     azd auth login --use-device-code
     az login
    ```

5. Provision the Azure resources and deploy your code:

    ```shell
    azd up
    ```
    It will prompt you to enter an environment name for azd like `cargo-tracker-liberty-aks-azd`, and then select a subscription from the list, and then select a location when OpenAI service is available(like "eastus2"). Then it will provision the resources and deploy the code.

6. When azd is done, you can visit the output **Cargo Tracker URL** to see the running application.
   ```shell
   Cargo Tracker URL: http://******.cloudapp.azure.com/cargo-tracker/
   ```
   
7. To clean up the resources, run the following command:
    ```shell
    azd down
    ```


## Guidance

### Prerequisites
* An Azure subscription. 
* kubectl
* helm
* Docker
* Maven
* Java 17
* Azure CLI (az)
* Azure Developer CLI (azd)


### Region Availability

This template uses [Azure OpenAI Service](https://learn.microsoft.com/en-us/azure/ai-services/openai/overview) deployment mododules gpt-4o which may not be available in all Azure regions. Check for up-to-date region availability and select a region during deployment accordingly.

* We recommend using East US, East US 2.

### Costs

You can estimate the cost of this project's architecture with [Azure's pricing calculator](https://azure.microsoft.com/pricing/calculator/)

* Azure OpenAI Service - [Standard](https://azure.microsoft.com/en-us/pricing/details/cognitive-services/openai-service/)
* Azure Kubernetes Service (AKS) 
* Azure Monitor - Analytics Logs
* Azure Database for Postgresql - Flexible Server


### Security

> [!NOTE]
> When implementing this template please specify whether the template uses Managed Identity or Key Vault

This template has [Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview) and Key Vault built in to eliminate the need for developers to manage these credentials. 

Applications can use managed identities to obtain Microsoft Entra tokens without having to manage any credentials. Additionally, we have added a [GitHub Action tool](https://github.com/microsoft/security-devops-action) that scans the infrastructure-as-code files and generates a report containing any detected issues. To ensure best practices in your repo we recommend anyone creating solutions based on our templates ensure that the [Github secret scanning](https://docs.github.com/code-security/secret-scanning/about-secret-scanning) setting is enabled in your repos.

## Resources

For step by step guide to deploy the application, see [Deploy Cargo Tracker to Open Liberty on Azure Kubernetes Service (AKS)](https://github.com/Azure-Samples/cargotracker-liberty-aks)