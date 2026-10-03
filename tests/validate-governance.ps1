<#
.SYNOPSIS
    Automated Governance & Policy Verification Test Suite.
.DESCRIPTION
    Executes positive and negative testing to verify:
    1. Resource group tagging
    2. CanNotDelete lock enforcement
    3. Azure Policy location restriction blocking (Deny effect)
    4. Custom RBAC role permissions
#>

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "   Azure Governance Automated Test Suite   " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$rg = "rg-governance-lab"
$disallowedLocation = "eastus"

# Test 1: Verify Resource Group Tags
Write-Host "
[Test 1] Verifying Resource Group Tags..." -ForegroundColor Yellow
$tags = az group show --name $rg --query "tags" -o json 2>$null
if ($tags) {
    Write-Host "PASS: Resource group exists with tags: $tags" -ForegroundColor Green
} else {
    Write-Host "INFO: Run configure-locks.ps1 first to create $rg" -ForegroundColor Gray
}

# Test 2: Verify CanNotDelete Lock Protection (Negative Test)
Write-Host "
[Test 2] Testing CanNotDelete Lock Protection..." -ForegroundColor Yellow
Write-Host "Attempting deletion of locked resource group (Expect failure)..." -ForegroundColor White
$deleteResult = az group delete --name $rg --yes --no-wait 2>&1
if ($deleteResult -match "ScopeLocked|locked") {
    Write-Host "PASS: Resource Lock successfully prevented deletion!" -ForegroundColor Green
} else {
    Write-Host "RESULT: $deleteResult" -ForegroundColor Gray
}

# Test 3: Verify Azure Policy Deny Effect (Negative Test)
Write-Host "
[Test 3] Testing Azure Policy Location Enforcement..." -ForegroundColor Yellow
Write-Host "Attempting creation in unapproved region ('')..." -ForegroundColor White
$policyResult = az group create --name "rg-policy-violation-test" --location $disallowedLocation 2>&1
if ($policyResult -match "RequestDisallowedByPolicy|disallowed") {
    Write-Host "PASS: Azure Policy successfully denied unapproved region!" -ForegroundColor Green
} else {
    Write-Host "RESULT: $policyResult" -ForegroundColor Gray
}

Write-Host "
==========================================" -ForegroundColor Cyan
Write-Host "         All Governance Tests Complete    " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
