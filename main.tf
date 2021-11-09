terraform {
  required_providers {
    venafi = {
      source = "Venafi/venafi"
      version = "0.13.0"
    }
  }
}

provider "venafi" {
    url          = "https://uvo1yjukjquyf5nqj8p.env.cloudshare.com/"
    trust_bundle = var.trust
    access_token = var.access_token
    zone         = "DevOps\\Terraform"
}

resource "venafi_certificate" "hashicorpvault" {
    common_name = "vault.venafi.example"
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
    common_name = "app.venafi.example"
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
    common_name = "db.venafi.example"
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
    common_name = "loadbalancer.venafi.example"
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
