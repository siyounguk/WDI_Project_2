class RigsController < ApplicationController
  before_action :set_rig, only: [:show, :edit, :update, :destroy]

  def add_new_comment



    @rig = Rig.find(params[:id])
    @comment = Comment.new(comment_params);
    @comment.user = current_user;
    @comment.save
    @rig.comments << @comment

    redirect_to rig_path(@rig)
  end

  def upvote
    @rig = Rig.find(params[:id])
    @rig.upvote_by current_user
    redirect_to rigs_path
    @user = current_user
  end
  # GET /rigs
  # GET /rigs.json
  def index
    @rigs = Rig.all
  end

  # GET /rigs/1
  # GET /rigs/1.json
  def show
  end

  # GET /rigs/new
  def new
    @rig = Rig.new
  end

  # GET /rigs/1/edit
  def edit
  end

  # POST /rigs
  # POST /rigs.json
  def create
    @rig = current_user.rigs.new(rig_params)

    # Rig.new(rig_params)

    

    respond_to do |format|
      if @rig.save
        format.html { redirect_to @rig, notice: 'Rig was successfully created.' }
        format.json { render :show, status: :created, location: @rig }
      else
        format.html { render :new }
        format.json { render json: @rig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rigs/1
  # PATCH/PUT /rigs/1.json
  def update
    respond_to do |format|
      if @rig.update(rig_params)
        format.html { redirect_to @rig, notice: 'Rig was successfully updated.' }
        format.json { render :show, status: :ok, location: @rig }
      else
        format.html { render :edit }
        format.json { render json: @rig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rigs/1
  # DELETE /rigs/1.json
  def destroy
    @rig.destroy
    respond_to do |format|
      format.html { redirect_to rigs_url, notice: 'Rig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rig
      @rig = Rig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rig_params
      params.require(:rig).permit(:guitarist, :guitarist_photo,:rig_photo, :description, :comments, :user_id, :genre_id, :username, pedal_ids:[])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :comment)
    end
end
