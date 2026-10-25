#!/usr/bin/env bash
# Crea lo Storage account che ospita lo state di Terraform.
# Si esegue UNA volta sola, da Cloud Shell.
set -euo pipefail

LOCATION="italynorth"
RG="rg-lab-tfstate"
# Il nome deve essere unico in tutto Azure: 3-24 caratteri, solo minuscole e numeri
SA="tfstatelab$(openssl rand -hex 3)"

az group create --name "$RG" --location "$LOCATION" --tags lab=true

az storage account create \
  --name "$SA" --resource-group "$RG" --location "$LOCATION" \
  --sku Standard_LRS --kind StorageV2 \
  --min-tls-version TLS1_2 --allow-blob-public-access false \
  --tags lab=true

# Versioning: ogni modifica allo state conserva la versione precedente
az storage account blob-service-properties update \
  --account-name "$SA" --resource-group "$RG" --enable-versioning true

az storage container create --name tfstate \
  --account-name "$SA" --auth-mode key

echo "Storage account creato: $SA"
