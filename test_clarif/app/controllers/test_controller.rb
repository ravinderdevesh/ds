class TestController < ApplicationController
  def test
  	puts Clarifai::Rails::Detector.new("http://kingofwallpapers.com/apple-fruit/apple-fruit-003.jpg").image.tags_with_percent

  end
end
