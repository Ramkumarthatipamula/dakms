class AdminController < ApplicationController

  def index
    @users = User.where(type: "Institute")
  end

  def manage
    @users = User.where(type: "Institute")
  end

end
