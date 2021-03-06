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
		@contactos=@cliente.contacts.all
		#@cliente.actualizar_contactos(params[:cont])
		
		#if @cliente.actualizar(client_params,params[:cont],cont_nue_params)  #update_attributes(client_params)
		#	redirect_to clients_path()
		#else
		#	render action: 'edit'
		#end
		
		@cliente.update(client_params_to_update)
		@cliente.contacts.create(cont_nue_params)
		redirect_to edit_client_path
	end
	def show
		@cliente=Client.find(params[:id])
	end

	def destroy
		Client.find(params[:id]).destroy
		redirect_to clients_url

	end
	def stats
		client=Client.find(params[:id])
		@amounts=client.amounts_by_year
		@cant_bills=client.bills_by_year
		@top=client.top_5_receivers
	end
	
	private

	def client_params_to_update
		client_params.merge!({contacts_attributes: params[:cont].collect{|key, value| {id:key,value_cont:value['value_cont'],type_cont:value['type_cont']}} }).permit(:name,:last_name,:birthdate,:gender,:dni,:cu_type,:cu_value,contacts_attributes:[ :id,:value_cont, :type_cont ])

	end
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