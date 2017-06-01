class SaleStateMachine 
  include Statesman::Machine

  state :incomplete, initial: true
  state :pending
  state :started
  state :finished
  state :paid
  
  transition from: :incomplete, to: :pending
  transition from: :pending, to: :started
  transition from: :started, to: :finished
  transition from: :finished, to: :paid
end
