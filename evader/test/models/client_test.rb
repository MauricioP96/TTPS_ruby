require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	test "no debe guardar un cliente vacio" do
  		client = Client.new
  		assert_not client.save,"Se guardo un cliente sin informacion"
	end
	test "no debe guardar un cliente sin datos de contacto" do
  		client=Client.new(name:'Juan',last_name:'Mengano',dni:0,gender:'male',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
		assert_not client.save, "Se guardo un cliente sin informacion de contacto"
	end
	test "debe guardar un cliente con datos de contacto" do
  		client=Client.new(name:'Juan',last_name:'Mengano',dni:0,gender:'male',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
		client.contacts.new(type_cont:'email',value_cont:'ejemplo1@live.com')
		assert client.save	,"El ciente valido no se ha guardado "
	end
	test "no debe guardar un contacto con datos invalidos" do
  		client=Client.new(name:'Juan',last_name:'Mengano',dni:'pepe',gender:'cualquier_cosa',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
		client.contacts.new(type_cont:'email',value_cont:'ejemplo1@live.com')
		assert_not client.save, "Se guardo un cliente con datos invalidos"
	end
	test "debe borrar clientes con facturas emitidas" do
		#para crear una factura debo tener un cliente asi q lo creo
  		#para q ese cliente sea valido debe tenes datos validos y contactos validos
  		a=Client.new(name:'sadsad',last_name:'saffgdg',dni:0,gender:'male',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
  		a.contacts.new(value_cont:'7777777',type_cont:'telefono')
  		a.save   #guardo el cliente
  		a.bills.new(details:'sadsadsadsa',amount:88.3,date:Date.today,receiver:'xxxxxxx')
  		a.save
  		#cree un cliente con al menos una factura emitida
  		assert a.destroy,"Se borro el cliente con factura"

	end
	test "debe borrar clientes sin facturas emitidas" do
		#para crear una factura debo tener un cliente asi q lo creo
  		#para q ese cliente sea valido debe tenes datos validos y contactos validos
  		a=Client.new(name:'sadsad',last_name:'saffgdg',dni:0,gender:'male',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
  		a.contacts.new(value_cont:'7777777',type_cont:'telefono')
  		a.save   #guardo el cliente
  		assert a.destroy,"Se borro el cliente sin facturas"
  	end

end
