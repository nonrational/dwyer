class BandNamesController < ApplicationController

  def index
    @band_name = BandName.new
    @band_names = BandName.all.reverse
  end

  def show
    @band_name = BandName.find(params[:id])
  end

  def update
    @band_name = BandName.find(params[:id])
    if @band_name.update_attributes(params.require(:band_name).permit(:id, :name, :user_id))
      redirect_to root_url
    end
  end

  def create
    new_band_name = BandName.new(params.require(:band_name).permit(:name))
    new_band_name.user = User.find(session[:user_id])

    if !new_band_name.save
      flash[:error] = new_band_name.errors.full_messages.to_sentence
    end
    redirect_to root_url
  end

  private

  def post_params
    params.require(:band_name).permit(:name, :user_id)
  end
end
