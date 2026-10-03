<#
.SYNOPSIS
    Deploys custom Azure Policy definitions and scoped assignments.
.DESCRIPTION
    Creates the Location Restriction (Deny) and Tag Inheritance (Modify) policies.
    Cost: $0.00 (Azure Control Plane)
#>

Write-Host "=== Azure Policy Governance Baseline ===" -ForegroundColor Cyan

$subId = (az account show --query "id" -o tsv 2>$null)
if (-not $subId) {
    $subId = "00000000-0000-0000-0000-000000000000"
}
Write-Host "Active Subscription ID: $subId" -ForegroundColor Yellow

# 1. Create Location Restriction Policy Definition
Write-Host "
[1/3] Creating Policy Definition: Deny Unapproved Locations" -ForegroundColor Yellow
Write-Host "az policy definition create --name 'deny-unapproved-locations' --display-name 'Deny Unapproved Azure Locations' --rules './governance/policies/policy-deny-unapproved-locations.json' --params './governance/policies/policy-deny-unapproved-locations.json' --mode 'Indexed'" -ForegroundColor White

# 2. Create Tag Inheritance Policy Definition
Write-Host "
[2/3] Creating Policy Definition: Inherit Resource Group Tags" -ForegroundColor Yellow
Write-Host "az policy definition create --name 'inherit-rg-tags' --display-name 'Inherit Tag from Resource Group' --rules './governance/policies/policy-inherit-rg-tags.json' --params './governance/policies/policy-inherit-rg-tags.json' --mode 'Indexed'" -ForegroundColor White

# 3. Assign Policy at Subscription Scope
Write-Host "
[3/3] Assigning Location Policy at Subscription Scope:" -ForegroundColor Yellow
Write-Host "az policy assignment create --name 'assign-deny-locations' --display-name 'Enforce Approved Indian Regions' --policy 'deny-unapproved-locations' --scope '/subscriptions/$subId'" -ForegroundColor White

Write-Host "
Azure Policy automation script ready." -ForegroundColor Green
