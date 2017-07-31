class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :magzines
  has_many :comments
  has_many :articles

  validates_presence_of :first_name, :last_name

  def full_name
    name = ""
    if !self.first_name.present? || !self.last_name.present?
      name = self.email
    else
  	 name = "#{self.first_name}  #{self.last_name}"
    end
    name
  end
end
