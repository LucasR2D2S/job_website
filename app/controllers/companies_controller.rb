class CompaniesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create!(name: params[:name], cnpj: params[:cnpj], address: params[:address], avatar: params[:avatar])

    if @company.save
      redirect_to vacancies_path
    else
      render :new
    end
  end
end