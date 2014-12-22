class BandNamesController < ApplicationController

  def index
    @band_name = BandName.new
    @band_names = BandName.all.reverse
  end

  def create
    @band_name = BandName.new(post_params).save!
    redirect_to root_url
  end

  private

  def post_params
    params.require(:band_name).permit(:name)
  end
end
