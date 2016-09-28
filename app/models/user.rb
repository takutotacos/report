class User < ActiveRecord::Base

  has_and_belongs_to_many :groups
  has_many :reports

  validates :user_name, presence: true, length: { in: 2..10 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}

end
