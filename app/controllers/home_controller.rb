class HomeController < ApplicationController
  # skip_before_action :authenticate_user!, :only => [:index]

  def index
    if user_signed_in?
      # redirect_to book_appointments_path
      if current_user.type == 'Admin'
        redirect_to admin_path
      elsif current_user.type == 'ElectronicWing'
        redirect_to electronic_wing_path
      elsif current_user.type == 'Institute'
        redirect_to institute_path
      elsif current_user.type == 'SuperAdmin'
        redirect_to super_admin_path
      end
    end
  end

end
