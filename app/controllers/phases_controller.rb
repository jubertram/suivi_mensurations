class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update destroy progress]
  helper_method :progress

  def index
    @phases = Phase.all.sort { |a, b| b.started_date <=> a.started_date }
    @last_phase = @phases.first
    @sorted_measurements = @last_phase.measurements.sort { |a, b| a.date <=> b.date }
    @last_measurement = @sorted_measurements.last

    @weights = @sorted_measurements.map { |m| m.weight }
  end

  def show
    @sorted_measurements = @phase.measurements.sort { |a, b| b.date <=> a.date }
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

  def round_float(num)
    num.to_s.split('.')[1] == '0' ? num.to_i : num
  end

  private

  def phase_params
    params.require(:phase).permit(:phase_type, :period, :started_date)
  end

  def set_phase
    @phase = Phase.find(params[:id])
  end

  def progress(new_data, previous_data, index, phase)
    previous_data = 0 if previous_data.nil?
    return unless index != phase.measurements.size - 1

    if new_data < previous_data
      "|  #{round_float((previous_data - new_data).round(1))} <span style='color: green;'>ᨆ</span>".html_safe
    elsif new_data > previous_data
      "|  #{round_float((new_data - previous_data).round(1))} <span style='color: red;'>ᨈ</span>".html_safe
    else
      "|  <span style='color: blue;'>=</span>".html_safe
    end
  end
end
