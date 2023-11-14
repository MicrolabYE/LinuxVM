require "test_helper"

class CalcControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calc_input_url
    assert_response :success
  end

  test "should get view" do
    get calc_view_url
    assert_response :success
  end

  test "should get 11 for view with with 1+10" do
    get calc_view_url
    number = 5
    values = "1 5 125 625 41"
    assert_equal assigns[:result], 11
  end
end
