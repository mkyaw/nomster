require 'test_helper'

class PlacesControllerTest < ActionController::TestCase

	test "show found" do
	    place = FactoryGirl.create(:place)
	    get :show, :id =>  place.id
	    assert_response :success
	end

	test "create" do
	    user = FactoryGirl.create(:user)
	    sign_in user
	 
	    assert_difference 'Place.count' do
	      post :create, :place => {
			:name => 'yolo',
			:description => 'omg',
			:address => '123 Main St',
			:latitude => 42.3631519,
			:longitude => -71.056098
			}
	      
	    end
	    assert_redirected_to root_path
	 
	    assert_equal 1, user.places.count
	end

	test "if the place is invalid while creating" do

		user = FactoryGirl.create(:user)
		sign_in user

		post :create, {:place => {
			:name => 'hello'

			}
		}

		assert_response(:unprocessable_entity)
		assert_template(:new)
		assert_equal 0, user.places.count
	end

end
