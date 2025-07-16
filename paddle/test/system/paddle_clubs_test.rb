require "application_system_test_case"

class PaddleClubsTest < ApplicationSystemTestCase
  setup do
    @paddle_club = paddle_clubs(:one)
  end

  test "visiting the index" do
    visit paddle_clubs_url
    assert_selector "h1", text: "Paddle clubs"
  end

  test "should create paddle club" do
    visit paddle_clubs_url
    click_on "New paddle club"

    fill_in "Name", with: @paddle_club.name
    fill_in "Tier", with: @paddle_club.tier_id
    click_on "Create Paddle club"

    assert_text "Paddle club was successfully created"
    click_on "Back"
  end

  test "should update Paddle club" do
    visit paddle_club_url(@paddle_club)
    click_on "Edit this paddle club", match: :first

    fill_in "Name", with: @paddle_club.name
    fill_in "Tier", with: @paddle_club.tier_id
    click_on "Update Paddle club"

    assert_text "Paddle club was successfully updated"
    click_on "Back"
  end

  test "should destroy Paddle club" do
    visit paddle_club_url(@paddle_club)
    accept_confirm { click_on "Destroy this paddle club", match: :first }

    assert_text "Paddle club was successfully destroyed"
  end
end
