class ApplicationController < ActionController::Base
    before_action :set_current_user,:get_tag

    def set_current_user
        @current_user = Host.find_by(login_id: session[:login_id])
    end

    def get_tag
        @tags = ActsAsTaggableOn::Tag.all
    end
end
