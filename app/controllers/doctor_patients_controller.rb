class DoctorPatientsController < ApplicationController


  def destroy
    doc_pat = DoctorPatient.find(params[:id])
    doc = doc_pat.doctor
    hos = doc.hospital
    doc_pat.destroy
    redirect_to hospital_doctor_path(hos, doc)
  end
end
