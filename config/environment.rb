ActionMailer::Base.smtp_settings = {
  :user_name => 'diegogarciafonseca@gmail.com',
  :password => 'df563183',
  :domain => 'gmail.com',
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


