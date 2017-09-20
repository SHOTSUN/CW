class Project < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :donations, dependent: :destroy


  has_attached_file :image, styles: { medium: "300x300>", thumb: "120x120>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def calculateProgress
   ((self.collected.fdiv self.pledge)*100).round

  end

  def add(value)
    if value > 0
      self.update_attribute(:collected, self.collected + value)
    end
    end



end
