class Client < ActiveRecord::Base
	has_many :contacts,dependent: :destroy
    validates :contacts, presence: true
    validates_associated :contacts
    has_many :bills,dependent: :destroy
    validates_associated :bills
    #validates :dni ,uniqueness: true, on: :create
	validates :name, presence: true,format:{with: /\A[a-zA-Z ]+\z/,
        									message: "only allows letters" },allow_blank: false #\w+
	validates :last_name, presence: true,format:{with: /\A[a-zA-Z ]+\z/,
        									message: "only allows letters" },allow_blank: false
	validates :birthdate, presence: true ,allow_blank: false #ver si necesito verificar q sea un string valido como fecha DD/MM/YYYY
	validates :gender, presence: true,inclusion: { in: %w(male female),message: " is not a valid gender"},allow_blank: false
	validates :dni, presence: true,numericality: { only_integer: true },length: { maximum: 8 },allow_blank: false, uniqueness: true
	validates :cu_type, presence: true,inclusion: { in: %w(cuit cuil),message: " is not a valid cuit/cuil type"},allow_blank: false
	validates :cu_value, presence: true,format:{with: /\A\d{2}\-\d{8}\-\d{1}\z/,
      									message: "not cuit/l format" },allow_blank: false
    accepts_nested_attributes_for :contacts
    def actualizar_contactos(cont)
    	cont_enum=cont.to_enum
        act_enum=contacts.all.to_enum
        res=true
        loop do
            a=cont_enum.next
           res=res&&act_enum.next.update(type_cont:a[1]['type_cont'],value_cont:a[1]['value_cont'])
        end	
        res
    end
    def age
        today=Date.today
        year = today.year - birthdate.year
        aux=Date.new birthdate.year+year,birthdate.month,birthdate.day
        if (aux) > today
            year = year - 1
        end
        if (year<0)
            year=0
        end
        year

    end
    def amounts_by_year
        var=Hash.new(0)
        bills.all.each{|b| var[b.date.year]+=b.amount}
        var.sort.reverse
    end
    def bills_by_year 
        res=hash_with_months
        bills.select{|b| b.date.year==Date.today.year}.each{|b| res[b.date.month-1][:cant]+=1}
        res

    end
    def top_5_receivers
        var=Hash.new(0)
        bills.all.each{|b| var[b.receiver]+=b.amount}
        var.sort_by{ |rec, val| val }.reverse.first(5)


    end
    def actualizar(client,cont,cont_nue)
    	
    	@nue=Contact.new(cont_nue)

    	if @nue.valid?
    	
        	(update_attributes(client) && actualizar_contactos(cont)&& contacts.new(cont_nue).save)
    	else
    		(update_attributes(client) && actualizar_contactos(cont))
    	end

    end
    private
    def hash_with_months
        var=Array.new
        var[0]={name:'enero',cant:0}
        var[1]={name:'febrero',cant:0}
        var[2]={name:'marzo',cant:0}
        var[3]={name:'abril',cant:0}
        var[4]={name:'mayo',cant:0}
        var[5]={name:'junio',cant:0}
        var[6]={name:'julio',cant:0}
        var[7]={name:'agosto',cant:0}
        var[8]={name:'septiembre',cant:0}
        var[9]={name:'octubre',cant:0}
        var[10]={name:'noviembre',cant:0}
        var[11]={name:'diciembre',cant:0}
        var
    end
end
