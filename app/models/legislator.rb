class Legislator < ActiveRecord::Base
  belongs_to :party
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :entries
  validates_presence_of :name, :party_id, :constituency, :image
end
