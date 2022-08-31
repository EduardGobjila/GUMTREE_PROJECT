class Item < ApplicationRecord
  belongs_to :user
  has_many :purchases

  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = ['Pets', 'Vehicles', 'Bycicles', 'Clothes', 'Audio & Stereo', 'Jobs', 'Electronics', 'Health and Beauty', 'Others']
end
