class Bill < ActiveRecord::Base
	validates :client_id, presence:true
	validates :details , presence: true,format:{with: /\A[a-zA-Z\d ]+\z/,message: "only allows letters and numbers"},length: { maximum: 160 }
	validates :amount, presence: true, numericality: { :greater_than_or_equal_to => 0,message: "negative amount" }
	validates :date ,presence: true
	validates :receiver,presence: true,format:{with: /\A[a-zA-Z ]+\z/,message: "only allows letters "},length: { maximum: 30 }
	validates :cuit_l, presence: true,format:{with: /\A\d{2}\-\d{8}\-\d{1}\z/,
      									message: "not cuit/l format" },allow_blank: false
end
