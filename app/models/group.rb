class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :reports

  #attr_accessor :group_id, :group_name
end
