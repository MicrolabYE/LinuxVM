# frozen_string_literal: true

require 'test_helper'

class ComputeControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get compute_input_url
    assert_response :success
  end

  test 'should get view' do
    get compute_view_url
    assert_response :success
  end
end
