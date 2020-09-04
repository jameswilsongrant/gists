# ansible master -m copy -a "src=consul-master.hcl dest=/etc/consul.d/consul.hcl" --become
data_dir = "/opt/consul"
client_addr = "0.0.0.0"
bind_addr = "0.0.0.0"
ui = true
bootstrap = true
bootstrap_expect = 1
server = true
