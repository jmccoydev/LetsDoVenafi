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

resource "venafi_ssh_certificate" "ssh_cert" {
    key_id = "sshcertificate"
    template = "SampleSSHCA"
    valid_hours = 24
}

output "cert_certificate_dev" {
  value = venafi_certificate.webserver.certificate
  description = "The certificate of the web server"
}
