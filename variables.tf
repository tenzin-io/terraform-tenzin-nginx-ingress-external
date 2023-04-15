variable "nginx_external_namespace" {
  type        = string
  description = "The namespace to deploy the Nginx ingresses for external services."
  default     = "nginx-external"
}

variable "external_services" {
  type = map(object({
    virtual_host = string
    address      = string
    protocol     = string
    port         = string
  }))
  default     = {}
  description = "A map of external services."
}

variable "redirect_services" {
  type = map(object({
    virtual_host = string
    redirect_url = string
  }))
  default     = {}
  description = "A map of redirect services."
}


variable "cert_issuer_name" {
  type        = string
  description = "The name of the certificate issuer, from cert-manager."
  default     = "lets-encrypt"
}
