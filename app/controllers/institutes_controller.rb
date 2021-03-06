class InstitutesController < ApplicationController
  before_action :set_institute, only: [:show, :edit, :update, :destroy]

  # GET /institutes
  # GET /institutes.json
  def index
    # @institutes = Institute.all
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

  # GET /institutes/1
  # GET /institutes/1.json
  def show
  end

  # GET /institutes/new
  def new
    @institute = Institute.new
  end

  # GET /institutes/1/edit
  def edit
  end

  # POST /institutes
  # POST /institutes.json
  def create
    @institute = Institute.new(institute_params)
    @institute.pwd = institute_params[:password]
    respond_to do |format|
      if @institute.save
        format.html { redirect_to admin_manage_path, notice: 'Institute was successfully created.' }
        format.json { render :show, status: :created, location: @institute }
      else
        format.html { render :new }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institutes/1
  # PATCH/PUT /institutes/1.json
  def update
    respond_to do |format|
      @institute.pwd = institute_params[:password]
      if @institute.update(institute_params)
        format.html { redirect_to admin_manage_path, notice: 'Institute was successfully updated.' }
        format.json { render :show, status: :ok, location: @institute }
      else
        format.html { render :edit }
        format.json { render json: @institute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutes/1
  # DELETE /institutes/1.json
  def destroy
    @institute.destroy
    respond_to do |format|
      format.html { redirect_to institutes_url, notice: 'Institute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dashboard
    if params[:name].present?
      @upload_files = UploadFile.where(name: params[:name], institute_id: current_user.id).where.not(status: "Approved")
    elsif current_user.discipline != 'Extension'
      @upload_files = UploadFile.where(institute_id: current_user.id).where.not(status: "Approved")
    end

    respond_to do |format|
      format.html
      format.csv do
        send_data(UploadFile.generate_csv(@upload_files), filename: "#{Date.today}.csv")
      end
    end
  end

  def download_data
    # @users = User.where(type: "Institute")
    if params[:type].present? && params[:user_id].present?
      @upload_files = UploadFile.where(status: "Approved", name: params[:type], institute_id: params[:user_id])
    elsif current_user.type == "Institute"
      @upload_files = UploadFile.where(status: "Approved", institute_id: current_user.id)
    end

    respond_to do |format|
      format.html
      format.csv do
        send_data(UploadFile.generate_csv(@upload_files), filename: "#{Date.today}.csv")
      end
    end
  end

  def manage
    if params[:name].present?
      @upload_type = params[:name]
      if current_user.type == 'Institute'
        @upload_files = UploadFile.where(name: params[:name], institute_id: current_user.id)
      else
        @upload_files = UploadFile.where(name: params[:name])
      end
    end

    respond_to do |format|
      format.html
      format.csv do
        send_data(UploadFile.generate_csv(@upload_files), filename: "#{Date.today}.csv")
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institute
      @institute = Institute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def institute_params
      params.require(:institute).permit(:name, :password, :email, :mobile_number, :phone_number, :address, :designation, :institute_centre_name, :institute_centre_type, :location, :type, :pwd, :discipline)
    end
end
