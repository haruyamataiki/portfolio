class CustomersController < ApplicationController
    def index
      @customers = Customer.all
    end

    def show
    	@customer = Customer.find(params[:id])
      @recruitments = @customer.recruitments
      @teams = @customer.teams
    end

    def new
    end

    def edit
    	@customer = Customer.find(params[:id])
    end

      def update
      @customer = Customer.find(params[:id])
      @customer.update(customer_params)
      @customer.set_total
      @customer.save
      redirect_to customer_path(@customer.id)
    end

    private
    def customer_params
      params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :running_score, :jumping_score, :agility_score,
      	:sit_ups_score, :grip_strength_score, :account_status, :profile_image)
    end
    def recruitment_params
      params.require(:recruitment).permit(:title, :body, :category, :score, :date, :spot)
    end
end