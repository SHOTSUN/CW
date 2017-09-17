class Project < ApplicationRecord

  has_many :project_users
  #has_many :users, throw: :project_users

  has_attached_file :image, styles: { medium: "300x300>", thumb: "120x120>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def calculateProgress
    self.add(5)
    ((self.collected.fdiv self.pledge)*100).round

  end

  def add(value)
    self.update_attribute(:collected, self.collected + value)
  end



end
