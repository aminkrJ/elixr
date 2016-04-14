class Intake < ActiveRecord::Base
  belongs_to :unit
  belongs_to :nutrition_fact
end
