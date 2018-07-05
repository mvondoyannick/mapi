require 'test_helper'

class VilsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vil = vils(:one)
  end

  test "should get index" do
    get vils_url
    assert_response :success
  end

  test "should get new" do
    get new_vil_url
    assert_response :success
  end

  test "should create vil" do
    assert_difference('Vil.count') do
      post vils_url, params: { vil: { image: @vil.image, name: @vil.name } }
    end

    assert_redirected_to vil_url(Vil.last)
  end

  test "should show vil" do
    get vil_url(@vil)
    assert_response :success
  end

  test "should get edit" do
    get edit_vil_url(@vil)
    assert_response :success
  end

  test "should update vil" do
    patch vil_url(@vil), params: { vil: { image: @vil.image, name: @vil.name } }
    assert_redirected_to vil_url(@vil)
  end

  test "should destroy vil" do
    assert_difference('Vil.count', -1) do
      delete vil_url(@vil)
    end

    assert_redirected_to vils_url
  end
end
