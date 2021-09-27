class HospitalsController < ApplicationController

  def show
    @hospital = Hospital.find(params[:id])
    @num_doctors = @hospital.doctors.count
    @uniq_uni = @hospital.uniq_uni
  end

end
