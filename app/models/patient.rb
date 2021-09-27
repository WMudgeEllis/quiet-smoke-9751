class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients


  def find_doctor_patient(doctor_id)
    DoctorPatient.find_by(patient_id: id, doctor_id: doctor_id)
  end
end
