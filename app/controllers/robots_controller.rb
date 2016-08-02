class RobotsController < ApplicationController
  before_action :set_robot, only: [:show, :edit, :update, :destroy, :place, :move, :left, :right]


  # GET /robots
  # GET /robots.json
  def index
    @robots = Robot.all
  end

  # GET /robots/1
  # GET /robots/1.json
  def show
    @track
  end

  # GET /robots/new
  def new
    @robot = Robot.new
  end

  # GET /robots/1/edit
  def edit
  end

  # POST /robots
  # POST /robots.json
  def create
    @robot = Robot.new(robot_params)
    respond_to do |format|
      if @robot.save
        format.html { redirect_to @robot, notice: 'Robot was successfully created.' }
        format.json { render :show, status: :created, location: @robot }
      else
        format.html { render :new }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /robots/1
  # PATCH/PUT /robots/1.json
  def update
    respond_to do |format|
      if @robot.update(robot_params)
        format.html { redirect_to @robot, notice: 'Robot was successfully updated.' }
        format.json { render :show, status: :ok, location: @robot }
      else
        format.html { render :edit }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robots/1
  # DELETE /robots/1.json
  def destroy
    @robot.destroy
    respond_to do |format|
      format.html { redirect_to robots_url, notice: 'Robot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def place
    if (params[:x].to_i >= 0) && (params[:x].to_i <= 4) && (params[:y].to_i >= 0) && (params[:y].to_i <= 4)
      @robot.x = params[:x].to_i
      @robot.y = params[:y].to_i
      if params[:f].present?
        @robot.f = params[:f]
      else
        @robot.f = "EAST"
      end
      # If @robot has any movements attached to it, it will delete all the movements attached to it and create a new one.
      if @robot.movements.present?
        @robot.movements.each(&:destroy) # Delete all movements attached to the @robot.
      end
      @position = ['PLACE ', @robot.x, ', ', @robot.y, ', ', @robot.f].compact.join('')
      @new_movement = Movement.create!(name: @position)
      @robot.movements << @new_movement
      @robot.save!
    end
    redirect_to @robot
  end

  def move
    if (@robot.f == "NORTH") && (@robot.y < 4)
      @robot.y += 1
      @new_movement = Movement.create!(name: 'MOVE ')
      @robot.movements << @new_movement
      @robot.save!
    elsif (@robot.f == "SOUTH") && (@robot.y > 0)
      @robot.y -= 1
      @new_movement = Movement.create!(name: 'MOVE ')
      @robot.movements << @new_movement
      @robot.save!
    elsif (@robot.f == "EAST") && (@robot.x < 4)
      @robot.x += 1
      @new_movement = Movement.create!(name: 'MOVE ')
      @robot.movements << @new_movement
      @robot.save!
    elsif (@robot.f == "WEST") && (@robot.x > 0)
      @robot.x -= 1
      @new_movement = Movement.create!(name: 'MOVE ')
      @robot.movements << @new_movement
      @robot.save!
    end
    redirect_to @robot
  end

  def left
    if @robot.f == "NORTH"
      @robot.f = "WEST"
      @new_movement = Movement.create!(name: 'LEFT ')
      @robot.movements << @new_movement
      @robot.save!
    elsif @robot.f == "WEST"
      @robot.f = "SOUTH"
      @new_movement = Movement.create!(name: 'LEFT ')
      @robot.movements << @new_movement
      @robot.save!
    elsif @robot.f == "SOUTH"
      @robot.f = "EAST"
      @new_movement = Movement.create!(name: 'LEFT ')
      @robot.movements << @new_movement
      @robot.save!
    elsif @robot.f == "EAST"
      @robot.f = "NORTH"
      @new_movement = Movement.create!(name: 'LEFT ')
      @robot.movements << @new_movement
      @robot.save!
    end
    redirect_to @robot
  end

  def right
    if @robot.f == "NORTH"
      @robot.f = "EAST"
      @new_movement = Movement.create!(name: 'RIGHT ')
      @robot.movements << @new_movement
      @robot.save!
    elsif @robot.f == "EAST"
      @robot.f = "SOUTH"
      @new_movement = Movement.create!(name: 'RIGHT ')
      @robot.movements << @new_movement
      @robot.save!
    elsif @robot.f == "SOUTH"
      @robot.f = "WEST"
      @new_movement = Movement.create!(name: 'RIGHT ')
      @robot.movements << @new_movement
      @robot.save!
    elsif @robot.f == "WEST"
      @robot.f = "NORTH"
      @new_movement = Movement.create!(name: 'RIGHT ')
      @robot.movements << @new_movement
      @robot.save!
    end
    redirect_to @robot
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robot
      @robot = Robot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def robot_params
      params.require(:robot).permit(:x, :y, :f)
    end
end
