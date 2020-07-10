class VotingSessionsController < ApplicationController
  before_action :set_group
  before_action :set_voting_session, only: %w[show edit update destroy]
  def index
    @groups = @group.voting_sessions
  end

  def show; end

  def new
    @voting_session = @group.voting_sessions.new
  end

  def create
    @voting_session = @group.voting_sessions.create(voting_session_params)
    if @voting_session.save
      redirect_to [@group, @voting_session]
    else
      render :new
    end
  end

  def edit; end

  def update
    if voting_session.upate(voting_session_params)
      redirect_to [@group, @voting_session]
    else
      render :edit
    end
  end

  def destroy
    @voting_session.destroy
    redirect_to @group
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_voting_session
    @voting_session = VotingSession.find(params[:id])
  end

  def voting_session_params
    params.require(:voting_session).permit(:maximum_books_per_person)
  end
end
