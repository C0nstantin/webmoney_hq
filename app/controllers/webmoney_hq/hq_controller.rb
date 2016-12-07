module WebmoneyHq
  class HqController < WebmoneyHq::ApplicationController

    before_action :check_permission

    def index
      if Date.parse(params[:lastupdate]) > Date.yesterday
        raise ApplicationController::BadRequest
      end

      @date_start =
        if params[:lastupdate].present?
          current = Date.parse(params[:lastupdate]) + 1.day
          current < WebmoneyHq.date_start ? WebmoneyHq.date_start : current
        else
          WebmoneyHq.date_start
        end

      @requests= Request.where(daterequest: @date_start-7.day .. @date_start)
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.send(:"wm.servicemonitor") do
          xml.metadate({
            sitename: WebmoneyHq.sitename,
            siteurl: WebmoneyHq.siteurl,
            sitexmlurl: "#{WebmoneyHq.siteurl}#{hq_path}",
            masterwmid: WebmoneyHq.masterwmid,
            actualdate: @date_start,
            encoding: "UTF-8"
          }) do
            @requests.each do |req|
              xml.request({
                daterequest: req.daterequest,
                activeuser_daily: req.activeuser_daily,
                activeuser_monthly: req.activeuser_monthly,
                activeuser_weekly:  req.activeuser_weekly,
                operations: req.operations,

              }) do
                req.items.each do |item|
                  xml.item({
                    count: item.count,
                    operation_id: item.operation_id,
                    daterequest:  item.daterequest,
                    description:  item.description
                  })
                end
              end
            end
          end
        end
      end
      render :xml => builder.to_xml
    end

    protected

    def check_permission
      return if Rails.env.development?
      raise ApplicationController::NotAuthorized if  params[:hash].blank?

      hash = Digest::MD5.hexdigest(params[:lastupdate].to_s + WebmoneyHq.http_authentication_key)
      raise ApplicationController::NotAuthorized  unless hash == params[:hash]
    end

  end
end
