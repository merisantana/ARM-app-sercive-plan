{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "appServicePlanName": {
      "type": "string",
      "metadata": {
        "description": "Name of the new App Service Plan"
      }
    },
    "location": {
      "type": "string",
      "metadata": {
        "description": "Location for all resources."
      }
    },
    "sku": {
      "type": "string",
      "defaultValue": "F1",
      "allowedValues": [
        "F1",
        "D1",
        "B1",
        "B2",
        "B3",
        "S1",
        "S2",
        "S3",
        "P1",
        "P2",
        "P3",
        "P4"
      ],
      "metadata": {
        "description": "The size of the App Service Plan."
      }
    }
  },
  "variables": {
    "appServicePlanId": "[resourceId('Microsoft.Web/serverfarms', parameters('appServicePlanName'))]"
  },
  "resources": [
    {
      "type": "Microsoft.Web/serverfarms",
      "apiVersion": "2018-02-01",
      "name": "[parameters('appServicePlanName')]",
      "location": "[parameters('location')]",
      "sku": {
        "name": "[parameters('sku')]"
      },
      "kind": "app",
      "properties": {
        "perSiteScaling": false
      }
    }
  ],
  "outputs": {
    "appServicePlanId": {
      "type": "string",
      "value": "[variables('appServicePlanId')]"
    }
  }
}
