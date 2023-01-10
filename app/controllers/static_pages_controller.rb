require "flickr"

class StaticPagesController < ApplicationController
  def search
    if params.has_key? "flickr_id"
      init_flickr
      responseList = @flickr.people.getPhotos api_key: @flickr_key,
        user_id: params[:flickr_id]
      @results = responseList.map do |result|
        result_hash = result.to_hash
        result_hash[:url] = Flickr.url(result)
        result_hash
      end
    end
  end

  private

  def init_flickr
    @flickr_key = Rails.application.credentials.flickr_key
    @flickr = Flickr.new(@flickr_key,
      Rails.application.credentials.flickr_secret)
  end
end
