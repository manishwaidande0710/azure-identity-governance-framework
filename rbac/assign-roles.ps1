<#
.SYNOPSIS
    Automated Azure RBAC Role Definition and Scoped Assignment.
.DESCRIPTION
    Creates the Custom Virtual Machine Operator role and demonstrates
    assigning roles across Subscription and Resource Group scopes.
    Cost: $0.00 (Azure Control Plane)
#>

param (
    [string]$RoleDefinitionPath = "./rbac/custom-roles/vm-operator-role.json",
    [string]$TargetResourceGroup = "rg-workloads-dev"
)

Write-Host "=== Azure RBAC Governance Baseline ===" -ForegroundColor Cyan

# 1. Retrieve Current Subscription ID
$subId = (az account show --query "id" -o tsv 2>$null)
if (-not $subId) {
    $subId = "00000000-0000-0000-0000-000000000000"
}
Write-Host "Active Subscription ID: $subId" -ForegroundColor Yellow

# 2. Command to create the custom role in Azure
Write-Host "
[1/3] Command to create Custom Role:" -ForegroundColor Yellow
Write-Host "az role definition create --role-definition $RoleDefinitionPath" -ForegroundColor White

# 3. Command to assign role at Subscription Scope
Write-Host "
[2/3] Example Assignment at Subscription Scope (Inherited downward):" -ForegroundColor Yellow
Write-Host "az role assignment create --assignee 'aarav.patel@contosogov.onmicrosoft.com' --role 'Reader' --scope '/subscriptions/$subId'" -ForegroundColor White

# 4. Command to assign Custom Role at Resource Group Scope (Scoped Least Privilege)
Write-Host "
[3/3] Example Assignment at Resource Group Scope:" -ForegroundColor Yellow
Write-Host "az role assignment create --assignee 'aarav.patel@contosogov.onmicrosoft.com' --role 'Custom Virtual Machine Operator' --scope '/subscriptions/$subId/resourceGroups/$TargetResourceGroup'" -ForegroundColor White

Write-Host "
RBAC automation template ready." -ForegroundColor Green
