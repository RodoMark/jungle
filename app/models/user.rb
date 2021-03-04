class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false,
    message: "should be a unique email" }
  has_secure_password
  
end
