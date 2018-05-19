class User < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_many :messages, dependent: :destroy
    validates :username, :presence => true, length: { minimum: 5 }
end
