class User < ActiveRecord::Base
	#Associations
	has_many :posts
  has_many :audit_logs

	#Authorization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Validations
  validates :first_name, :last_name, :phone, presence: true  

  validates :phone, length: { is: 10 }

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX

  #custom methods
  def full_name
  	last_name.upcase + ", " + first_name.upcase
  end  

end
