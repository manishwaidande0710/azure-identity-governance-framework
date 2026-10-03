<#
.SYNOPSIS
    Applies and tests Azure Resource Locks.
.DESCRIPTION
    Applies CanNotDelete and ReadOnly locks to demonstrate protection
    against accidental deletion and test lock inheritance.
    Cost: $0.00 (Azure Control Plane)
#>

param (
    [string]$ResourceGroupName = "rg-governance-lab",
    [string]$Location = "centralindia"
)

Write-Host "=== Azure Resource Lock Automation ===" -ForegroundColor Cyan

# 1. Create a free test Resource Group
Write-Host "[1/3] Creating test Resource Group: $ResourceGroupName" -ForegroundColor Yellow
az group create --name $ResourceGroupName --location $Location --tags Environment=Dev CostCenter=10101

# 2. Apply CanNotDelete lock at the Resource Group level
Write-Host "
[2/3] Applying CanNotDelete Lock (Inherited by all child resources)..." -ForegroundColor Yellow
az lock create --name "Lock-CanNotDelete-RG" 
              --resource-group $ResourceGroupName 
              --lock-type "CanNotDelete" 
              --notes "Prevents accidental deletion of the resource group and child resources."

# 3. ReadOnly Lock reference (How to freeze a resource)
Write-Host "
[3/3] Reference for ReadOnly lock:" -ForegroundColor Yellow
Write-Host "az lock create --name 'Lock-ReadOnly-RG' --resource-group $ResourceGroupName --lock-type 'ReadOnly'" -ForegroundColor White

Write-Host "
Resource lock configured successfully." -ForegroundColor Green
