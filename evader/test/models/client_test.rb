require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	test "should not save client without data" do
  		client = Client.new
  		assert_not client.save
	end
	test "should not save client without contact" do
  		client=Client.new(name:'Juan',last_name:'Mengano',dni:36512477,gender:'male',birthdate:Date.today,cu_type:'cuil',cu_value:'23-36512477-9')
		assert_not client.save
	end
end
