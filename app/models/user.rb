class User < ActiveRecord::Base
  validates :first_name,      presence: true
  validates :last_name,       presence: true

  validates :email,           presence: true
                              uniqueness: { case_sensitive: false,
                              message: "should be a unique email" }
                              length: { minumum: 6 }

  has_secure_password

  def authenticate_with_credentials(mail, pass)
    if
      User.find_by(email: mail)
    end
  end

end
