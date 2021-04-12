require_relative 'patient_repository'
require_relative 'room_repository'

repo_rooms = RoomRepository.new('rooms.csv')

repo_patients = PatientRepository.new('patients.csv', repo_rooms)

p repo.all
