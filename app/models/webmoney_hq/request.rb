module WebmoneyHq
  class Request < ApplicationRecord
    validates :daterequest,  uniqueness: true
    has_many :items, primary_key: :daterequest, foreign_key: :daterequest, dependent: :destroy

    def operations
      oper = 0
      self.items.each do |i|
        if i.canaggregate != false
          oper += i.count
        end
      end
      oper
    end

  end
end
