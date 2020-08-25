class ElectronicWingController < ApplicationController

  def index
    @users = User.where(type: "Institute")
  end

  def manage
    @users = User.where(type: "Institute")
  end

  def dashboard
    @users = User.where(type: "Institute")
  end

end
