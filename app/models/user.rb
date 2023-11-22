class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "invalid email" }

  before_save do
    puts "fixing attrs before save"
    self.email = email.downcase
  end

  after_save :on_user_create
  after_update :on_user_update
  after_find :on_fetch_of_user

  private def on_user_create
    puts "new user created » #{self.id}"
  end

  private def on_fetch_of_user
    puts "»»» fetching user «««"
  end

  private def on_user_update
    puts "exiting user updated » #{self.id}"
  end
end
