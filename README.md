# Enterprise Azure Identity & Governance Framework

An automated, Infrastructure-as-Code (IaC) governance architecture for Microsoft Azure, designed to implement enterprise controls, zero-trust identity baseline, and subscription guardrails at **$0 compute cost**.

## 📌 Project Overview
This repository provides modular templates, policies, and scripts covering all core aspects of **AZ-104: Manage Azure Identities and Governance**:
- **Microsoft Entra ID**: Bulk user provisioning, Administrative Units (AUs), Security Groups, and B2B Guest collaboration.
- **Azure RBAC**: Custom role definitions with granular action boundaries and scoped role assignments.
- **Enterprise Governance**: Multi-tier Management Group hierarchy, custom Azure Policies, Initiatives (Policy Sets), and Tag inheritance.
- **Resource Protection & Cost Control**: Resource Locks (\CanNotDelete\/\ReadOnly\) and proactive Cost Management Budgets.

## 📂 Repository Structure
\\\	ext
├── identity/                  # Entra ID provisioning scripts and CSV templates
│   ├── users-bulk-import.csv
│   ├── deploy-identity.ps1
│   └── dynamic-groups-and-sspr.md
├── rbac/                      # Custom role JSON definitions and assignment scripts
│   ├── custom-roles/
│   │   └── vm-operator-role.json
│   ├── assign-roles.ps1
│   └── rbac-deep-dive.md
├── governance/
│   ├── management-groups/     # Bicep templates for MG hierarchy
│   │   ├── deploy-hierarchy.bicep
│   │   └── deploy.ps1
│   ├── policies/              # Custom Azure Policy and Initiative definitions
│   │   ├── policy-deny-unapproved-locations.json
│   │   ├── policy-inherit-rg-tags.json
│   │   ├── deploy-policies.ps1
│   │   └── azure-policy-deep-dive.md
│   ├── locks/                 # Resource lock automation scripts
│   │   └── configure-locks.ps1
│   └── cost-budgets/          # Zero-cost budget alerts
│       └── subscription-budget.json
├── tests/                     # Validation scripts testing governance enforcement
│   └── validate-governance.ps1
└── docs/                      # Architecture notes and AZ-104 exam mappings
    └── architecture-hierarchy.md
\\\

## 🛠️ Prerequisites
- Azure Subscription (Free Tier or Pay-As-You-Go with $0 resources active)
- Azure CLI (\z\) or Azure Cloud Shell
- Microsoft Graph PowerShell SDK (\Microsoft.Graph\)
