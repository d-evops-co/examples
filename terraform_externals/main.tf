

# Demonstrates a couple of ways of getting an IP address we want in a terraform config

data "external" "canhazip" {
  program = ["pwsh", "-noprofile", "-c", "$res = irm canhazip.com; @{result = $res.trim()} | convertto-json" ]
}

data "dns_a_record_set" "homedns" {
  host = "home.jasbro.io"
}

output "home" {
    value = data.dns_a_record_set.homedns.addrs[0]
}

output "canhaz" {
    value = data.external.canhazip.result.result
}