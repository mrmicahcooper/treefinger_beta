class User < ActiveRecord::Base

  has_many :projects

  attr_accessible :email, :password, :password_confirmation, :username

  has_secure_password

  validates_presence_of :email
  validates_presence_of :password

  validates_confirmation_of :password

  validates_uniqueness_of :email
  validates_uniqueness_of :username

  validates_format_of :email, with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_format_of :username, with: /[a-z]{2,}/, unless: :blank_username


  def self.find_by_email_or_username(login)
    User.where('email = :login OR username = :login', login: login).limit(1).first
  end

  def blank_username
    username.blank?
  end

  def current_project(list_name, project=projects.last)
    if list_name.blank?
      project
    else
      projects.find_or_create_by_name(list_name)
    end
  end

  def create_sample_project
    projects.create(Project::SAMPLE)
  end

end
