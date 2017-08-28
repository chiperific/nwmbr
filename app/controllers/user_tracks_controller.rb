class UserTracksController < ApplicationController
  before_action :set_user_track, only: [:show, :edit, :update, :destroy]

  # GET /user_tracks
  # GET /user_tracks.json
  def index
    @user_tracks = UserTrack.all
  end

  # GET /user_tracks/1
  # GET /user_tracks/1.json
  def show
  end

  # GET /user_tracks/new
  def new
    @user_track = UserTrack.new
  end

  # GET /user_tracks/1/edit
  def edit
  end

  # POST /user_tracks
  # POST /user_tracks.json
  def create
    @user_track = UserTrack.new(user_track_params)

    respond_to do |format|
      if @user_track.save
        format.html { redirect_to @user_track, notice: 'User track was successfully created.' }
        format.json { render :show, status: :created, location: @user_track }
      else
        format.html { render :new }
        format.json { render json: @user_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_tracks/1
  # PATCH/PUT /user_tracks/1.json
  def update
    respond_to do |format|
      if @user_track.update(user_track_params)
        format.html { redirect_to @user_track, notice: 'User track was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_track }
      else
        format.html { render :edit }
        format.json { render json: @user_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tracks/1
  # DELETE /user_tracks/1.json
  def destroy
    @user_track.destroy
    respond_to do |format|
      format.html { redirect_to user_tracks_url, notice: 'User track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_track
      @user_track = UserTrack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_track_params
      params.require(:user_track).permit(:user_id, :role)
    end
end
