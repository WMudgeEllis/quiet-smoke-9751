class DoctorPatientsController < ApplicationController


  def destroy
    doc_pat = DoctorPatient.find(params[:id])
    doc = doc_pat.doctor
    doc_pat.destroy
    redirect_to doctor_path(doc)
  end
end
