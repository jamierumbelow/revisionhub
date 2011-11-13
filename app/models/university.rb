class University < ActiveRecord::Base
  has_many :courses
  
  define_indexes do
    indexes :name
  end
end