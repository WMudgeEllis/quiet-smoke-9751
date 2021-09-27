require "rails_helper"

RSpec.describe 'patient index page' do
  it 'extension' do
    patient_1 = Patient.create!(name: 'Jo Jo', age: 17)
    patient_2 = Patient.create!(name: 'Jo Jo Jr', age: 7)
    patient_3 = Patient.create!(name: 'SR', age: 27)

    visit patients_path

    expect(patient_3.name).to appear_before(patient_1.name)
    expect(patient_3.name).to appear_before(patient_2.name)
    expect(patient_1.name).to appear_before(patient_2.name)

  end
end
