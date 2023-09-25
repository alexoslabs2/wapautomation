resource "digitalocean_record" "waf" {
  domain = "tamojunto.solutions" 
  type   = "A"
  name   = "waf"
  value  = digitalocean_droplet.waf.ipv4_address
}

resource "digitalocean_record" "www" {
  domain = "tamojunto.solutions"
  type   = "A"
  name   = "www"
  value  = digitalocean_droplet.waf.ipv4_address
}

