class CandidatesController < ApplicationController
  before_action :set_position, only: [:show, :new, :create, :edit, :destroy]
  def show
    @candidate = @position.candidates.find(params[:id])
  end

  def new
    @candidate = @position.candidates.new
  end

  def create
    @candidate = @position.candidates.create(candidate_params)
    if @candidate.save
      redirect_to position_path(@position)
    else
      render :new
    end
  end

  def edit
    @candidate = @position.candidates.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(candidate_params)
      redirect_to position_path(@candidate.position.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @candidate = @position.candidates.find(params[:id])
    @candidate.destroy!
    redirect_to position_path(@position)
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone_number, :university, :gpa, :bio, :status, :picture, :cv, docs: [])
  end

  def set_position
    @position = Position.find(params[:position_id])
  end
end
