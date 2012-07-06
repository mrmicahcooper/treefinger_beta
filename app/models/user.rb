class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :username

  has_secure_password

  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def self.find_by_email_or_username(login)
    User.where('email = :login OR username = :login', login: login).limit(1).first
  end

end
