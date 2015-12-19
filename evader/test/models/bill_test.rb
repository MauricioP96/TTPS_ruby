require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	test "debe guardar factura con datos validos" do
  		#para crear una factura debo tener un cliente asi q lo creo
  		#para q ese cliente sea valido debe tenes datos validos y contactos validos
  		a=Client.new(name:'sadsad',last_name:'saffgdg',dni:0,gender:'male',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
  		a.contacts.new(value_cont:'7777777',type_cont:'telefono')
  		a.save   #guardo el cliente
  		assert a.bills.create(details:'sadsadsad',amount:8.6,date:Date.today,receiver:'pepe'),"No guardo la factura valida"
  	end
  	test "no debe guardar factura con datos invalidos" do
  		a=Client.new(name:'sadsad',last_name:'saffgdg',dni:0,gender:'male',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
  		a.contacts.new(value_cont:'7777777',type_cont:'telefono')
  		a.save
  		b=a.bills.new(details:'sadsadsad',amount:'sasd',date:'rrrrr',receiver:'pepe')
  		assert_not b.save,"Guardo la factura invalida"
  	end
  	test "no debe guardar factura sin cliente que la haya emitido" do
  		a=Bill.new(details:'sadsadsad',amount:8.6,date:Date.today,receiver:'pepe')
  		assert_not a.save,"Guardo la factura sin cliente"
  	end
end
