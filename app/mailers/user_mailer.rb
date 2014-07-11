class UserMailer < ActionMailer::Base
  default from: "insighthealthza@gmail.com"

  #passes in the request instance as well as the email of the recipient
  def request_posted_email(request, recipient)
  	#Defines the instance variables that are to be referenced later
    @request = request
    @recipient = recipient
    #Prepares the email for each recipient
    mail(to: recipient, subject: "#{Need.find(request.need_id).need_type} Request Alert")
  end

  def message_out_email(current_user, message, request)
    @current_user = current_user
    @message = message
    @request=request
  	mail(to: request.user.email, subject: "InsightHealth Request Reply")
  end
end
