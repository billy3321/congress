class Entry < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :legislators
  validates_presence_of :title, :description, :category_id
  validate :has_at_least_one_legislator

  private

  def has_at_least_one_legislator
    errors.add(:base, 'must add at least one legislator') if self.legislators.blank?
  end
end
