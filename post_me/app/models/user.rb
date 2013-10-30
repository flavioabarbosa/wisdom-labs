class User < ActiveRecord::Base
	has_many :books, dependent: :destroy
	validates :id_face, presence: true, uniqueness: true
	validates :name, presence: true
	validates :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Digite um e-mail válido!"}
end
