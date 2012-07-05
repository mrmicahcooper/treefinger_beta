class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :username

  has_secure_password

  validates_uniqueness_of :email
  validates_uniqueness_of :username

end
