# ActionMailer::Base.smtp_settings = {
#   :user_name => 'diegogarciafonseca@gmail.com',
#   :password => 'df563183',
#   :domain => 'gmail.com',
#   :address => 'smtp.gmail.com',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }

config.action_mailer.default_url_options = { :host => 'appmedicamentos.herokuapp.com' }  
      config.action_mailer.delivery_method = :smtp  
      config.action_mailer.perform_deliveries = true  
      config.action_mailer.raise_delivery_errors = false  
      config.action_mailer.default :charset => "utf-8"  
      config.action_mailer.smtp_settings = {  
        address: "smtp.gmail.com",
        port: 587,
        domain: "appmedicamentos.herokuapp.com",
        authentication: "plain",
        enable_starttls_auto: true,
        user_name: "diegogarciafonseca@gmail.com",
        password: "df563183"
      }
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


