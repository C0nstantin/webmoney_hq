#
#
#
#  class HqStatistic < WebmoneyHq::Hq
#     option {id:1, description:"Test description", counter: Proc.new{ |daterequest| Isue.where()}
#
#     option {id:2, description: "test2", counter: "files_requests"}
#
#
#
#     def files_requests(daterequest)
#       #do some thing
#       #return integer count
#     end
#
#
#  end
#
#


module WebmoneyHq

  class  Hq

    @@options = []

    def initialize(daterequest="")
      if daterequest.blank? or daterequest.to_date > Date.today
        @daterequest=DateTime.now.to_date
      else
        @daterequest=daterequest.to_date
      end
    end

    class <<self

      def option(id, description, defenition)

        @@options << {
          id: id.to_i,
          description: description.to_s,
          def: defenition
        }
      end

      def create_request(date="")
        s = self.new(date.to_date)
        s.create_request
      end

      def update_request(date="")
        s = self.new(date.to_date)
        s.update_request
      end

      def create_last_request
        request = WebmoneyHq::Request.order(daterequest: :desc).first

        date = request.daterequest if request.present?

        if date.present?
          date = date + 1.day
        else
          date = WebmoneyHq.date_start
        end

        if date <= Date.yesterday

          s = self.new(date)
          s.create_request
        end
      end

      def rebuild_all_requests
        WebmoneyHq.date_start
      end
    end


    def activeuser
      WebmoneyHq::Ulog.distinct
    end

    def activeuser_daily
      self.activeuser.where(created_at: @daterequest-1.day..@daterequest)
    end

    def activeuser_weekly
      self.activeuser.where(created_at: @daterequest-1.week..@daterequest)
    end

    def activeuser_monthly
      self.activeuser.where(created_at: @daterequest-1.month..@daterequest)
    end

    def create_request

      Request.create!({
        daterequest: @daterequest,
        activeuser_daily: self.activeuser_daily,
        activeuser_weekly: self.activeuser_weekly,
        activeuser_monthly: self.activeuser_monthly,
      })

      @@options.each do |opt|
        Item.create!(
          daterequest: @daterequest,
          description: opt[:description],
          count: self.send(opt[:def],@daterequest),
          operation_id: opt[:id],
        )
      end
    end

    def update_request
      request = Request.find_by(daterequest:@daterequest);
      request.destroy if request.present?
      self.create_request
    end

    def get_request
      Request.find_by(datereqeust: @daterequest)
    end
  end

end
