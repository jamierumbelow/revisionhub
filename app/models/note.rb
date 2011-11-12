class Note < ActiveRecord::Base
  belongs_to :university
  has_and_belongs_to_many :tags
  
  define_indexes do
    indexes :title
  end
end
