class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomster-myo.herokuapp.com"

  def comment_added
  	mail(to: "myotkyaw@gmail.com", 
  		subject: "A comment has been added to your place on Nomster")
  end
end
