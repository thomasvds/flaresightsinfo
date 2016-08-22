class PagesController < ApplicationController
  def home
    @lead = Lead.new
  end

  def register
    @lead = Lead.create(lead_params)
    SlackNotifierJob.perform_now(@lead)
    redirect_to root_path, notice: "Thanks! We'll get back to you soon."
  end

  def lead_params
    params.require(:lead).permit(:email)
  end

end
