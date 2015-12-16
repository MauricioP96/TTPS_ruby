class Contact < ActiveRecord::Base
	validates :value_cont, presence: true,allow_blank: false
	validates :type_cont, presence: true,inclusion: { in: %w(telefono email skype dir_postal),message: " is not a valid cuit/cuil type"},allow_blank: false
end
