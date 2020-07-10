class GroupsController < ApplicationController
  before_action :set_group, only: %w[show edit update destroy]

  def index
    @groups = Group.all
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = 'Group successfully created'
      redirect_to @group
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      flash[:success] = 'Group was successfully updated'
      redirect_to @group
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @group.destroy
      flash[:success] = 'Group was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to groups_url
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit
  end
end
