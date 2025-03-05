# resource "google_monitoring_notification_channel" "main" {
#   display_name = "main-notification-channel"
#   type         = "email"

#   labels = {
#     email_address = "mervinhemaraju16@gmail.com"
#   }
# }

resource "google_billing_budget" "minimal" {
  billing_account = data.google_billing_account.this.id
  display_name    = "minimal-spend-budget"
  amount {
    specified_amount {
      currency_code = "USD"
      units         = "10"
    }
  }

  // Actual thresholds
  threshold_rules {
    threshold_percent = 0.1
  }
  threshold_rules {
    threshold_percent = 0.5
  }
  threshold_rules {
    threshold_percent = 1
  }

  // Forecasted thresholds
  threshold_rules {
    threshold_percent = 0.5
    spend_basis       = "FORECASTED_SPEND"
  }
  threshold_rules {
    threshold_percent = 1
    spend_basis       = "FORECASTED_SPEND"
  }
}
