require "rails_helper"

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  it 'can find doctor patient' do
    hospital = Hospital.create!(name: 'Chop Shop')
    doctor = hospital.doctors.create!(name: 'Franken', specialty: 'Stitching', university: 'School of Hard Knocks')
    patient_1 = Patient.create!(name: "Monst3r", age: 5)
    patient_2 = Patient.create!(name: "Yada", age: 10)

    expected = DoctorPatient.create!(doctor: doctor, patient: patient_1)
    DoctorPatient.create!(doctor: doctor, patient: patient_2)

    expect(patient_1.find_doctor_patient(doctor.id)).to eq(expected)
  end

  it 'can sort patients by age descending' do
    patient_1 = Patient.create!(name: 'Jo Jo', age: 17)
    patient_2 = Patient.create!(name: 'Jo Jo Jr', age: 7)
    patient_3 = Patient.create!(name: 'Jo Jo Sr', age: 27)

    expect(Patient.age_order).to eq([patient_3, patient_1, patient_2])
  end
end
