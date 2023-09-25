resource "digitalocean_droplet" "waf" {
  image  = "debian-11-x64"
  name   = "waf"
  region = "lon1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

connection {
 host        = self.ipv4_address
 user        = "root"
 type        = "ssh"
 private_key = file(var.pvt_key)
 timeout     = "2m"
  }

# Copy in the bash script we want to execute.
provisioner "file" {
 source      = "create_ansible_user.sh"
 destination = "/tmp/create_ansible_user.sh"
}

# Change permissions on bash script and execute from droplet.
provisioner "remote-exec" {
 inline = [
 "chmod +x /tmp/create_ansible_user.sh",
 "sudo /tmp/create_ansible_user.sh",
 ]
}

# Change home's ansible owner
provisioner "remote-exec" {
 inline = [
 "cd /home/",
 "sudo chown -R ansible. ansible",
 ]
}

}
