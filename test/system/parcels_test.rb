require "application_system_test_case"

class ParcelsTest < ApplicationSystemTestCase
  setup do
    @parcel = parcels(:one)
  end

  test "visiting the index" do
    visit parcels_url
    assert_selector "h1", text: "Parcels"
  end

  test "should create parcel" do
    visit parcels_url
    click_on "New parcel"

    fill_in "Destination", with: @parcel.destination
    fill_in "From", with: @parcel.from
    fill_in "Recipient address", with: @parcel.recipient_address
    fill_in "Recipient name", with: @parcel.recipient_name
    fill_in "Totalcost", with: @parcel.totalcost
    fill_in "Weight", with: @parcel.weight
    click_on "Create Parcel"

    assert_text "Parcel was successfully created"
    click_on "Back"
  end

  test "should update Parcel" do
    visit parcel_url(@parcel)
    click_on "Edit this parcel", match: :first

    fill_in "Destination", with: @parcel.destination
    fill_in "From", with: @parcel.from
    fill_in "Recipient address", with: @parcel.recipient_address
    fill_in "Recipient name", with: @parcel.recipient_name
    fill_in "Totalcost", with: @parcel.totalcost
    fill_in "Weight", with: @parcel.weight
    click_on "Update Parcel"

    assert_text "Parcel was successfully updated"
    click_on "Back"
  end

  test "should destroy Parcel" do
    visit parcel_url(@parcel)
    click_on "Destroy this parcel", match: :first

    assert_text "Parcel was successfully destroyed"
  end
end
