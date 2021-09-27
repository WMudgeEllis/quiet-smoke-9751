require "rails_helper"


RSpec.describe 'doctor show page' do
  it 'story 1' do
    hospital = Hospital.create!(name: 'Chop Shop')
    doctor = hospital.doctors.create!(name: 'Franken', specialty: 'Stitching', university: 'School of Hard Knocks')
    patient_1 = doctor.patients.create!(name: "Monst3r", age: 5)
    patient_2 = doctor.patients.create!(name: "Roberto", age: 35)

    visit hospital_doctor_path(hospital, doctor)

    expect(page).to have_content(hospital.name)
    expect(page).to have_content(doctor.name)
    expect(page).to have_content(doctor.specialty)
    expect(page).to have_content(doctor.university)

    within('#patients') do
      expect(page).to have_content(patient_1.name)
      expect(page).to have_content(patient_2.name)
    end
  end

  it 'story 3' do
    hospital = Hospital.create!(name: 'Chop Shop')
    doctor = hospital.doctors.create!(name: 'Franken', specialty: 'Stitching', university: 'School of Hard Knocks')
    patient_1 = doctor.patients.create!(name: "Monst3r", age: 5)
    patient_2 = doctor.patients.create!(name: "Roberto", age: 35)

    visit hospital_doctor_path(hospital, doctor)

    within("#patient-#{patient_1.id}") do
      click_button 'remove patient'
    end

    expect(current_path).to eq(hospital_doctor_path(hospital, doctor))
    expect(page).to_not have_content(patient_1.name)
  end
end
