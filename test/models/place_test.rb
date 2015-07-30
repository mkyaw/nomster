require 'test_helper'


class PlaceTest < ActiveSupport::TestCase

	test "no one can get the message, it wont be sent" do
	    User.destroy_all
	    place = FactoryGirl.build(:place, :user => nil)
	    comment = FactoryGirl.create(:comment, :place => place)
	    ActionMailer::Base.deliveries.clear
	    assert ActionMailer::Base.deliveries.empty?

	    assert_no_difference 'ActionMailer::Base.deliveries.count' do
	      place.save
	    end

  end

end
