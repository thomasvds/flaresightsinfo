class Lead < ActiveRecord::Base
  validates :email, format: { with: /@/ }
end
