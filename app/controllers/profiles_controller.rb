class ProfilesController < ApplicationController

  def new
    @user = User.find_by(id: params[:id])
    @profile = Profile.new
  end

  def create

    @user = User.find(params[:id])
    @profile = Profile.new(profile_params)
    @profile.user_id = @user.id

    if @profile.save
      flash[:message] = "Your account was saved successfully"
      redirect_to artists_path
    else
      flash[:message] = "Something bad happened"
      render 'new'
    end

  end



  private
  def profile_params
    params.require(:profile).permit(:top_collection, :website_url,
                                    :primary_medium, :headshot, :user_id)
  end


end
