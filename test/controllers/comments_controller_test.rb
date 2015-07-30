require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
	test "create comment requires logged in" do
		post :create, :place_id => 'omg'
		assert_redirected_to new_user_session_path
	end

	test "create comment buton works" do

		user = FactoryGirl.create(:user)
		sign_in user

		place = FactoryGirl.create(:place)

		assert_difference 'Comment.count' do
			post :create, :place_id => place.id, :comment => {
				:rating => '2_stars',
				:message => 'great place'
			}
		end

		assert_redirected_to place_path(place)
		comment = Comment.last
		assert_equal user, comment.user
		assert_equal 1, place.comments.count
	end
end
