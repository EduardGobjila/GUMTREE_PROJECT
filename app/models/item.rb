class Item < ApplicationRecord
  belongs_to :user
  has_many :purchases

  has_many_attached :photos
  validates :name, :description, :price, :category, :location, presence: true


  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = ['Pets', 'Vehicles', 'Bicycles', 'Clothes', 'Audio & Stereo', 'Jobs', 'Electronics', 'Health & Beauty', 'Others'].sort
end
