class ElectronicWingController < ApplicationController

  def index
    @users = User.where(type: "Institute")
  end

  def manage
    @users = User.where(type: "Institute")
  end

  def dashboard
    @users = User.where(type: "Institute")
    if params[:type].present? && params[:user_id].present?
      @upload_files = UploadFile.all
    end
  end

end
