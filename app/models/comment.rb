class Comment < ActiveRecord::Base
  belongs_to :subscriber
end
