# Azure Role-Based Access Control (RBAC) Deep-Dive (AZ-104)

## 1. Built-in Roles Comparison
- **Owner**: Full resource control + Grant/revoke permissions via IAM.
- **Contributor**: Full resource control; CANNOT grant/revoke permissions.
- **Reader**: View-only access across all resources.
- **User Access Administrator**: Manage user permissions only; cannot manage resources.

---

## 2. Anatomy of a Custom Role (JSON)
\\\json
{
  "Name": "Role Display Name",
  "Actions": [ "Allowed control plane operations" ],
  "NotActions": [ "Operations subtracted from Actions" ],
  "DataActions": [ "Allowed data plane operations (e.g. read blob contents)" ],
  "NotDataActions": [ "Operations subtracted from DataActions" ],
  "AssignableScopes": [ "/subscriptions/{id}" ]
}
\\\

> **Exam Note**: \NotActions\ is NOT a deny rule. It is simply a subtraction from \Actions\. If another role grants the action, the user will still have permission!

---

## 3. Scope Hierarchy & Inheritance
\\\	ext
Management Group
  └── Subscription
        └── Resource Group
              └── Resource
\\\
- Roles assigned at higher levels are inherited by all child resources.
- Multiple role assignments are **additive** (allow + allow).
