class BandNamesController < ApplicationController

  def index
    @band_name = BandName.new

    if current_user && current_user.admin?
      @band_names = BandName.all.limit(20)
    elsif current_user
      @band_names = BandName.where("public=true OR user_id=?", current_user.id).limit(20)
    else
      @band_names = BandName.where(public: true).limit(20)
    end

    @band_names = @band_names.reverse
  end

  def show
    @band_name = BandName.find(params[:id])
  end

  def edit
    @band_name = BandName.find(params[:id])
  end

  def destroy
    if current_user && current_user.admin?
      BandName.destroy(params[:id])
      flash[:notice] = "Deleted BandName/#{params[:id]}"
    else
      flash[:error] = "Hey! You can't do that, buddy."
    end
    redirect_to root_url
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
