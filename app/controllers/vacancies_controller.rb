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
    
    if @vacancy.save
      redirect_to vacancies_path
    else
      @benefits = Benefit.all
      render :new
    end                          
  end

  private
    def vacancy_params
      params.require(:vacancy).permit(:title, :num_candidates, :salary, :local, :description, :requirements)
    end
end
