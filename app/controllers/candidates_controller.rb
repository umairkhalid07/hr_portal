class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to position_path(@candidate.position.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to position_path(@candidate.position.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @candidate.destroy
    redirect_to positions_path
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone_number, :university, :gpa, :bio, :status, :position_id, :picture, :cv, docs: [])
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
