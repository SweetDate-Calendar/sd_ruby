require "test_helper"

class PaddleClubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paddle_club = paddle_clubs(:one)
  end

  test "should get index" do
    get paddle_clubs_url
    assert_response :success
  end

  test "should get new" do
    get new_paddle_club_url
    assert_response :success
  end

  test "should create paddle_club" do
    assert_difference("PaddleClub.count") do
      post paddle_clubs_url, params: { paddle_club: { name: @paddle_club.name, tier_id: @paddle_club.tier_id } }
    end

    assert_redirected_to paddle_club_url(PaddleClub.last)
  end

  test "should show paddle_club" do
    get paddle_club_url(@paddle_club)
    assert_response :success
  end

  test "should get edit" do
    get edit_paddle_club_url(@paddle_club)
    assert_response :success
  end

  test "should update paddle_club" do
    patch paddle_club_url(@paddle_club), params: { paddle_club: { name: @paddle_club.name, tier_id: @paddle_club.tier_id } }
    assert_redirected_to paddle_club_url(@paddle_club)
  end

  test "should destroy paddle_club" do
    assert_difference("PaddleClub.count", -1) do
      delete paddle_club_url(@paddle_club)
    end

    assert_redirected_to paddle_clubs_url
  end
end
