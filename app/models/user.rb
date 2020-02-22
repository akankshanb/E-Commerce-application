class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # testing the subscription
  has_many :subscribes, dependent: :destroy
  has_many :items

  def username
    return self.email.split('@')[0].capitalize
  end

end
