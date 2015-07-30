require 'test_helper'

class CommentTest < ActiveSupport::TestCase

	test "humanized rating" do
		actual = Comment.new(:rating => '1_star').human_rating

		expected = "one star"

		assert_equal expected, actual
	end

end
