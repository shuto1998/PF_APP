require 'test_helper'

class Admin::CorporatesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get admin_corporates_new_url
    assert_response :success
  end

  test 'should get show' do
    get admin_corporates_show_url
    assert_response :success
  end

  test 'should get index' do
    get admin_corporates_index_url
    assert_response :success
  end

  test 'should get edit' do
    get admin_corporates_edit_url
    assert_response :success
  end
end
