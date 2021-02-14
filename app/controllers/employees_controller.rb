class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @user = User.new
  end

  def create
    @user = User.create!(email: params[:user][:email], password: params[:user][:password], name: params[:user][:name], cpf: params[:user][:cpf], number: params[:user][:number], user_type: 0 )
    @employee = Employee.new(user: @user)
    @employee.company = @employee.user.email.split('@')[1]

    if Company.exists?(@employee.company)
      if @employee.save
        redirect_to vacancies_path
      else
        render :new
      end
    else
      @employee.save
      redirect_to new_company_path
    end
  end
end