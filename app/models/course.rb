class Course < ApplicationRecord
  validates :title, presence: true
  has_many :comments

  def self.no_describe
    where(:description => nil)
  end

  def abstract
    description[0..20]
  end

end
