class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # testing the subscription
  has_many :subscribes, dependent: :destroy
  has_many :items

  def username
    return self.email.split('@')[0].capitalize
  end

  # checking the age of the user
  def self.check_age(user)
    now = Time.now.utc.to_date
    age = now.year - user.dob.year - ((now.month > user.dob.month || (now.month == user.dob.month && now.day >= user.dob.day)) ? 0 : 1)
    # returning the age of the user
    return age
  end
end
