class CandiesController < ApplicationController

    # before_action :find_candy, only: [:destroy, :update]

    def index
        @candies = Candy.all 
        render json: @candies
    end

    def show
        @candy = Candy.find(params[:id])
        render json: @candy
    end

    def create 
        @candy = Candy.create(candy_params)
        render json: @candy, status: :created
    end



    private

 

    def candy_params
        params.require(:candy).permit(:name, :origin, :image, :price)
    end
end
