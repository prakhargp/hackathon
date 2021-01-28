class Vote < ApplicationRecord
  belongs_to :employee
  belongs_to :challenge
end
