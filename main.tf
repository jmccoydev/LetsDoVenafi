provider "venafi" {
    api_key = var.venafi_api
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
