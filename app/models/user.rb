class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  # testing the subscription
  has_many :subscribes, dependent: :destroy
  has_many :items
  # the orders
  has_many :orders

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
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
