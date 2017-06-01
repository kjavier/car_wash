module SaleState
  def pend!
    transition_to!(:pending)
  end

  def start!
    transition_to!(:started)
  end

  def finish!
    transition_to!(:finished)
  end

  def pay!
    transition_to!(:paid)
  end
end
