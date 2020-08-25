require "application_system_test_case"

class InstitutesTest < ApplicationSystemTestCase
  setup do
    @institute = institutes(:one)
  end

  test "visiting the index" do
    visit institutes_url
    assert_selector "h1", text: "Institutes"
  end

  test "creating a Institute" do
    visit institutes_url
    click_on "New Institute"

    fill_in "Address", with: @institute.address
    fill_in "Designation", with: @institute.designation
    fill_in "Email", with: @institute.email
    fill_in "Institute type", with: @institute.institute_type
    fill_in "Location", with: @institute.location
    fill_in "Mobile number", with: @institute.mobile_number
    fill_in "Name", with: @institute.name
    fill_in "Password", with: @institute.password
    fill_in "Phone number", with: @institute.phone_number
    fill_in "Type", with: @institute.type
    click_on "Create Institute"

    assert_text "Institute was successfully created"
    click_on "Back"
  end

  test "updating a Institute" do
    visit institutes_url
    click_on "Edit", match: :first

    fill_in "Address", with: @institute.address
    fill_in "Designation", with: @institute.designation
    fill_in "Email", with: @institute.email
    fill_in "Institute type", with: @institute.institute_type
    fill_in "Location", with: @institute.location
    fill_in "Mobile number", with: @institute.mobile_number
    fill_in "Name", with: @institute.name
    fill_in "Password", with: @institute.password
    fill_in "Phone number", with: @institute.phone_number
    fill_in "Type", with: @institute.type
    click_on "Update Institute"

    assert_text "Institute was successfully updated"
    click_on "Back"
  end

  test "destroying a Institute" do
    visit institutes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Institute was successfully destroyed"
  end
end
