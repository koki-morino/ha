module "gce-lb-http" {
  source  = "GoogleCloudPlatform/lb-http/google"
  version = "~> 9.0"

  project = var.project_id
  name    = "${var.prefix}-https-lb"

  # Disable HTTP as my app uses Websocket which requires secure connection.
  http_forward                    = false
  ssl                             = true
  managed_ssl_certificate_domains = [var.domain]

  backends = {
    default = {
      protocol    = "HTTP"
      port        = var.service_port
      port_name   = var.service_port_name
      enable_cdn  = false
      timeout_sec = 10


      health_check = {
        request_path = "/"
        port         = var.service_port
      }

      log_config = {
        enable      = true
        sample_rate = 1.0
      }

      groups = [
        {
          group = google_compute_instance_group.instance_group_1.id
        },
        {
          group = google_compute_instance_group.instance_group_2.id
        },
      ]

      iap_config = {
        enable = false
      }
    }
  }
}
