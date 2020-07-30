class VotesController < ApplicationController
  before_action :set_vote, only: %w[edit update]
  before_action :set_user
  def new 

    @voting_session = VotingSession.find(params[:voting_session])
    @voting_session_recommendation = VotingSessionRecommendation.find(params[:voting_session_recommendation_id])
    @vote = Vote.new
    @book = @voting_session_recommendation.book
  end

  def create
    @voting_session = VotingSession.find(params[:vote][:voting_session_id])
    @voting_session_recommendation = VotingSessionRecommendation.find(params[:voting_session_recommendation_id])
    @book = @voting_session_recommendation.book
    @vote = Vote.create(vote_params)
    if @vote.save
      puts params[:commit]
      if params[:commit] == "Would Read"
        @vote.update(outcome: true)
      else
        @vote.update(outcome: false)
      end
      redirect_to group_voting_session_path(@voting_session.group, @voting_session)
    else
      render :new
    end
  end

  def edit; end

  def update 
    if vote.update(vote_params)
      redirect_to group_voting_session_path(vote.voting_session.group, vote.voting_session)
    else
      render :edit
    end
  end
  
  private

  def vote_params
    params.require(:vote).permit(:outcome, :user_id, :voting_session_id, :voting_session_recommendation_id)
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_user
    @user = User.first
  end
end
