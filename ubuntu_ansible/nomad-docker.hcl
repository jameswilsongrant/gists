# /etc/nomad.d/nomad.hcl 
# ansible docker -m copy -a "src=./nomad-docker.hcl dest=/etc/nomad.d/nomad.hcl" --become
# Full configuration options can be found at https://www.nomadproject.io/docs/configuration

datacenter = "dc1"
data_dir = "/opt/nomad/data"

client {
  enabled = true
}
