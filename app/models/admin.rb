class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #devise :database_authenticatable, :trackable, :timeoutable, :lockable 

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
 # :rememberable werkt niet meer
 # devise :database_authenticatable, :registerable, :recoverable,  :trackable, :validatable
end