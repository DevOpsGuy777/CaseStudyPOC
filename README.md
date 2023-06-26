# CaseStudyPOC

I have completed below case study requrirements equivalent in azure

1.	Create a VNET, use the CIDR of your choice. Also have internet gateway and the required routes defined
2.	Create an auto scaling group - using Virtual Machine Scalesets
3.	Create a web server instance - VMSS
4.	Change the default web server TCP port from 80 to TCP 8080
5.	Create a load balancer and point the web server - Azure load balancer configured
6.	Open TCP port 80 on the security group to allow incoming traffic from the world - NSG
7.	Create a IAM user and grant him access to only restart web server -- Azure AD user and relevant permission to that user


* I have used CircleCi tool (ci/cd) for this POC
* As best practice we should not ingest secrets, sensitive variable information in git repo, it was handled via CircleCI context (which is equvilaent to Azure DevOps Variable group / Github env varriables)
* tfvars files will be generated dynamically during cd/cd process as its consists of secrets which are too redacted and wont appear in this repo and also its best practice to keep tfvars json out of your repo (generate it in ci/cd flow and pass to terraform)

* I have attached screenshot for resources created on Azure subscription cited above. Please see docs folder in this repo
