require 'test_helper'

class CalendriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendrier = calendriers(:one)
  end

  test "should get index" do
    get calendriers_url
    assert_response :success
  end

  test "should get new" do
    get new_calendrier_url
    assert_response :success
  end

  test "should create calendrier" do
    assert_difference('Calendrier.count') do
      post calendriers_url, params: { calendrier: { date: @calendrier.date } }
    end

    assert_redirected_to calendrier_url(Calendrier.last)
  end

  test "should show calendrier" do
    get calendrier_url(@calendrier)
    assert_response :success
  end

  test "should get edit" do
    get edit_calendrier_url(@calendrier)
    assert_response :success
  end

  test "should update calendrier" do
    patch calendrier_url(@calendrier), params: { calendrier: { date: @calendrier.date } }
    assert_redirected_to calendrier_url(@calendrier)
  end

  test "should destroy calendrier" do
    assert_difference('Calendrier.count', -1) do
      delete calendrier_url(@calendrier)
    end

    assert_redirected_to calendriers_url
  end
end
