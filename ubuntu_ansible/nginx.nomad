job "nginx" {
  datacenters = ["dc1"]

  group "nginx" {
    count = 10

    task "server" {
      driver = "docker"

      config {
        image = "nginx:latest"

        port_map {
          http = 80
        }
      }

      resources {
        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "nginx"
        port = "http"

        tags = [
          "nginx"
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }
  }
}
