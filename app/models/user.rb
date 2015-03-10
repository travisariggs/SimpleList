class User < ActiveRecord::Base

	has_many :items

  has_secure_password validations: false

  validates :name, on: :create, length: {minimum: 2}
  validates :password, on: :create, length: {minimum: 5}

end