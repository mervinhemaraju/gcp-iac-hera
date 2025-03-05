resource "google_billing_budget" "minimal" {
  provider = google.no_user_project_override

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
