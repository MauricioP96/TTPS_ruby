class ClientsController < ApplicationController
    def index
        @clientes = Client.all
    end
    def new
    	@cliente=Client.new
    	@cliente.contacts.build
	end
	def create
		@cliente=Client.new(client_params)
		@cliente.contacts.new(contact_params)
		if @cliente.save!
			redirect_to clients_url
		else
			render action: 'new'
		end
	end








	private
	def client_params
		params.require(:client).permit(:name,:last_name,:birthdate,:gender,:dni,:cu_type,:cu_value)
	end
	def contact_params
		params.require(:contacts).permit(:type_cont, :value_cont)
	end
end