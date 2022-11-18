class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def show
    @position = Position.find(params[:id])
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end
end
