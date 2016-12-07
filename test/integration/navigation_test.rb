require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test "route and exeptions" do

    get '/hq/request' , params: { lastupdate: '2016-12-12' }
    assert_response 403

    get '/hq/request', params:{
      lastupdate: '2014-01-01',
      hash: Digest::MD5.hexdigest('2014-01-01' + WebmoneyHq.http_authentication_key)
    }
    assert_response 200
    puts response.body

    get '/hq/request', params:{
      lastupdate: Date.tomorrow.to_s,
      hash: Digest::MD5.hexdigest(Date.tomorrow.to_s + WebmoneyHq.http_authentication_key)
    }
    assert_response 400
  end

  #test "xml return" do

  #end
end

