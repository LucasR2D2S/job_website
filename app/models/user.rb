class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: { employee: 0, employee_admin: 5, candidate: 10 }

  def admin?
    employee_admin?
  end

  def company_email
    self.email.split('@')[1]
  end

  def candidate_find(user)
    @candidate = Candidate.find_by!(user_id: user)
  end

  def employee_find(user)
    @employee = Employee.find_by!(user_id: user)
  end
end
