class PhasesController < ApplicationController
  def index
    @phases = Phase.all
  end

  def show
    @phase = Phase.find(params[:id])
  end

  def new
    @phase = Phase.New
  end
end
