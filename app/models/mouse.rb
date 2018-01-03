class Mouse < ApplicationRecord
  enum status: ['live', 'harvested']
end
