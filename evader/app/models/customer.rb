class Customer < ActiveRecord::Base
	validates :name, presence: true,format:{with: /\A[a-zA-Z ]+\z/,
        									message: "only allows letters" } #\w+
	validates :last_name, presence: true,format:{with: /\A[a-zA-Z ]+\z/,
        									message: "only allows letters" }
	validates :birthdate, presence: true  #ver si necesito verificar q sea un string valido como fecha DD/MM/YYYY
	validates :gender, presence: true,inclusion: { in: %w(male female),message: " is not a valid gender"}
	validates :dni, presence: true,numericality: { only_integer: true },length: { maximum: 8 },uniqueness:{}
	validates :cu_type, presence: true,inclusion: { in: %w(cuit cuil),message: "% is not a valid cuit/cuil type"}
	validates :cu_value, presence: true,format:{with: /[\d{2}]+\-[\d{8}]+\-[\d{1}]/,
        									message: "not cuit/l format" }
end
