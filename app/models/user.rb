class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, length: { minimum: 6 }

  has_secure_password

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)

    if user && user.authenticate(password)
      return user
    end
  
    return nil
  end
  
end
