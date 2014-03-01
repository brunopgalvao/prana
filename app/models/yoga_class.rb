class YogaClass < ActiveRecord::Base
  validates :name, presence: true
  validates :desc, presence: true
  validates :day, presence: true
  validates :time, presence: true
  validates :instructor, presence: true
end
