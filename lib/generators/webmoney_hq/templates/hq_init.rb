WebmoneyHq.setup do |config|

# http_authentication_key  == token from hq
  config.http_authentication_key = ''

#site name
  config.sitename = "Test site"

#url for service
  config.siteurl = "https://example.webmoney.ru"

#wmid service's owner
  config.masterwmid = "101010101010"

  config.date_start = Date.new(2014)
end
