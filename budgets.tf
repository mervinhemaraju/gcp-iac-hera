resource "google_monitoring_notification_channel" "main" {
  display_name = "main-notification-channel"
  type         = "email"

  labels = {
    email_address = "mervinhemaraju16@gmail.com"
  }
}

resource "google_billing_budget" "minimal" {
  billing_account = data.google_billing_account.this.id
  display_name    = "minimal-spend-budget"
  amount {
    specified_amount {
      currency_code = "USD"
      units         = "10"
    }
  }
  threshold_rules {
    threshold_percent = 10
  }
  threshold_rules {
    threshold_percent = 50
  }
  threshold_rules {
    threshold_percent = 100
  }


  all_updates_rule {
    monitoring_notification_channels = [
      google_monitoring_notification_channel.main.id,
    ]
    disable_default_iam_recipients = true
  }
}
