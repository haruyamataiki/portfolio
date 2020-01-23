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

  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
       redirect_to recruitment_path(@recruitment.id),notice:"successfully"
    else
       flash[:notice] = "error"
       render :edit
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to recruitments_path
  end


private
  def recruitment_params
    params.require(:recruitment).permit(:title, :body, :category, :score, :date, :spot)
  end
end
