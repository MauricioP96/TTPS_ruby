# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Client.destroy_all
client_list = [
  [ "Amado","Boodoo",'1984/08/06','male',11111111,'cuil','11-11111111-1'],
  [ "Guillermo","Moreino",'1958/02/28','male',22222222,'cuit','22-22222222-2' ],
  [ "Nestor",'Lupin','1964/11/03','male',33333333,'cuil','33-33333333-3'],
  [ "Kristina",'Kerner','1964/04/17','female',44444444,'cuil','44-44444444-4'],
  [ "Alex",'Chiquilob','1989/01/03','male',55555555,'cuil','55-55555555-5'],
  [ "Miguel",'Obama','1974/10/23','male',66666666,'cuit','66-66666666-6'],
  [ "Mauricio",'Macro','1960/06/30','male',88888888,'cuit','88-88888888-8'],
  [ "Sergio",'Masa','1950/05/11','male',77777777,'cuil','77-77777777-7']
]
contacts_list=[
	['email','prueba@live.com'],
	['telefono','13213543252']
]
bills_list=[
['2 televisores 30 pulg',9000.99,'2015/12/01','Jose Argento',"87-96584712-3"],
['1 heladera wirpool',120.50,'2015/03/08','Maria Benitez',"52-14783569-8"],
['5 ventiladores de techo',350.99,'2012/04/13','Jose Argento',"45-12369758-4"],
['1 batidora',500.30,'2010/05/20','Pascual Nis',"19-96541236-7"]
]
client_list.each do |nam , last_nam, dat ,gende,dn ,type,value |
  a=Client.new( name: nam, last_name: last_nam ,birthdate:dat ,gender:gende ,dni:dn,cu_type:type,cu_value:value)
  
  contacts_list.each do |ct ,cv|
  	a.contacts.new(type_cont:ct, value_cont:cv)
  end
  a.save
 bills_list.each do |det ,mont,dat,rec,cui|
   a.bills.new(details:det,amount:mont,date:dat,receiver:rec,cuit_l:cui)
	end	
  puts a.save
end