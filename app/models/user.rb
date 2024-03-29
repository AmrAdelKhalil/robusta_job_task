class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :watchlists
  has_many :movies, through: :watchlists
  has_many :reviews

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    email = (auth.info.email) ? auth.info.email : User.dummy_email(auth)

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        oauth_token: auth.credentials.token,
        email:    email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
