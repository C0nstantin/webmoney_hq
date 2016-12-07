require 'test_helper'

module WebmoneyHq
  class ItemTest < ActiveSupport::TestCase
    def setup
      @item = Item.create(
        daterequest:  Date.today,
        operation_id: 2,
        description: 'TEST DESCRIPTION',
        count: 0
      )

    end

    test "Item is valid" do

      assert @item.valid?, "valid Item not save!"
    end

    test "Items double date" do

      item2 = Item.create({
        daterequest: Date.today,
        operation_id: 2,
        description: '2 TEST DESCRIPTION',
        count: 2
      })
      assert item2.invalid?
      assert_not_nil item2.errors[:daterequest]
    end

  end
end
