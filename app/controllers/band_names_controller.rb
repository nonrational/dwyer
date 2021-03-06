# frozen_string_literal: true

class BandNamesController < ApplicationController
  def index
    @band_name = BandName.new(session[:failed_band_name])
    session[:failed_band_name] = nil

    @band_names = visible_band_names.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    band_name
  end

  def edit
    band_name
  end

  def destroy
    if current_user && (current_user.admin? || current_user.owns?(band_name))
      flash[:notice] = "Deleted BandName/#{band_name.id}"
      band_name.destroy!
    else
      flash[:error] = "Hey! You can't do that, buddy."
    end

    redirect_to root_url
  end

  def update
    redirect_to root_url if band_name.update(update_params)
  end

  def create # rubocop:disable Metrics/AbcSize
    @band_name = BandName.new(create_params.merge(user: current_user))

    unless band_name.save
      session[:failed_band_name] = band_name
      flash[:error] = band_name.errors.full_messages.to_sentence
    end

    redirect_to root_url
  end

  private

  def visible_band_names
    current_user&.admin? ? BandName.all : BandName.where(public: true)
  end

  def create_params
    params.require(:band_name).permit(:name)
  end

  def update_params
    params.require(:band_name).permit(:id, :name, :public)
  end

  def post_params
    params.require(:band_name).permit(:name, :user_id)
  end

  def band_name
    @band_name ||= BandName.find(params[:id])
  end
end
