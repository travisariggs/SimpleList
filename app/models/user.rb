class User < ActiveRecord::Base
	include Sluggable

	has_many :items

  has_secure_password validations: false

  validates :name, on: :create, length: {minimum: 2}
  validates :password, on: :create, length: {minimum: 5}
  validates_uniqueness_of :name

  # Required for Sluggable Module
  sluggable_column :name

end