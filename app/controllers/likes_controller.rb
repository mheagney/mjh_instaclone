class LikesController < ApplicationController
  before_action :find_liked

  def create
    current_user.like!(@liked)
  end

  def destroy
    current_user.unlike!(@liked)
  end

  private

  def find_liked
    @likeable_class = likeable_params[:likeable_type].capitalize.constantize
    @liked = @likeable_class.find(params[:id])
  end

  def likeable_params
    params.require(:like).permit(:id, :likeable_type)
  end
end
