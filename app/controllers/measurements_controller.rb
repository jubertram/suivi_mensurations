class MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[destroy edit update]
  before_action :set_phase, only: %i[new create]

  def new
    @measurement = Measurement.new
  end

  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.phase = @phase
    @measurement.save
    redirect_to phases_path
  end

  def edit
  end

  def update
    @measurement.update(measurement_params)
    redirect_to phases_path
  end

  def destroy
    @measurement.destroy
    redirect_to phases_path, status: :see_other
  end

  private

  def set_phase
    @phase = Phase.find(params[:phase_id])
  end

  def measurement_params
    params.require(:measurement).permit(:date, :weight,
                                        :bras, :poitrine,
                                        :taille, :hanches,
                                        :cuisses, :epaules,
                                        :mollets, :glucides,
                                        :photo)
  end

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end
end
