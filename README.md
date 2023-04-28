# terraform-tenzin-nginx-ingress-external
A Terraform module to deploy Nginx Ingresses to resources external of the Kubernetes cluster.

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.nginx_external_services](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx_redirect_services](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_issuer_name"></a> [cert\_issuer\_name](#input\_cert\_issuer\_name) | The name of the certificate issuer, from cert-manager. | `string` | `"lets-encrypt"` | no |
| <a name="input_external_services"></a> [external\_services](#input\_external\_services) | A map of external services. | <pre>map(object({<br>    virtual_host      = string<br>    address           = string<br>    protocol          = string<br>    port              = string<br>    request_body_size = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_nginx_external_namespace"></a> [nginx\_external\_namespace](#input\_nginx\_external\_namespace) | The namespace to deploy the Nginx ingresses for external services. | `string` | `"nginx-external"` | no |
| <a name="input_redirect_services"></a> [redirect\_services](#input\_redirect\_services) | A map of redirect services. | <pre>map(object({<br>    virtual_host = string<br>    redirect_url = string<br>  }))</pre> | `{}` | no |
<!-- END_TF_DOCS -->
