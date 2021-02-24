class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
    @user = User.new
  end

  def create
    @user = User.create!(email: params[:user][:email], password: params[:user][:password], name: params[:user][:name], cpf: params[:user][:cpf], number: params[:user][:number], user_type: 10 )
    @candidate = Candidate.new(user: @user, college: params[:college], wins: params[:wins], biography: params[:biography])

    if @candidate.save
      redirect_to vacancies_path
    else
      render :new
    end
  end
end