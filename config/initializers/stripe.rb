Rails.configuration.stripe = {
  :publishable_key => ENV['STRYPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRYPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]