class Book < ActiveRecord::Base
  attr_accessible :id, :title

  self.include_root_in_json = true
end
