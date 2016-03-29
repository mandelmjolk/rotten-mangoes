class User < ActiveRecord::Base
  has_secure_password

  def full_name
    "#{firstname} #{lastname}"
  end
end
