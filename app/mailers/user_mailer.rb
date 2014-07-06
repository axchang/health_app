class UserMailer < ActionMailer::Base
  default from: "insighthealthza@gmail.com"

  def request_posted_email(request)
  	#DEFINE ALL YOUR INSTANCE VARIABLES!!!!!!!!!!!!!!!!
  	@request = request
  	@receiver = User.last
  	mail(to: @receiver.email, subject: "#{Need.find(request.need_id).need_type} Request Alert")
  end

  # private

  # def step_params
  # 	params.require(:step).permit(:photo, :caption, :how_to_id)
  # end

end
