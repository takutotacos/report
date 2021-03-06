class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_and_belongs_to_many :groups
  has_many :reports

  validates :user_name, presence: true, length: { in: 2..10 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
 end

 def authenticated?(remember_token)
   return false if remember_digest.nil?
   BCrypt::Password.new(remember_digest).is_password? (remember_token)
 end

 def forget
   update_attribute(:remember_token, nil)
 end

end
