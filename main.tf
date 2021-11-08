provider "venafi" {
    url          = "https://tpp.venafidemo.com"
    trust_bundle = var.pkibundle
    access_token = "lZpSgA7CX9QUStK+KHW72g=="
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
        "Environment" = "UAT|Staging"
    }
}
