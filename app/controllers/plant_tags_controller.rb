class PlantTagsController < ApplicationController
  before_action :set_plant, only: [:new, :create]
  def new
    @plant_tag = PlantTag.new
  end

  def create
    @tags = Tag.where(id: params[:plant_tag][:tag])
    @tags.each do |tag|
      plant_tag = PlantTag.new(plant: @plant, tag: tag)
      plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end
end


## simple_form_for [@plant,@plant_tag]
