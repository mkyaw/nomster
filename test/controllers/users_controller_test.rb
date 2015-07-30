require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	test "show found" do
		u = FactoryGirl.create(:user)
		get :show, :id => u.id
		assert_response :success
	end

	test "user dashboard" do
		user = FactoryGirl.create(:user)
		sign_in user

		get :show, :id => user.id

		assert_response(:success)

	end
end
