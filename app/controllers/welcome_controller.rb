class WelcomeController < ApplicationController
    def create
        date = Date.strptime(params[:time], '%B %d, %Y')

        natural_time = date.strftime('%B %d, %Y')
        unix_time = date.strftime('%s')

        render json: { unix: unix_time, natural: natural_time }
    rescue ArgumentError
        begin
            date = Date.strptime(params[:time], '%s')

            natural_time = date.strftime('%B %d, %Y')
            unix_time = date.strftime('%s')

            render json: { unix: unix_time, natural: natural_time }

        rescue ArgumentError
            render json: { unix: nil, natural: nil}
        end
    end
end
