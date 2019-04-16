class ApplicationRecord < ActiveRecord::Base
  acts_as_hashids
  self.abstract_class = true
end
