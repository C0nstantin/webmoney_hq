require 'test_helper'

module WebmoneyHq
  class RequestTest < ActiveSupport::TestCase
    def setup
      @request = Request.create(
        daterequest: Date.today,
        activeuser_daily:   1,
        activeuser_weekly:  2,
        activeuser_monthly: 2,
      )

    end

    test "Request is valid" do

      assert @request.valid?, "Post not save valid!"
    end

    test "Request double date" do

      request2 = Request.create({
        daterequest: Date.today,
        activeuser_daily:  1,
        activeuser_weekly: 2,
        activeuser_monthly: 2,
      })
      assert request2.invalid?
      assert_not_nil request2.errors[:daterequest]
    end

  end
end
