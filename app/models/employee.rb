class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :challenges
  

  attr_writer :login

  def login
    @login || self.emp || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(emp) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:emp].nil?
        where(conditions).first
      else
        where(emp: conditions[:emp]).first
      end
    end
  end

end
