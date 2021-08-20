class CandiesController < ApplicationController

    # test whether to run this
    before_action :find_candy, only: [:destroy, :update]

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

    def update 
        @candy.update(candy_params)
        render json: @candy
    end

    def destroy
        @candy.destroy
        render status: :no_content
    end


    private

    def find_candy
        @candy = Candy.find(params[:id])
    end

    def candy_params
        params.require(:candy).permit(:name, :origin, :image, :price)
    end
end
