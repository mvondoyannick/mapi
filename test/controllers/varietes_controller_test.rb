require 'test_helper'

class VarietesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variete = varietes(:one)
  end

  test "should get index" do
    get varietes_url
    assert_response :success
  end

  test "should get new" do
    get new_variete_url
    assert_response :success
  end

  test "should create variete" do
    assert_difference('Variete.count') do
      post varietes_url, params: { variete: { name: @variete.name } }
    end

    assert_redirected_to variete_url(Variete.last)
  end

  test "should show variete" do
    get variete_url(@variete)
    assert_response :success
  end

  test "should get edit" do
    get edit_variete_url(@variete)
    assert_response :success
  end

  test "should update variete" do
    patch variete_url(@variete), params: { variete: { name: @variete.name } }
    assert_redirected_to variete_url(@variete)
  end

  test "should destroy variete" do
    assert_difference('Variete.count', -1) do
      delete variete_url(@variete)
    end

    assert_redirected_to varietes_url
  end
end
