require 'csv'
require_relative 'room'

class RoomRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    @next_id = 1
    load_csv
  end

  def all
    @rooms
  end

  def add(room)
    room.id = @next_id
    @rooms << room
    @next_id += 1
    save_to_csv
    # first we add the room in ruby memory
    # we need to add the id
    # secondly we add the rooms array to the csv
  end

  def find(id)
    @rooms.find {|room| room.id == id}
  end


  private

  def save_to_csv
    # TODO
  end


  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:capacity] = row[:capacity].to_i  # Convert column to boolean
      @rooms << Room.new(row)
    end
    @next_id = @rooms.last.id + 1 unless @rooms.empty?
  end
end
