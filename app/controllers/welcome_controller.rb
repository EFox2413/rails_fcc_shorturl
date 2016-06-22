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

    def getHeader
        ip = request.remote_ip
        lang = request.env["HTTP_ACCEPT_LANGUAGE"]
        software = request.env["HTTP_USER_AGENT"]

        render json: { ipaddress: ip, language: lang, software: software}
    end
end
