class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomster-myo.herokuapp.com"

  def comment_added(comment)
  	@place = comment.place
  	@place_owner = @place.user
  	mail(to: @place_owner.email, 
  		subject: "A comment has been added to #{@place.name} on Nomster")
  end
end
