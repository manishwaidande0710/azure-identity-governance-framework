# Microsoft Entra ID: Dynamic Groups & SSPR Reference (AZ-104)

## 1. Dynamic Membership Rule Syntax
Dynamic groups populate membership automatically based on user/device attributes.

### Common Exam Scenarios:
- **Match single department**:
  \\\	ext
  (user.department -eq "IT")
  \\\
- **Combine multiple conditions (AND)**:
  \\\	ext
  (user.department -eq "IT") and (user.usageLocation -eq "IN")
  \\\
- **Match any of multiple departments (OR)**:
  \\\	ext
  (user.department -eq "IT") or (user.department -eq "Engineering")
  \\\
- **Match users starting with specific job title prefix**:
  \\\	ext
  (user.jobTitle -startsWith "Senior")
  \\\
- **Exclude Guest Accounts (Only internal members)**:
  \\\	ext
  (user.userType -eq "Member")
  \\\

> **Exam Rule**: Dynamic groups require Entra ID P1 or P2 licenses. A group can contain dynamic users OR dynamic devices, but not both.

---

## 2. Self-Service Password Reset (SSPR)
SSPR allows users to reset their passwords without IT helpdesk intervention.

### Core Configuration Parameters:
1. **Scope**:
   - \None\ (Disabled)
   - \Selected\ (Enabled only for members of a designated security group — recommended for testing/pilots)
   - \All\ (Enabled for all users in the tenant)
2. **Authentication Methods Available**:
   - Mobile app code / notification
   - Email (alternate email)
   - Mobile phone (SMS / Call)
   - Security questions (minimum 3 required to register, minimum 3 to reset)
3. **Number of methods required to reset**: 1 or 2
4. **Registration**: Require users to register when signing in (Yes/No)

> **Exam Rule**: If a user is an Azure Administrator (e.g., Global Admin), Azure automatically enforces a **two-gate** (2 methods) password reset policy by default, regardless of tenant SSPR settings.
