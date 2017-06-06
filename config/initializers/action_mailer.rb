Rails.application.config do
  config.action_mailer.smtp_settings = {
    address: "smtp.mandrillapp.com",
    port: 25,
    enable_starttls_auto: true,
    user_name: ENV["MANDRILL_USERNAME"],
    password: ENV["MANDRILL_API_KEY"],
    authentication: 'login',
    domain: 'mandakom.com'
  }
end
