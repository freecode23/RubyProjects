require_relative 'patient'

class Room

  attr_reader :capacity, :patients
  attr_accessor :id

  def initialize(args)
    @capacity = args[:capacity] || 2
    @patients = args[:patients] || []
  end

  def add(patient)
    if @capacity == @patients.size
      fail "Room is at max capacity"
    else
      patient.room = self
      @patients << patient
    end
  end
end

p1 = Patient.new(name: "Peter")
p2 = Patient.new(name: "Susan")
room1 = Room.new(capacity: 4, patients: [p1, p2])

# p room1.patients

p3 = Patient.new(name: "Robert")
room1.add(p3)

p p3.room
