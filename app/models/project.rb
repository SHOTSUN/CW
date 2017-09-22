class Project < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :donations, dependent: :destroy


  validate :checkDateGraterThanNow

  has_attached_file :image, styles: {square: "300x300#", normal: "400x400>", smallest: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def remainingsDays
    delta = (self.lastDate - DateTime.now).to_i
    delta < 0 ? 0 :delta
  end


  def calculateProgress
   ((self.collected.fdiv self.pledge)*100).round
  end

  def add(value)
    if value > 0
      self.update_attribute(:collected, self.collected + value)
    end
  end

  def checkDateGraterThanNow
    if DateTime.now > self.lastDate
      errors.add(:endDate, "should be greater than start date")
    end
  end

end
