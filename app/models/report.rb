class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :actuals
  has_many :planneds

  # Adding comment 
  accepts_nested_attributes_for :planneds
  accepts_nested_attributes_for :actuals

  attr_accessor :yesterday_plan
  attr_accessor :formatted_date
end
