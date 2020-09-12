class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

 # the default (validates on both create and update)
#   validates :name, :presence => true, :on => :save
  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    u = self.arel_table
    # where(conditions).where(u[:name].eq(login).or(u[:email].eq(login))).first
    where(conditions).where(u[:name].eq(login)).first
  end
end
