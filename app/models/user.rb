class User < ApplicationRecord

  has_many :projects
  has_many :comments, dependent: :destroy
  has_many :donations, dependent: :destroy



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable,:omniauth_providers => [:twitter, :facebook, :vkontakte]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
