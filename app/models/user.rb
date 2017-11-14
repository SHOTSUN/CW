class User < ApplicationRecord

  has_many :projects
  has_many :comments, dependent: :destroy
  has_many :donations, dependent: :destroy

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 20, minimum: 3 },
            format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { maximum: 20, minimum: 6 }
  validates :password_confirmation, presence: true, length: { maximum: 20, minimum: 6 }



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,:omniauth_providers => [:twitter, :facebook, :vkontakte]

  #:confirmable,

      def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
