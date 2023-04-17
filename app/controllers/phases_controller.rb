class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update destroy]

  def index
    @phases = Phase.all
  end

  def show
  end

  def new
    @phase = Phase.new
  end

  def create
    @phase = Phase.new(phase_params)
    @phase.user = current_user
    @phase.period ? @phase.started_date + @phase.period : nil

    if @phase.save!
      redirect_to phases_path, notice: 'une nouvelle phase commence'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @phase.update(phase_params)
    redirect_to phases_path
  end

  def destroy
    @phase.destroy
    redirect_to phases_path, status: :see_other
  end

  private

  def phase_params
    params.require(:phase).permit(:phase_type, :period, :started_date)
  end

  def set_phase
    @phase = Phase.find(params[:id])
  end
end
