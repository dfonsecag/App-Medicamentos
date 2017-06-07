class ProFar < ActiveRecord::Base
  belongs_to :farmacia
  belongs_to :producto
  belongs_to :disponibiliad
end
