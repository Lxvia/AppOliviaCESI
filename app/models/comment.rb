class Comment < ApplicationRecord
    validates :content, presence: true, length: {in:3..400}
    belongs_to :user
    belongs_to :gossip
end
