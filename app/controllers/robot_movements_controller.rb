class RobotMovementsController < ApplicationController
  before_action :set_robot_movement, only: [:show, :edit, :update, :destroy]

  # GET /robot_movements
  # GET /robot_movements.json
  def index
    @robot_movements = RobotMovement.all
  end

  # GET /robot_movements/1
  # GET /robot_movements/1.json
  def show
  end

  # GET /robot_movements/new
  def new
    @robot_movement = RobotMovement.new
  end

  # GET /robot_movements/1/edit
  def edit
  end

  # POST /robot_movements
  # POST /robot_movements.json
  def create
    @robot_movement = RobotMovement.new(robot_movement_params)

    respond_to do |format|
      if @robot_movement.save
        format.html { redirect_to @robot_movement, notice: 'Robot movement was successfully created.' }
        format.json { render :show, status: :created, location: @robot_movement }
      else
        format.html { render :new }
        format.json { render json: @robot_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /robot_movements/1
  # PATCH/PUT /robot_movements/1.json
  def update
    respond_to do |format|
      if @robot_movement.update(robot_movement_params)
        format.html { redirect_to @robot_movement, notice: 'Robot movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @robot_movement }
      else
        format.html { render :edit }
        format.json { render json: @robot_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robot_movements/1
  # DELETE /robot_movements/1.json
  def destroy
    @robot_movement.destroy
    respond_to do |format|
      format.html { redirect_to robot_movements_url, notice: 'Robot movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robot_movement
      @robot_movement = RobotMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def robot_movement_params
      params.require(:robot_movement).permit(:robot_id, :movement_id)
    end
end
