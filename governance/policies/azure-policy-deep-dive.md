# Azure Policy & Resource Tagging: AZ-104 Exam Guide

## 1. RBAC vs. Azure Policy
- **RBAC**: Who can perform operations (Authorization).
- **Policy**: What properties and conditions resources must satisfy (Compliance).
- **Evaluation Order**: Azure Policy evaluates during create/update operations. If an action is allowed by RBAC but blocked by a \Deny\ policy, the deployment fails.

---

## 2. Policy Evaluation Effects
- \Deny\: Fails the resource request immediately.
- \Audit\: Logs non-compliance in the compliance portal; allows creation.
- \Modify\: Adds/replaces tags or properties using a Managed Identity.
- \Append\: Inserts additional fields before the resource is created.
- \DeployIfNotExists (DINE)\: Deploys prerequisite resources (e.g. diagnostic logs).
- \Disabled\: Suspends policy enforcement.

---

## 3. The Tag Inheritance Rule
- In Azure, child resources **do NOT inherit tags** from parent Resource Groups or Subscriptions by default.
- Tags are metadata useful for billing, cost allocation, and resource organization.
- To enforce tag inheritance, use an Azure Policy with the \Modify\ effect linked to a remediation task.

---

## 4. Policy Initiatives & Exemptions
- **Initiative (Policy Set)**: A bundle of multiple policy definitions assigned together.
- **Exemptions**: Explicitly exempts a resource group or resource from an assigned policy without modifying the assignment scope.
