class PedalsController < ApplicationController
  before_action :set_pedal, only: [:show, :edit, :update, :destroy]

  def upvote
    @pedal = Pedal.find(params[:id])
    @pedal.upvote_by current_user
    redirect_to pedal_path
  end


  # GET /pedals
  # GET /pedals.json
  def index
    @pedals = Pedal.all.paginate(:page => params[:page])
  end

  # GET /pedals/1
  # GET /pedals/1.json
  def show
  end

  # GET /pedals/new
  def new
    @pedal = Pedal.new
  end

  # GET /pedals/1/edit
  def edit
  end

  # POST /pedals
  # POST /pedals.json
  def create
    @pedal = Pedal.new(pedal_params)

    respond_to do |format|
      if @pedal.save
        format.html { redirect_to @pedal, notice: 'Pedal was successfully created.' }
        format.json { render :show, status: :created, location: @pedal }
      else
        format.html { render :new }
        format.json { render json: @pedal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedals/1
  # PATCH/PUT /pedals/1.json
  def update
    respond_to do |format|
      if @pedal.update(pedal_params)
        format.html { redirect_to @pedal, notice: 'Pedal was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedal }
      else
        format.html { render :edit }
        format.json { render json: @pedal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedals/1
  # DELETE /pedals/1.json
  def destroy
    @pedal.destroy
    respond_to do |format|
      format.html { redirect_to pedals_url, notice: 'Pedal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedal
      @pedal = Pedal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedal_params
      params.require(:pedal).permit(:name, :type, :pedal_photo, :price_paid, :review, :rig_id, :user_id)
    end
end
