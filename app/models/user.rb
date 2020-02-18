class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def username
    return self.email.split('@')[0].capitalize
  end
end
