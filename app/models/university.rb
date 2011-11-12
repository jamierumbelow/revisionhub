class University < ActiveRecord::Base
  has_many :notes
  
  define_index do
    indexes :name
  end
end