class Tag < ActiveRecord::Base
  has_and_belongs_to_many :notes
  
  define_index do
    indexes :name
  end
end
