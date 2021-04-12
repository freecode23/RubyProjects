require_relative 'patient'

require 'csv'

class PatientRepository

  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def all
    @patients
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_to_csv
    # first we add the patient in ruby memory
    # we need to add the id
    # secondly we add the patients array to the csv
  end


  private

  def save_to_csv
    # TODO
  end


  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean

      row[:room] = @room_repository.find(row[:room_id].to_i) # should return the room instance
      patient = Patient.new(row)
    end
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
end
