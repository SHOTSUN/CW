class Project < ApplicationRecord

  has_and_belongs_to_many :users, join_table: "users_projects"


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
