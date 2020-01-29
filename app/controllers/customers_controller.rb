class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, {only: [:edit]}
    def index
      @customers = Customer.search(params[:search])
    end

    def show
    	@customer = Customer.find(params[:id])
      @recruitments = @customer.recruitments
      @teams = @customer.teams
    end

    def edit
    	@customer = Customer.find(params[:id])
    end

    def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
      @customer.set_total
      @customer.save
      redirect_to customer_path(@customer.id)
      else
      redirect_to customers_path
      end
    end

    private
    def customer_params
      params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :running_score, :jumping_score, :agility_score,
      	:sit_ups_score, :grip_strength_score, :account_status, :profile_image, :total_score)
    end
    def recruitment_params
      params.require(:recruitment).permit(:title, :body, :category, :score, :date, :spot)
    end

    def ensure_correct_customer
      @customer = Customer.find(params[:id])
      if @customer.id != current_customer.id
      redirect_to customer_path(current_customer.id)
      end
    end
end