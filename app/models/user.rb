class User < ApplicationRecord

  has_and_belongs_to_many :projects, join_table: "users_projects"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :confirmable






end
