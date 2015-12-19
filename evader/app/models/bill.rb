class Bill < ActiveRecord::Base
	validates :client_id, presence:true
	validates :details , presence: true,format:{with: /\A[a-zA-Z\d ]+\z/,message: "only allows letters and numbers"},length: { maximum: 160 }
	validates :amount, presence: true, numericality: { :greater_than_or_equal_to => 0,message: "negative amount" }
	validates :date ,presence: true
	validates :receiver,presence: true,format:{with: /\A[a-zA-Z\d\- ]+\z/,message: "only allows letters and numbers"},length: { maximum: 20 }
end
