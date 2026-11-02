variable "subscription_id" {
  description = "Id della sottoscrizione Azure"
  type        = string
}

variable "location" {
  description = "Region Azure"
  type        = string
  default     = "swedencentral"
}

variable "ssh_public_key" {
  description = "Contenuto della tua chiave pubblica SSH"
  type        = string
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "vm_size" {
  description = "Taglia della VM; per Claude Code servono almeno 4 GB (vedi terraform.tfvars)"
  type        = string
  default     = "Standard_B2als_v2"
}

variable "use_marketplace_plan" {
  description = "true se l'immagine Rocky ha un plan del Marketplace (Step 1.3)"
  type        = bool
  default     = true
}

variable "shutdown_time" {
  description = "Ora di spegnimento automatico, formato HHMM"
  type        = string
  default     = "2000"
}

# --- NetBird -------------------------------------------------------
variable "netbird_setup_key" {
  description = "Setup key monouso di NetBird: registra la VM al primo avvio"
  type        = string
  sensitive   = true
  default     = ""
}

variable "netbird_hostname" {
  description = "Nome della VM nella rete NetBird"
  type        = string
  default     = "lab-control"
}

# --- Accesso di emergenza (porta 22 da Internet) ---------------------
variable "ssh_from_internet" {
  description = "true apre la porta 22 al tuo IP: solo se NetBird non funziona"
  type        = bool
  default     = false
}

variable "my_ip" {
  description = "Il tuo IP pubblico, usato solo se ssh_from_internet = true"
  type        = string
  default     = ""
}


