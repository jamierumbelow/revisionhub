class Course < ActiveRecord::Base
  belongs_to :university
  has_many :notes
  
  define_index do
    indexes :name
  end
end
