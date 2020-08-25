require "application_system_test_case"

class UploadFilesTest < ApplicationSystemTestCase
  setup do
    @upload_file = upload_files(:one)
  end

  test "visiting the index" do
    visit upload_files_url
    assert_selector "h1", text: "Upload Files"
  end

  test "creating a Upload file" do
    visit upload_files_url
    click_on "New Upload File"

    check "Archive" if @upload_file.archive
    fill_in "Date", with: @upload_file.date
    fill_in "Description", with: @upload_file.description
    fill_in "Institute", with: @upload_file.institute_id
    fill_in "Location", with: @upload_file.location
    fill_in "Name", with: @upload_file.name
    fill_in "Scientist", with: @upload_file.scientist_id
    fill_in "Scientist name", with: @upload_file.scientist_name
    fill_in "Status", with: @upload_file.status
    fill_in "Title", with: @upload_file.title
    fill_in "Upload data", with: @upload_file.upload_data_id
    fill_in "Upload type", with: @upload_file.upload_type
    click_on "Create Upload file"

    assert_text "Upload file was successfully created"
    click_on "Back"
  end

  test "updating a Upload file" do
    visit upload_files_url
    click_on "Edit", match: :first

    check "Archive" if @upload_file.archive
    fill_in "Date", with: @upload_file.date
    fill_in "Description", with: @upload_file.description
    fill_in "Institute", with: @upload_file.institute_id
    fill_in "Location", with: @upload_file.location
    fill_in "Name", with: @upload_file.name
    fill_in "Scientist", with: @upload_file.scientist_id
    fill_in "Scientist name", with: @upload_file.scientist_name
    fill_in "Status", with: @upload_file.status
    fill_in "Title", with: @upload_file.title
    fill_in "Upload data", with: @upload_file.upload_data_id
    fill_in "Upload type", with: @upload_file.upload_type
    click_on "Update Upload file"

    assert_text "Upload file was successfully updated"
    click_on "Back"
  end

  test "destroying a Upload file" do
    visit upload_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Upload file was successfully destroyed"
  end
end
