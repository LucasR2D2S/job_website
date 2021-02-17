class Company < ApplicationRecord
  has_one_attached :avatar

  def company_email?(email)
    Company.exists?(company_email: email)
  end
end
