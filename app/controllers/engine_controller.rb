class EngineController < ApplicationController
  def start
    @ingredient = Ingredient.build name: params[:name]
    #Scraper::Nutrition.gather(params[:url])

    render :dashboard
  end

  def dashboard
  end

  def stop
  end
end
