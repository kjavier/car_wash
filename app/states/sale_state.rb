module SaleState
  def pend!
    transition_to!(:pending)
  end

  def start!
    transition_to!(:started)
  end

  def finished!
    transition_to!(:finished)
  end

  def paid!
    transition_to!(:paid)
  end
end
