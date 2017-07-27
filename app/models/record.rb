class Record
  include Mongoid::Document
  
  field :name, type: String
  field :object, type: String
  field :local_id, type: Integer
  field :slug, type: String
  field :uri, type: String

  validates_presence_of :name, :object, :local_id
  validates_uniqueness_of :name
  
end
