provider "google" {
  project = var.project_id
  region  = var.region
}

# Uptime check para o serviço HTTP
resource "google_monitoring_uptime_check_config" "http_check" {
  display_name = "HTTP Uptime Check - Serviço de Controle"
  timeout      = "10s"
  period       = "60s"

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = var.project_id
      host       = var.service_host
    }
  }

  http_check {
    path = "/healthz"
    port = 80
  }

  content_matchers {
    content = "OK"
  }
}

# Notification Channel (Email)
resource "google_monitoring_notification_channel" "email_alert" {
  display_name = "Canal de Alerta - Email"
  type         = "email"

  labels = {
    email_address = var.alert_email
  }
}

# Alert Policy
resource "google_monitoring_alert_policy" "uptime_alert" {
  display_name = "Alerta de Uptime - Serviço de Controle"
  combiner     = "OR"

  conditions {
    display_name = "Sem resposta no serviço"
    condition_threshold {
      filter     = "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" AND resource.type=\"uptime_url\""
      duration   = "60s"
      comparison = "COMPARISON_LT"
      threshold_value = 1

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email_alert.name]

  documentation {
    content  = "O serviço não respondeu ao uptime check."
    mime_type = "text/markdown"
  }
}
