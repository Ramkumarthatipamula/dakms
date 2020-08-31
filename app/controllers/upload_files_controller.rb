class UploadFilesController < ApplicationController
  include ActiveStorage::SendZip
  before_action :set_upload_file, only: [:show, :edit, :update, :destroy, :status]

  # GET /upload_files
  # GET /upload_files.json
  def index
    # @upload_files = UploadFile.all
    if current_user.type == 'Admin'
      redirect_to admin_path
    elsif current_user.type == 'ElectronicWing'
      redirect_to electronic_wing_dashboard_path
    elsif current_user.type == 'Institute'
      redirect_to institute_dashboard_path
    elsif current_user.type == 'SuperAdmin'
      redirect_to super_admin_path
    end
  end

  # GET /upload_files/1
  # GET /upload_files/1.json
  def show
    respond_to do |format|
      format.html { render }
      format.zip { send_zip @upload_file.uploads }
    end
  end

  # GET /upload_files/new
  def new
    @upload_file = UploadFile.new
    @name = params[:name]
  end

  # GET /upload_files/1/edit
  def edit
  end

  # POST /upload_files
  # POST /upload_files.json
  def create
    @upload_file = UploadFile.new(upload_file_params)
    @upload_file.institute_id = current_user.id
    respond_to do |format|
      if @upload_file.save
        format.html { redirect_to institute_activities_manage_path(name: @upload_file.name), notice: 'Upload file was successfully created.' }
        format.json { render :show, status: :created, location: @upload_file }
      else
        @name = @upload_file.name
        format.html { render :new }
        format.json { render json: @upload_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upload_files/1
  # PATCH/PUT /upload_files/1.json
  def update
    @upload_file.institute_id = current_user.id
    respond_to do |format|
      if @upload_file.update(upload_file_params)
        format.html { redirect_to institute_activities_manage_path(name: @upload_file.name), notice: 'Upload file was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload_file }
      else
        format.html { render :edit }
        format.json { render json: @upload_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_files/1
  # DELETE /upload_files/1.json
  def destroy
    @upload_file.destroy
    respond_to do |format|
      format.html { redirect_to upload_files_url, notice: 'Upload file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def status
    if @upload_file.update(status: params[:status])
      redirect_back fallback_location: electronic_wing_dashboard_path
    else
      format.html { redirect_to electronic_wing_dashboard_path }
    end
  end

  def download
    send_zip  = { "a": UploadFile.find(params[:id]).uploads }
    # redirect_back fallback_location: institute_dashboard_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_file
      @upload_file = UploadFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_file_params
      params.require(:upload_file).permit(:upload_type, :name, :title, :description, :location, :date, :scientist_name, :scientist_id, :status, :archive, :upload_data_id, :institute_id, uploads: [])
    end
end
