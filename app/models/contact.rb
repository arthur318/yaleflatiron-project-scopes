class Contact < ApplicationRecord
  belongs_to :company

  def company_name=(name)
    self.company = Company.find_or_create_by(name: name)
  end

  def company_name
    self.company ? self.company.name : nil
  end
end
