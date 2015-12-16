class ClientsController < ApplicationController
    def index
        @customers = Customer.all
    end
end