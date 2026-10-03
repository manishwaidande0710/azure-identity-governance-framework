# Management Group Architecture & Scoping Hierarchy

## Structure
\\\	ext
Tenant Root Group
  └── mg-enterprise-root (Enterprise Root)
        ├── mg-platform (Shared services: Network, Monitoring)
        └── mg-workloads (Applications)
              ├── mg-workloads-dev (Development Subscriptions)
              └── mg-workloads-prod (Production Subscriptions)
\\\

## AZ-104 Key Exam Concepts
1. **Inheritance Flow**: RBAC roles, Azure Policy definitions, and Cost Budgets assigned at higher levels cascade downward automatically:
   Management Group -> Subscription -> Resource Group -> Resource
2. **Hierarchy Limits**:
   - Up to 10,000 management groups per directory.
   - Up to 6 levels of depth (excluding Root and Subscription levels).
   - Each item can only have a single parent.
3. **Subscription Movement**:
   - Moving a subscription between management groups causes it to immediately lose the parent's policies and inherit the destination's policies.
4. **Billing vs Management Scope**:
   - Management Groups govern compliance and access. They do NOT aggregate billing invoices; billing is determined by Billing Accounts/Enrollments.
