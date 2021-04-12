class Patient

  attr_reader :name
  attr_accessor :room, :id

  def initialize(args)
    @name = args[:name]
    @cured = args[:cured] || false
  end

  def cure!
    @cured = true
  end
end

#
patient = Patient.new(name: "Oliver")
