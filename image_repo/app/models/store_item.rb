class StoreItem < ApplicationRecord
    validates :imageurl, presence: true, uniqueness: true
    attr_accessor :imageupload
end
