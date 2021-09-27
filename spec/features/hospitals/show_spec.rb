require "rails_helper"

RSpec.describe 'hospital show page' do
  it 'story 2' do
    hospital = Hospital.create!(name: 'Chop Shop')
    doctor_1 = hospital.doctors.create!(name: 'Franken', specialty: 'Stitching', university: 'School of Hard Knocks')
    doctor_2 = hospital.doctors.create!(name: 'Stein', specialty: 'Bolting', university: 'School of Hard Knocks')
    doctor_3 = hospital.doctors.create!(name: 'Igor', specialty: 'Digging', university: 'Henchmans Academy')
    doctor_4 = hospital.doctors.create!(name: 'Meridith Grey', specialty: 'Surgery', university: 'That one Ivy League School')

    visit hospital_path(hospital)

    expect(page).to have_content(hospital.name)
    expect(page).to have_content('Number of doctors: 4')
    expect(page).to have_content(doctor_1.university, count: 1)
    expect(page).to have_content(doctor_3.university)
    expect(page).to have_content(doctor_4.university)
  end
end
