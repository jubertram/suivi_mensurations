class PhasesController < ApplicationController
  def index
    @phases = Phase.all
  end

  def show
    @phase = Phase.find(params[:id])
  end

  def new
    @phase = Phase.new
  end

  def create
    @phase = Phase.new(phase_params)
    @phase.user = current_user
    @phase.ended_date = @phase.started_date + @phase.period
    if @phase.save!
      redirect_to phases_path, notice: 'une nouvelle phase commence'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @phase = Phase.find(params[:id])
  end

  def update
    @phase = Phase.find(params[:id])
    @phase.update(phase_params)

    redirect_to phases_path
  end

  private

  def phase_params
    params.require(:phase).permit(:phase_type, :period, :started_date)
  end
end
