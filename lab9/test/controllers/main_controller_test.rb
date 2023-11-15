# frozen_string_literal: true

require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "func test" do
    get "/compute/view", params: { n: 10 }
    assert_response :success
  end
end
