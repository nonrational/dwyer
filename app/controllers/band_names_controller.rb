class BandNamesController < ApplicationController

  def index
  end

  def create
    @band_name = BandName.new(params[:band_name])

    @band_name.save
    redirect_to
  end
end
