require 'test_helper'

class SouhaitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @souhait = souhaits(:one)
  end

  test "should get index" do
    get souhaits_url
    assert_response :success
  end

  test "should get new" do
    get new_souhait_url
    assert_response :success
  end

  test "should create souhait" do
    assert_difference('Souhait.count') do
      post souhaits_url, params: { souhait: { detail: @souhait.detail, title: @souhait.title } }
    end

    assert_redirected_to souhait_url(Souhait.last)
  end

  test "should show souhait" do
    get souhait_url(@souhait)
    assert_response :success
  end

  test "should get edit" do
    get edit_souhait_url(@souhait)
    assert_response :success
  end

  test "should update souhait" do
    patch souhait_url(@souhait), params: { souhait: { detail: @souhait.detail, title: @souhait.title } }
    assert_redirected_to souhait_url(@souhait)
  end

  test "should destroy souhait" do
    assert_difference('Souhait.count', -1) do
      delete souhait_url(@souhait)
    end

    assert_redirected_to souhaits_url
  end
end
