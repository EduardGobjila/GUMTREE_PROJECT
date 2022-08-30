class Item < ApplicationRecord
  belongs_to :users
  CATEGORIES = ['Pets', 'Vehicles', 'Bycicles', 'Clothes', 'Audio & Stereo', 'Jobs', 'Electronics', 'Health and Beauty', 'Others']

  has_many :purchases
end
