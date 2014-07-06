class UserMailer < ActionMailer::Base
  default from: "insighthealthza@gmail.com"

  def request_posted_email(request, recipient)
  	#DEFINE ALL YOUR INSTANCE VARIABLES!!!!!!!!!!!!!!!!
    @request = request
    @recipient = recipient

    mail(to: recipient, subject: "#{Need.find(request.need_id).need_type} Request Alert")
  end
end
