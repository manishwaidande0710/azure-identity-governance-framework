targetScope = 'tenant'

param topLevelGroupId string = 'mg-enterprise-root'
param topLevelGroupDisplayName string = 'Enterprise Root MG'

// 1. Top-Level Management Group under Tenant Root
resource topMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: topLevelGroupId
  properties: {
    displayName: topLevelGroupDisplayName
  }
}

// 2. Platform Management Group (for core services)
resource platformMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: 'mg-platform'
  properties: {
    displayName: 'Platform Services'
    details: {
      parent: {
        id: topMG.id
      }
    }
  }
}

// 3. Workloads Management Group (parent of dev & prod)
resource workloadsMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: 'mg-workloads'
  properties: {
    displayName: 'Workloads'
    details: {
      parent: {
        id: topMG.id
      }
    }
  }
}

// 4. Dev Workloads Child MG
resource devMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: 'mg-workloads-dev'
  properties: {
    displayName: 'Development'
    details: {
      parent: {
        id: workloadsMG.id
      }
    }
  }
}

// 5. Prod Workloads Child MG
resource prodMG 'Microsoft.Management/managementGroups@2021-04-01' = {
  name: 'mg-workloads-prod'
  properties: {
    displayName: 'Production'
    details: {
      parent: {
        id: workloadsMG.id
      }
    }
  }
}
