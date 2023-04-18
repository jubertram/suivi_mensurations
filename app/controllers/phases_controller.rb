class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update destroy progress]
  helper_method :progress

  def index
    @phases = Phase.all.sort { |a, b| b.started_date <=> a.started_date }
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

  def progress(data1, data2, index)
    data2 = 0 if data2.nil?
    return unless index != @phase.measurements.size - 1

    if data1 < data2
      "|  #{round_float((data2 - data1).round(1))} <span style='color: green;'>ᨆ</span>".html_safe
    elsif data1 > data2
      "|  #{round_float((data1 - data2).round(1))} <span style='color: red;'>ᨈ</span>".html_safe
    else
      "|  <span style='color: blue;'>=</span>".html_safe
    end
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
end
