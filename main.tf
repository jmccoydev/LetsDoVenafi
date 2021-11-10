terraform {
  required_providers {
    venafi = {
      source = "Venafi/venafi"
      version = "0.13.0"
    }
  }
}

provider "venafi" {
    api_key = var.VENAFI_API_KEY
    zone    = "Nomad\\custom-api"
}

resource "venafi_certificate" "hashicorpvault" {
    common_name = "hashicorpvault.venafi.example"
    san_dns = [
        "vault01.venafi.example",
        "vault02.venafi.example",
        "vault03.venafi.example",
        "vault04.venafi.example",
        "vault05.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}

resource "venafi_certificate" "hashicorpconsul" {
    common_name = "hashicorpconsul.venafi.example"
    san_dns = [
        "consul01.venafi.example",
        "consul02.venafi.example",
        "consul03.venafi.example",
        "consul04.venafi.example",
        "consul05.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}

resource "venafi_certificate" "hashicorpnomad" {
    common_name = "hashicorpnomad.venafi.example"
    san_dns = [
        "nomad01.venafi.example",
        "nomad02.venafi.example",
        "nomad03.venafi.example",
        "nomad04.venafi.example",
        "nomad05.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}

resource "venafi_certificate" "hashicorploadbalancer" {
    common_name = "hashicorploadbalancer.venafi.example"
    san_dns = [
        "lb01.venafi.example",
        "lb02.venafi.example",
        "lb03.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}
output "cert_certificate_vault_dev" {
  value = venafi_certificate.hashicorpvault.certificate
  description = "The certificate of the web server"
}

output "cert_certificate_consul_dev" {
  value = venafi_certificate.hashicorpconsul.certificate
  description = "The certificate of the app server"
}

output "cert_certificate_nomad_dev" {
  value = venafi_certificate.hashicorpnomad.certificate
  description = "The certificate of the database server"
}

output "cert_certificate_loadbalancer_dev" {
  value = venafi_certificate.hashicorploadbalancer.certificate
  description = "The certificate of the loadbalancer"
}
