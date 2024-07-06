require "test_helper"

class SubExampleTest < ActiveSupport::TestCase
  # Without RSPEC: https://api.rubyonrails.org/v3.1/classes/ActiveRecord/Fixtures.html
  test "sub_example_count" do
    assert_equal 2, SubExample.count
  end
end
