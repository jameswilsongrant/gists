# /etc/nomad.d/nomad.hcl 
# ansible master -m copy -a "src=./nomad-master.hcl dest=/etc/nomad.d/nomad.hcl" --become
# nomad job init
# Full configuration options can be found at https://www.nomadproject.io/docs/configuration

data_dir = "/opt/nomad/data"

server {
  enabled = true
  bootstrap_expect = 1
}
