require "test_helper"

class Lr8ControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lr8_input_url
    assert_response :success
  end

  test "should get view" do
    get lr8_view_url
    assert_response :success
  end

  test "should get 1" do
    get lr8_view_url, params: { number: 5, values: "1 5 25 125 41"}
    assert_response :success
    assert_equal assigns[:count_of_segments], 1
  end

  test "should get nothing" do
    get lr8_view_url, params: { number: 5, values: "1 5 2 125 41"}
    assert_response :success
    assert_equal assigns[:count_of_segments], "Таких отрезков нет"
  end

  test "should get incorrect1" do
    get lr8_view_url, params: { number: 5, values: "1 5 41"}
    assert_response :success
    assert_equal assigns[:count_of_segments], "Введены некорректные данные"
  end

  test "should get incorrect2" do
    get lr8_view_url, params: { number: 5, values: "1 5 41 6 7 8"}
    assert_response :success
    assert_equal assigns[:count_of_segments], "Введены некорректные данные"
  end

  test "should get incorrect3" do
    get lr8_view_url, params: { number: 5, values: "1 5 a 6 b"}
    assert_response :success
    assert_equal assigns[:count_of_segments], "Введены некорректные данные"
  end

  test "should get incorrect4" do
    get lr8_view_url, params: { number: 'a', values: "1 5 5 6 2"}
    assert_response :success
    assert_equal assigns[:count_of_segments], "Введены некорректные данные"
  end
end
