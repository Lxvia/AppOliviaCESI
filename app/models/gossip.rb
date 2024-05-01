class Gossip < ApplicationRecord
    validates :title, presence: true, length: {in: 3..14}
    validates :content, presence: true
    belongs_to :user
    has_many :comments
    #has_many :users, through :comments
    has_and_belongs_to_many :tags
    has_many :likes

    def city
        self.user.city
    end

end