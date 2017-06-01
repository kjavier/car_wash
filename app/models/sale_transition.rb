# frozen_string_literal: true

class SaleTransition < ApplicationRecord
  include Statesman::Adapters::ActiveRecordTransition

  belongs_to :sale, inverse_of: :sale_transitions

  after_destroy :update_most_recent, if: :most_recent?

  private

  def update_most_recent
    last_transition = sale.sale_transitions.order(:sort_key).last
    return unless last_transition.present?
    last_transition.update_column(:most_recent, true)
  end
end
