class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
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

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def edit
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
    @candidate.destroy
    redirect_to position_path(@position), status: :see_other
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone, :university, :gpa, :bio, :status)
  end
end
