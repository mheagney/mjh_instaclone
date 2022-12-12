class LikesController < ApplicationController
  before_action :find_likeable

  def create
    current_user.like!(@likeable)
  end

  def destroy
    current_user.unlike!(@likeable)
  end

  private

  def find_likeable
    @likeable_class = likeable_params[:likeable_type].capitalize.constantize
    @likeable = @likeable_class.find(likeable_params[:id].to_i)
  end

  def likeable_params
    params.permit(:id, :likeable_type)
  end
end
