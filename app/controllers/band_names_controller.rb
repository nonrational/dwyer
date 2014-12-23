class BandNamesController < ApplicationController

  def index
    @band_name = BandName.new
    @band_names = BandName.all.reverse
  end

  def create
    new_band_name = BandName.new(post_params)
    new_band_name.user = User.find(session[:user_id])

    if !new_band_name.save
      flash[:error] = new_band_name.errors.full_messages.to_sentence
    end
    redirect_to root_url
  end

  private

  def post_params
    params.require(:band_name).permit(:name)
  end
end
