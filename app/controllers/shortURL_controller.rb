class ShorturlsController < ApplicationController
    def create
        @url = ShortUrl.new(params.require(:url))

        @url.save
        redirect_to @url
    end

    def show
        @url = ShortUrl.find(params[:id])
    end

    def forward
    end
end
