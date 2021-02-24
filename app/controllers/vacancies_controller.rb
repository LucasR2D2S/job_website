class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.all
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
    @benefits = Benefit.all
  end

  def create
    @vacancy = Vacancy.create!(vacancy_params)
    @company = Company.find_by! company_email: current_user.company_email
    @vacancy.company_name = @company.name
    
    if @vacancy.save
      redirect_to vacancies_path
    else
      @benefits = Benefit.all
      render :new
    end
  end

  def apply
    @vacancy = Vacancy.find(params[:id])
    @user = current_user
    #@vacancy.applicants.push(@user.candidate_find(@user))
    #@vacancy.applicants.include? @user.candidate_find(@user)
    #puts @vacancy.applicants.first
    redirect_to vacancies_path, notice: t('.success')
  end

  private
    def vacancy_params
      params.require(:vacancy).permit(:title, :num_candidates, :salary, :local, :description, :requirements)
    end
end
