class PhasesController < ApplicationController
  def index
    @phases = Phase.all
  end

  def show
    @phases = Phase.find(params[:id])
  end
end
