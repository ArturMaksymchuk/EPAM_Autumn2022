# Azure
## Part 1 – Configure application:
#### - Create a service connection in a Azure DevOps project to your subscription 


#### - Find a .net pet project for the experiments

[Linc for project](https://github.com/adamajammary/simple-web-app-mvc-dotnet.git)

#### -Build your app locally .net project via dotnet tool. dotnet restore/build/run
<details>
  <summary>Screens</summary>
  
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/Azure/screens/1.1.png)

</details>

#### - Create an Azure DevOps repo.  


<details>
  <summary>Screens</summary>
  
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/Azure/screens/1.2.png)

</details>

#### - Create a branching policy for you application. Added yourself as a reviewer
### As branching strategy use a github flow (It will be applied by default when you strict commit to your main branch)

<details>
  <summary>Screens</summary>
  
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/Azure/screens/2.1.png)

</details>


## Part 2 – Configure a pipeline to deploy infrastructure 
### Below is describing on how to do it via terraform. If you want to use terraform you need to create service connection in manual way. Otherwise you won’t be able to deploy your iac – Navigate to the last section Terraform storage account 
##### - Create a separate resource group and deploy azure storage account 
##### - Create a container with the name “tfstate” and remember the name. use portal settings  

<details>
  <summary>Screens</summary>
  
![](https://github.com/ArturMaksymchuk/EPAM_Autumn2022/blob/master/Azure/screens/1.1.png)

</details>

### In this storage account you will be store your tf state file
### Terraform preparation

##### - Create another repo to store devops code

##### - Create a folder terraform

##### - Add app service implementation - https://learn.microsoft.com/en-us/azure/app-service/provision -resource-terraform 

#### - Integrate application insights with app service

##### - Updated backend “azurerm” according to the guide - https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli 

#### - Run az login or Connect-AzAccount to connect the azure subscription from your local

### - Create a terraform pipeline
#### - Run terraform apply to deploy infrastructure 

#### - Create a yaml pipeline with the following steps: terraform install, terraform init, terraform plan/apply. Plan is an optional one 
#### - Inside yaml pipeline add trigger to main branch. The scenario – when main is updated, pipeline should run automatically - https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/trigger?view=azure-pipelines
#### - Added 3 steps – terraform install, terraform init, terraform plan/apply. Plan is an optional one. You may add it as 4th step



## Part 3 – Create a deploy pipeline to app service
#### - Add yml pipeline to the application folder
#### - Your pipeline structure should contain 2 stages. 1st – build, create zip archieve, and publish an artifact. 2nd – download an artifact and deploy it to azure app service 
#### - To deploy .zip to app service use azure app service deployment task
Service connection – manual way
https://4bes.nl/2019/07/11/step-by-step-manually-create-an-azure-devops-service-connection-to-azure/
Don’t forget to grant access on the subscription level for your enterprise application (service principal)
Useful readings 
#### - How to share variables 
#### - Templates example for variables - https://learn.microsoft.com/en-us/samples/azure-samples/azure-pipelines-variable-templates/azure-pipelines-variable-templates/
#### - Good example how to do a pipeline to build .net app and deplot tf iac - https://azuredevopslabs.com/labs/vstsextend/terraform/ Only via UI. Hence don’t forget about view yaml button in UI
#### - Example of the Angular application from lecture 2 - https://epam-my.sharepoint.com/:u:/p/yevhen_husiev/EWXdflfwT7pBijqGNXZnvRgBRdpB_EXlN0cJy8_SFA6_eA?e=Fc3LQW password – AQ!sw2DE£fr4
