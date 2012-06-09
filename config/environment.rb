# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
:user_name => "dannycardella",
:password => "rose1221",
:domain => "endeavorequity.com",
:address => "smtp.sendgrid.net",
:port => 587,
:authentication => :plain,
:enable_starttls_auto => true
}


# Initialize the rails application
Brave::Application.initialize!
