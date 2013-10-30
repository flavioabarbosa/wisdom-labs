class Book < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :id_book, presence: true, uniqueness: true
end
