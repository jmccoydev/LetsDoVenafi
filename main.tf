provider "venafi" {
    url          = "https://tpp.venafi.example"
    trust_bundle = "${file("/opt/venafi/bundle.pem")}"
    access_token = "p0WTt3sDPbzm2BDIkoJROQ=="
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
    key_password = "${var.pk_pass}"
    custom_fields = {
        "Cost Center" = "AB1234",
        "Environment" = "UAT|Staging"
    }
}
