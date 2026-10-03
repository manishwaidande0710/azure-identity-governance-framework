# Enterprise Azure Identity & Governance Framework

An automated, Infrastructure-as-Code (IaC) governance architecture for Microsoft Azure, designed to implement enterprise controls, zero-trust identity baseline, and subscription guardrails at ** compute cost**.

## 📌 Project Overview
This repository provides modular templates, policies, and scripts covering all core aspects of **AZ-104: Manage Azure Identities and Governance**:
- **Microsoft Entra ID**: Bulk user provisioning, Administrative Units (AUs), Security Groups, and B2B Guest collaboration.
- **Azure RBAC**: Custom role definitions with granular action boundaries and scoped role assignments.
- **Enterprise Governance**: Multi-tier Management Group hierarchy, custom Azure Policies, Initiatives (Policy Sets), and Tag inheritance.
- **Resource Protection & Cost Control**: Resource Locks (\CanNotDelete\/\ReadOnly\) and proactive Cost Management Budgets.

## 📂 Repository Structure
\\\	ext
├── identity/                  # Entra ID provisioning scripts and CSV templates
├── rbac/                      # Custom role JSON definitions and assignment scripts
├── governance/
│   ├── management-groups/     # Bicep templates for MG hierarchy
│   ├── policies/              # Custom Azure Policy and Initiative definitions
│   ├── locks/                 # Resource lock automation scripts
│   └── cost-budgets/          # Zero-cost budget alerts
├── tests/                     # Validation scripts testing governance enforcement
└── docs/                      # Architecture notes and AZ-104 exam mappings
\\\

## 🛠️ Prerequisites
- Azure Subscription (Free Tier or Pay-As-You-Go with  resources active)
- Azure CLI (\z\) or Azure Cloud Shell
- Microsoft Graph PowerShell SDK (\Microsoft.Graph\)
