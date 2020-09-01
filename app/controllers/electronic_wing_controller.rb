class ElectronicWingController < ApplicationController

  def index
    @users = User.where(type: "Institute")
  end

  def manage
    @users = User.where(type: "Institute")
  end

  def dashboard
    # @users = User.where(type: "Institute")
    # if params[:type].present? && params[:user_id].present?
    #   @upload_files = UploadFile.where(status: 'Pending', name: params[:type], institute_id: params[:user_id])
    # end
    # if params[:type].present? && params[:user_id].present?
      @upload_files = UploadFile.where(status: 'Pending').includes(:institute)
    # end
  end

  def download_data
    # @users = User.where(type: "Institute")
    # if params[:type].present? && params[:user_id].present?
    #   @upload_files = UploadFile.where(status: "Approved", name: params[:type], institute_id: params[:user_id])
    # elsif current_user.type == "Institute"
    #   @upload_files = UploadFile.where(status: "Approved", institute_id: current_user.id)
    # end
    @upload_files = UploadFile.where(status: "Approved").includes(:institute)
  end

  def rejected_data
    # @users = User.where(type: "Institute")
    # if params[:type].present? && params[:user_id].present?
    #   @upload_files = UploadFile.where(status: "Rejected", name: params[:type], institute_id: params[:user_id]).includes(:institute)
    # end
    @upload_files = UploadFile.where(status: "Rejected").includes(:institute)
  end

end
