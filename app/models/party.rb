class Party < ActiveRecord::Base
  has_many :legislators
  validates_presence_of :name, :image, :abbreviation
end
