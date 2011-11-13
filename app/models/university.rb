class University < ActiveRecord::Base
  has_many :courses
  
  define_index do
    indexes :name
  end
end