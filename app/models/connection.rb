class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :reference, class_name: "User"
end
