class Admin::EpisodesController < ApplicationController
  before_action :admin_only
  layout 'admin'

  def index
    @episodes = Episode.all.order("id asc")
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def new
    @episode = Episode.new
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to [:admin, @episode]
    else
      render :new
    end
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(episode_params)
      redirect_to [:admin, @episode]
    else
      render :edit
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    redirect_to admin_episodes_path
  end

  private

  def episode_params
    params.require(:episode).permit(:name, :permalink, :description, :notes, :published_at, :seconds, :youtube_id)
  end
end
