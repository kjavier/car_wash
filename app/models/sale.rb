# frozen_string_literal: true

class Sale < ApplicationRecord
  include SaleState

  TRUCK = 'Truck'
  MUDDY_BED_FEE = 2

  before_save :set_amount
  after_create { pend! }

  paginates_per 10

  belongs_to :vehicle
  has_many :transitions, class_name: 'SaleTransition', autosave: false
  has_many :sale_transitions, class_name: 'SaleTransition', autosave: false

  accepts_nested_attributes_for :vehicle
  
  delegate :license_plate, :vehicle_type, to: :vehicle 
  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state_machine

  validates_with BedValidator 
  
  def state_machine
    @state_machine ||= SaleStateMachine.new(self, transition_class: SaleTransition,
                                            association_name: :transitions)
  end

  private

  def set_amount
    self.amount = vehicle_type.price
    self.amount = amount + MUDDY_BED_FEE if vehicle_type.name == TRUCK && has_mud_on_bed
    
    sales = Sale.joins(:vehicle).where(vehicles: { license_plate: license_plate }).count

    self.amount = (amount / 2) if sales == 1 
  end
end
