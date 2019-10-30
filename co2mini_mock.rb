class CO2miniMock
  public

  def initialize
    @handlers = {}
  end

  def read_once(read_type)
    read_type == :temp ? Random.rand(4) + 20 : Random.rand(100) + 500
  end

  def on(event, &block)
    @handlers[event] = block
  end

  def loop
    while true do
      Kernel.sleep(1)
      @handlers[:co2].call(:co2, self.read_once(:co2))
      Kernel.sleep(1)
      @handlers[:temp].call(:temp, self.read_once(:temp))
    end
  end
end