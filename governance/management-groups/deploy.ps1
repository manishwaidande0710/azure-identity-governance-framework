<#
.SYNOPSIS
    Deploys the Enterprise Management Group Hierarchy using Bicep.
.DESCRIPTION
    Validates and deploys the tenant-level management group structure defined in deploy-hierarchy.bicep.
    Cost: $0.00 (Control Plane only)
#>

Write-Host "Verifying Azure Authentication..." -ForegroundColor Cyan
az account show --output table

Write-Host "
Validating Bicep template syntax..." -ForegroundColor Cyan
az deployment tenant validate 
  --location "centralindia" 
  --template-file "./governance/management-groups/deploy-hierarchy.bicep"

Write-Host "
To deploy the hierarchy into your Azure tenant, execute:" -ForegroundColor Yellow
Write-Host "az deployment tenant create --location centralindia --template-file ./governance/management-groups/deploy-hierarchy.bicep" -ForegroundColor White
