require "test_helper"

class ExampleTest < ActiveSupport::TestCase
  # Without RSPEC: https://api.rubyonrails.org/v3.1/classes/ActiveRecord/Fixtures.html
  test "example_count" do
    assert_equal 2, Example.count
  end
end
