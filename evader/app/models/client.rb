class Client < ActiveRecord::Base
	has_many :contacts
    validates_associated :contacts
    has_many :bills
	validates :name, presence: true,format:{with: /\A[a-zA-Z ]+\z/,
        									message: "only allows letters" } #\w+
	validates :last_name, presence: true,format:{with: /\A[a-zA-Z ]+\z/,
        									message: "only allows letters" }
	validates :birthdate, presence: true  #ver si necesito verificar q sea un string valido como fecha DD/MM/YYYY
	validates :gender, presence: true,inclusion: { in: %w(male female),message: " is not a valid gender"}
	validates :dni, presence: true,numericality: { only_integer: true },length: { maximum: 8 },uniqueness:{}
	validates :cu_type, presence: true,inclusion: { in: %w(cuit cuil),message: " is not a valid cuit/cuil type"}
	validates :cu_value, presence: true,format:{with: /[\d{2}]+\-[\d{8}]+\-[\d{1}]/,
      									message: "not cuit/l format" },uniqueness:{}
    accepts_nested_attributes_for :contacts
    def actualizar_contactos(cont)
    	contacts.destroy_all
    	#foo=self.contacts.all.to_a.to_enum
    	cont.values.each do |c|
			#act=foo.next
			#act.type_cont=cont.type_cont
			#act.value_cont=cont.value_cont
			contacts.new(c)
		end	
		save
    end
    def actualizar(client,cont,cont_nue)
    	#contacts.new(cont_nue)
    	(update_attributes(client) && actualizar_contactos(cont)&& contacts.create(cont_nue))


    end
end
