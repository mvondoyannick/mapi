require 'test_helper'

class QuartiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quartier = quartiers(:one)
  end

  test "should get index" do
    get quartiers_url
    assert_response :success
  end

  test "should get new" do
    get new_quartier_url
    assert_response :success
  end

  test "should create quartier" do
    assert_difference('Quartier.count') do
      post quartiers_url, params: { quartier: { arrondissement_id: @quartier.arrondissement_id, name: @quartier.name } }
    end

    assert_redirected_to quartier_url(Quartier.last)
  end

  test "should show quartier" do
    get quartier_url(@quartier)
    assert_response :success
  end

  test "should get edit" do
    get edit_quartier_url(@quartier)
    assert_response :success
  end

  test "should update quartier" do
    patch quartier_url(@quartier), params: { quartier: { arrondissement_id: @quartier.arrondissement_id, name: @quartier.name } }
    assert_redirected_to quartier_url(@quartier)
  end

  test "should destroy quartier" do
    assert_difference('Quartier.count', -1) do
      delete quartier_url(@quartier)
    end

    assert_redirected_to quartiers_url
  end
end
