class Item < ApplicationRecord
  belongs_to :user
  has_many :purchases

  has_many_attached :photos

  CATEGORIES = ['Pets', 'Vehicles', 'Bycicles', 'Clothes', 'Audio & Stereo', 'Jobs', 'Electronics', 'Health and Beauty', 'Others']
end
