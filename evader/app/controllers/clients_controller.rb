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
		if @cliente.save
			redirect_to clients_url
		else
			render action: 'new'
		end
	end
	def edit 
		@cliente=Client.find(params[:id])
		@contactos=@cliente.contacts.all
	end
	def update
		@cliente=Client.find(params[:id])
		#@cliente.actualizar_contactos(params[:cont])
		
		
		if @cliente.actualizar(client_params,params[:cont],cont_nue_params)  #update_attributes(client_params)
			redirect_to clients_url
		else
			reder action: 'edit'
		end
	end




	private
	def client_params
		params.require(:client).permit(:name,:last_name,:birthdate,:gender,:dni,:cu_type,:cu_value)
	end
	def contact_params
		params.require(:contacts).permit(:type_cont, :value_cont)
	end
	def cont_nue_params
		params.require(:cont_nue).permit(:type_cont, :value_cont)
	end
end