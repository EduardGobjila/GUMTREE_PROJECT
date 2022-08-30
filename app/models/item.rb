class Item < ApplicationRecord
  belongs_to :user
  has_many :purchases

  CATEGORIES = ['Pets', 'Vehicles', 'Bycicles', 'Clothes', 'Audio & Stereo', 'Jobs', 'Electronics', 'Health and Beauty', 'Others']
end
