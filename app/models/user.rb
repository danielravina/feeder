class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :username, allow_blank: false
  validates_presence_of :first_name, allow_blank: false
  validates_presence_of :last_name, allow_blank: false
  validates_uniqueness_of :username

  def to_s
    "#{first_name} #{last_name}"
  end
end
