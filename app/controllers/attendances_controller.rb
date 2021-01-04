class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show edit update destroy]

  # GET /attendances
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  def show
    @event = Event.find(@attendance.event_id)
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @attendance.user_id = current_user.id
    # @attendance.event_id = current_event.id
  end

  # GET /attendances/1/edit
  def edit; end

  # POST /attendances
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user_id = current_user.id
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /attendances/1
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /attendances/1
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id)
  end
end
