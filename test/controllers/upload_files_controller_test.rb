require 'test_helper'

class UploadFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @upload_file = upload_files(:one)
  end

  test "should get index" do
    get upload_files_url
    assert_response :success
  end

  test "should get new" do
    get new_upload_file_url
    assert_response :success
  end

  test "should create upload_file" do
    assert_difference('UploadFile.count') do
      post upload_files_url, params: { upload_file: { archive: @upload_file.archive, date: @upload_file.date, description: @upload_file.description, institute_id: @upload_file.institute_id, location: @upload_file.location, name: @upload_file.name, scientist_id: @upload_file.scientist_id, scientist_name: @upload_file.scientist_name, status: @upload_file.status, title: @upload_file.title, upload_data_id: @upload_file.upload_data_id, upload_type: @upload_file.upload_type } }
    end

    assert_redirected_to upload_file_url(UploadFile.last)
  end

  test "should show upload_file" do
    get upload_file_url(@upload_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_upload_file_url(@upload_file)
    assert_response :success
  end

  test "should update upload_file" do
    patch upload_file_url(@upload_file), params: { upload_file: { archive: @upload_file.archive, date: @upload_file.date, description: @upload_file.description, institute_id: @upload_file.institute_id, location: @upload_file.location, name: @upload_file.name, scientist_id: @upload_file.scientist_id, scientist_name: @upload_file.scientist_name, status: @upload_file.status, title: @upload_file.title, upload_data_id: @upload_file.upload_data_id, upload_type: @upload_file.upload_type } }
    assert_redirected_to upload_file_url(@upload_file)
  end

  test "should destroy upload_file" do
    assert_difference('UploadFile.count', -1) do
      delete upload_file_url(@upload_file)
    end

    assert_redirected_to upload_files_url
  end
end
