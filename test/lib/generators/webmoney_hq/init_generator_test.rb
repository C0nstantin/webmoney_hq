require 'test_helper'
require 'generators/webmoney_hq/install_generator'

module WebmoneyHq
  class InstallGeneratorTest < Rails::Generators::TestCase
    tests WebmoneyHq::Generators::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

     #test "generator runs without errors" do
     #  assert_nothing_raised do
     #    run_generator ["hq"]
     #  end
     #end
  end
end
