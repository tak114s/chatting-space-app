class GroupsController < ApplicationController

  before_action :set_group, only: %i( edit update )

  def index
    @groups = Groups.all
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    Group.create(group_params)
    redirect_to root_path
  end

  def edit; end

  def update
    @group.update(group_params)
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
