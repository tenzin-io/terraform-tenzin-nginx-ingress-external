resource "helm_release" "nginx_external_services" {
  for_each         = var.external_services
  chart            = "${path.module}/files/external-service"
  name             = "${each.key}-external-service"
  namespace        = var.nginx_external_namespace
  create_namespace = true

  set {
    name  = "certificateIssuerName"
    value = var.cert_issuer_name
  }

  set {
    name  = "serviceName"
    value = each.key
  }

  set {
    name  = "originServer.address"
    value = each.value.address
  }

  set {
    name  = "originServer.protocol"
    value = each.value.protocol
  }

  set {
    name  = "originServer.port"
    value = each.value.port
  }

  set {
    name  = "ingressVirtualHost"
    value = each.value.virtual_host
  }
}

resource "helm_release" "nginx_redirect_services" {
  for_each         = var.redirect_services
  chart            = "${path.module}/files/redirect-service"
  name             = "${each.key}-redirect-service"
  namespace        = var.nginx_external_namespace
  create_namespace = true

  set {
    name  = "certificateIssuerName"
    value = var.cert_issuer_name
  }

  set {
    name  = "serviceName"
    value = each.key
  }

  set {
    name  = "redirectURL"
    value = each.value.redirect_url
  }

  set {
    name  = "ingressVirtualHost"
    value = each.value.virtual_host
  }
}
