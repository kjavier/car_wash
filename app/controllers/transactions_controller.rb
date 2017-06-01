# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :load_step, except: %i[index validate_license_plate validate_step]

  def index; end

  def validate_step
    session[:sale_params] ||= {}
    session[:sale_params] = session[:sale_params].merge(sale_params)
    @step = process_step(current_step)

    if @step.valid?
      next_step = next_step(current_step)
      create && return unless next_step
      redirect_to action: next_step
    else
      render current_step
    end
  end

  def create
    if @step.sale.save
      session[:sale_params] = nil
      redirect_to root_path, notice: 'Transaction succesfully saved!'
    else
      redirect_to action: SaleFormModel::STEPS.first, alert: 'A problem occured while saving this transaction.'
    end
  end

  private

  def load_step
    @step = process_step(action_name)
  end

  def next_step(step)
    SaleFormModel::STEPS[SaleFormModel::STEPS.index(step) + 1]
  end

  def process_step(step)
    raise InvalidStep unless step.in?(SaleFormModel::STEPS)

    "SaleFormModel::#{step.camelize}".constantize.new(session[:sale_params])
  end

  def sale_params 
    params.require(:sale).permit(vehicle_attributes: [:license_plate])
  end

  def current_step
    params[:current_step]
  end
end
