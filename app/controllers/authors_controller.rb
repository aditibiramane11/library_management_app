class AuthorsController < ApplicationController


	def index
		@authors = Author.all
	end




	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)
		if @author.save
			flash[:notice]="Welcome to the library management #{@author.first_name}, you have successfully signed up"
    		redirect_to authors_path
    	else
    	    render 'new'	
    	end 

	end



	def show
		@author = Author.find(params[:id])
	end

	def edit
    	@author = Author.find(params[:id])
    end

    def update
    	@author = Author.find(params[:id])
    	if @author.update(author_params)
    		flash[:notice]="Author profile was updated succesfully"
    		redirect_to author_path
    	end	
    end

    def destroy
    	@author = Author.find(params[:id])
    	@author.destroy
    	redirect_to authors_path
    end


private

def author_params
	params.require(:author).permit(:first_name,:last_name,:date_of_birth)
end

end
