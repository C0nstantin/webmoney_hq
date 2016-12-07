module WebmoneyHq

  mattr_accessor :http_authentication_key
  @@http_authentication_key = nil

  mattr_accessor :sitename
  @@sitename = ""

  mattr_accessor :siteurl
  @@siteurl = ""

  mattr_accessor :masterwmid
  @@masterwmid = ""

  mattr_accessor :date_start
  @@date_start = Date.new(2016)

#  mattr_accessor :hq_quid
#  @@hq_quid = ""

  def self.setup
    yield self
  end

end
