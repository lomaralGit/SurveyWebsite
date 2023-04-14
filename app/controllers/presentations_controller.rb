# frozen_string_literal: true

# Controller that handles presentations, including feedback creation
class PresentationsController < ApplicationController
  def index
    @presentations = Presentation.all
  end

  def new
    redirect_to presentations_path unless privileged?
    @presentation = Presentation.new
  end

  def create_presentation
    @presentation = Presentation.new(presentation_params)

    if @presentation.save
      flash[:success] = 'Presentation saved successfully!'
      redirect_to presentations_path
    else
      flash[:danger] = 'Error saving presentation'
      render 'new', status: :unprocessable_entity
    end
  end

  def presentation_params
    params.require(:presentation).permit(:name, :final_score, user_ids: [])
  end

  def show
    @presentation = Presentation.find_by(id: params[:id])
    @feedbacks = @presentation.feedbacks
    @team_members = Team.where(presentation_id: params[:id]).map { |tm| User.find_by(id: tm.user_id) }
    @is_presenter = @team_members.any? { |user| user.id == current_user.id }
    @feedback = Feedback.new
  end

  def update
    @presentation = Presentation.find_by(id: params[:id])
    if @presentation.update({ final_score: params[:presentation][:final_score] })
      flash[:success] = 'Final score saved successfully!'
      redirect_to presentations_path
    else
      flash[:danger] = 'Error saving final score'
      redirect_back fallback_location: presentations_path
    end
  end

  # Disabled because of the complexity and the number of params needed
  # rubocop:disable Metrics/AbcSize
  def create_feedback
    @feedback = Feedback.new(presentation_id: params[:feedback][:presentation_id],
                             feedback: params[:feedback][:feedback],
                             score: params[:feedback][:score], user_id: current_user.id)

    if @feedback.save
      flash[:success] = 'Feedback saved successfully!'
      redirect_to presentations_path
    else
      flash[:danger] = 'Error saving feedback'
      redirect_back fallback_location: presentations_path
    end
  end
  # rubocop:enable Metrics/AbcSize
end
