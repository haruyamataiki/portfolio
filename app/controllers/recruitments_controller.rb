class RecruitmentsController < ApplicationController
  def index
	  @recruitments = Recruitment.all
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end

  def new
  	@recruitment = Recruitment.new
  end

  def create
  	@recruitment = Recruitment.new(recruitment_params)
    @recruitment.customer_id = current_customer.id
  	if  @recruitment.save
        redirect_to recruitments_path,notice:"successfully"
    else
       flash[:notice] = "error"
  	   redirect_to customers_path(customer.id)
    end
  end


private
  def recruitment_params
    params.require(:recruitment).permit(:title, :body, :category, :score, :date, :spot)
  end
end
