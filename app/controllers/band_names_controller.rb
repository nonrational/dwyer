class BandNamesController < ApplicationController

  def index
    @band_name = BandName.new

    if current_user && current_user.admin?
      @band_names = BandName.all
    elsif current_user
      @band_names = BandName.where("public=true OR owner.id=?", current_user.id)
    else
      @band_names = BandName.where(public: true)
    end

    @band_names = @band_names.reverse
  end

  def show
    @band_name = BandName.find(params[:id])
  end

  def update
    @band_name = BandName.find(params[:id])
    if @band_name.update_attributes(params.require(:band_name).permit(:id, :name, :public))
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
