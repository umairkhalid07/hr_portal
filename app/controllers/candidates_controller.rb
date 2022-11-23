class CandidatesController < ApplicationController
  def show
    @position = Position.find(params[:position_id])
    @candidate = Candidate.find(params[:id])
  end

  def new
    @position = Position.find(params[:position_id])
    @candidate = @position.candidates.new
  end

  def create
    @position = Position.find(params[:position_id])
    @candidate = @position.candidates.create(candidate_params)
    if @candidate.save
      redirect_to position_path(@position)
    else
      render :new
    end
  end

  def edit
    @position = Position.find(params[:position_id])
    @candidate = Candidate.find(params[:id])
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
    @position = Position.find(params[:position_id])
    @candidate = @position.candidates.find(params[:id])
    @candidate.destroy!
    redirect_to position_path(@position)
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone_number, :university, :gpa, :bio, :status, :position_id, :picture, :cv, docs: [])
  end
end
