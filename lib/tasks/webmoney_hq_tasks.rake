# desc "Explaining what the task does"
# task :webmoney_hq do
#   # Task goes here
# end
#
namespace :hq do

  desc "Create request for last date"
  task :create_last_request => :environment do

    Hq.create_last_request

  end

  desc "Build all requests"
  task :build_all => :environment do
    while Hq.create_last_request do; end
  end

  desc "Rebuild all request"
  task :rebuild_all => :environment do
    (WebmoneyHq.date_start .. Date.yesterday).each do |date|
      Hq.update_request date
    end
  end
end
