# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index; end

  def new
    @sale = Sale.new
    @sale.build_vehicle
  end
end
