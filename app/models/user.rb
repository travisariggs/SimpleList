class User < ActiveRecord::Base

	has_many :items

  has_secure_password validations: false

  validates :name, on: :create, length: {minimum: 2}
  validates :password, on: :create, length: {minimum: 5}
  validates_uniqueness_of :name

  def to_param
  	# This enables URL slugging because _path methods call the 
  	#  object model's 'to_param' method to get an :id for the URL.
  	#  I'm overriding that method and returning the name instead.
  	#  This ensures uniqueness because of the 'validates_uniqueness_of :name'
  	#  above.
  	self.name
  end

end