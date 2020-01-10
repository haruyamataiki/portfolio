class RecruitmentsController < ApplicationControllerde
	def index
		@recruitments = Recruitment.all
	end

    def show
    end

    def new
    	@recruitment =Recruitment.new
    end

    def create
    	@recruitment =Recruitment.new(recruitment_params)
        
    	if  recruitment.save
            redirect_to recruitment_path(recruitment.id),notice:"successfully"
        else
         flash[:notice] = "error"
    	   redirect_to customer_path(@customer.id)
        end
    end


  private
  def recruitment_params
    params.require(:recruitment).permit(:title, :body, :category, :score, :date, :spot)
  end
end
