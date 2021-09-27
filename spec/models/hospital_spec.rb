require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  it 'unique universities' do
    hospital = Hospital.create!(name: 'Chop Shop')
    doctor_1 = hospital.doctors.create!(name: 'Franken', specialty: 'Stitching', university: 'School of Hard Knocks')
    doctor_2 = hospital.doctors.create!(name: 'Stein', specialty: 'Bolting', university: 'School of Hard Knocks')
    doctor_3 = hospital.doctors.create!(name: 'Igor', specialty: 'Digging', university: 'Henchmans Academy')
    doctor_4 = hospital.doctors.create!(name: 'Meridith Grey', specialty: 'Surgery', university: 'That one Ivy League School')

    expect(hospital.uniq_uni).to eq([doctor_1.university, doctor_3.university, doctor_4.university])
  end
end
