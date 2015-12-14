class Contact < ActiveRecord::Base
	validates :value_cont, presence: true
	validates :type_cont, presence: true,inclusion: { in: %w(telefono email dir_postal),message: " is not a valid cuit/cuil type"}
end
