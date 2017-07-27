class Record
  include Mongoid::Document

  field :name, type: String
  field :object, type: String
  field :object_id, type: Integer
  field :slug, type: String
  field :uri, type: String
  
end