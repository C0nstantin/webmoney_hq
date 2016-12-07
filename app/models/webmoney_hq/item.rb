module WebmoneyHq
  class Item < ApplicationRecord
    validates :operation_id, uniqueness:{ scope: :daterequest }
    validates :operation_id, presence: true
    validates :count, presence: true
    validates :description,  presence: true
    belongs_to :request, primary_key: :daterequest, foreign_key: :daterequest
  end
end
