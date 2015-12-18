class BillsController < ApplicationController
    def index
        @bills = Client.find(params[:client_id]).bills.all
    end
    def new
    	@bill=Client.find(params[:client_id]).bills.new
	end
	def create
		@bill=Client.find(params[:client_id]).bills.new(bill_params)
		if @bill.save
			redirect_to client_bills_url
		else
			render action: 'new'
		end
	end
	def edit 
		@bill=Client.find(params[:client_id]).bills.find(params[:id])
	end
	def update
		@bill=Client.find(params[:client_id]).bills.find(params[:id])
		if @bill.update_attributes(bill_params)
			redirect_to client_bills_path()
		else
			render action: 'edit'
		end
	end
	def show
		@bill=Client.find(params[:client_id]).bills.find(params[:id])
	end

	def destroy
		Client.find(params[:client_id]).bills.find(params[:id]).destroy
		redirect_to client_bills_url

	end
	private

	def bill_params
		params.require(:bill).permit(:receiver,:amount,:date,:details)
	end
end