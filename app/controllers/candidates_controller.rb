class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.picture.attach(candidate_params[:picture])
    @candidate.cv.attach(candidate_params[:cv])
    @candidate.docs.attach(candidate_params[:docs])
    if @candidate.save
      redirect_to position_path(@candidate.position.id)
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    @candidate.picture.attach(params[:picture])
    @candidate.cv.attach(params[:cv])
    @candidate.docs.attach(params[:docs])
    if @candidate.update(candidate_params)
      redirect_to position_path(@candidate.position.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    redirect_to positions_path
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :email, :phone, :university, :gpa, :bio, :status, :position_id, :picture, :cv, docs: [])
  end
end
