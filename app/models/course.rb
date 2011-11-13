class Course < ActiveRecord::Base
  belongs_to :university
  has_many :notes
  
  define_indexes do
    indexes :name
  end
end
