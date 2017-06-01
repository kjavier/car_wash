# frozen_string_literal: true

class Sale < ApplicationRecord
  include SaleState

  after_create { pend! }

  paginates_per 10

  belongs_to :vehicle
  has_many :transitions, class_name: 'SaleTransition', autosave: false
  has_many :sale_transitions, class_name: 'SaleTransition', autosave: false

  accepts_nested_attributes_for :vehicle
  
  delegate :license_plate, :vehicle_type, to: :vehicle 
  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state_machine

  def state_machine
    @state_machine ||= SaleStateMachine.new(self, transition_class: SaleTransition,
                                            association_name: :transitions)
  end
end
