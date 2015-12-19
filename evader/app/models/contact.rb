class Contact < ActiveRecord::Base
	validates :value_cont, presence: true,allow_blank: false
	validates :value_cont,format:{with: /\A[\d]+\z/,message: " is telefone, must be only numbers" },if: :is_telefone?
	validates :value_cont,format:{with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})\z/,message: " must be an email" },if: :is_email?
	validates :value_cont,format:{with: /\A[a-zA-Z\d ]+\z/,message: " is dir_postal, must be only numbers and letters" },if: :is_pos_dir?
	validates :value_cont,format:{with: /\A[a-zA-Z\d\.\-_]+\z/,message: " is skype, must be only numbers and letters . - _" },if: :is_skype?
	validates :type_cont, presence: true,inclusion: { in: %w(telefono email skype dir_postal),message: " is not a valid contact type"},allow_blank: false
	def is_telefone?
		type_cont=='telefono'
	end
	def is_email?
		type_cont=='email'
	end
	def is_pos_dir?
		type_cont=='dir_postal'
	end
	def is_skype?
		type_cont=='skype'
	end
end
