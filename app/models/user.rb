class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true, uniqueness: true

  def password
    BCrypt::Password.new(self.hashed_password)
  end

  def password=(new_password)
    self.hashed_password = BCrypt::Password.create(new_password)
  end

  def authenticated?(user_input)
    self.password == user_input
  end

end