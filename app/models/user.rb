class User < ApplicationRecord

  has_many :projects
  has_many :comments, dependent: :destroy
  has_many :donations, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :confirmable






end
