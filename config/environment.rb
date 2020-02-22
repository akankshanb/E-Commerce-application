# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
# removing to test mailing
# ActionMailer::Base.smtp_settings = {
#     :user_name => 'apikey',
#     :password => '',
#     :domain => 'storemanagement.com',
#     :address => 'smtp.sendgrid.net',
#     :port => 465,
#     :authentication => :plain,
#     :enable_starttls_auto => true
# }