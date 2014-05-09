class Legislator < ActiveRecord::Base
  belongs_to :party
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :entries
end
