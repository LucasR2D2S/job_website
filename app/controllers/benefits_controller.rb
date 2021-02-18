class BenefitsController < ApplicationController
  def new
    @benefit = Benefit.new
  end

  def create
    @benefit = Benefit.create!(name: params[:name])
    @benefit.save
  end
end