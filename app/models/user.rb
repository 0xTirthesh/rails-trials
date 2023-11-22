class User < ApplicationRecord
  # debugger
  has_secure_password validations: false
  # attr_accessor :password, :password_confirmation
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "invalid email" }

  before_save do
    puts "fixing attrs before save"
    self.email = email.downcase
  end

  after_create :on_user_create
  after_update :on_user_update

  private def on_user_create
    puts "new user created » #{self.id}"
  end

  private def on_user_update
    puts "exiting user updated » #{self.id}"
  end
end
