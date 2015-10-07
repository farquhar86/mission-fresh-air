require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC942b1530a1bedac76b89c6f7c15e41d5'
auth_token = 'a1219c1ee46c48ac7edd1d74432c1630'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Hello world!",
    :to => "+16185319413",     # Replace with your phone number
    :from => "+16184778517")   # Replace with your Twilio number
puts message.sid