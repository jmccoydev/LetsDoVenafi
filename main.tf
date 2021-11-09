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

resource "venafi_certificate" "webserver" {
    common_name = "web.venafi.example"
    san_dns = [
        "web01.venafi.example",
        "web02.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}

resource "venafi_certificate" "appserver" {
    common_name = "app.venafi.example"
    san_dns = [
        "app01.venafi.example",
        "app02.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}

resource "venafi_certificate" "dbserver" {
    common_name = "db.venafi.example"
    san_dns = [
        "db01.venafi.example",
        "db02.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}

resource "venafi_certificate" "loadbalancer" {
    common_name = "loadbalancer.venafi.example"
    san_dns = [
        "lb01.venafi.example",
        "lb02.venafi.example"
    ]
    algorithm = "RSA"
    rsa_bits = "2048"
    key_password = "123456"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "Staging"
    }
}
output "cert_certificate_web_dev" {
  value = venafi_certificate.webserver.certificate
  description = "The certificate of the web server"
}

output "cert_certificate_app_dev" {
  value = venafi_certificate.appserver.certificate
  description = "The certificate of the app server"
}

output "cert_certificate_db_dev" {
  value = venafi_certificate.dbserver.certificate
  description = "The certificate of the database server"
}

output "cert_certificate_loadbalancer_dev" {
  value = venafi_certificate.loadbalancer.certificate
  description = "The certificate of the loadbalancer"
}
