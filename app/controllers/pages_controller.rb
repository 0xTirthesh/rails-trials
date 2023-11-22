# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    if logged_in?
      redirect_to dashboard_path
    end

    @user = User.new # instance variable
  end

  def about_us
    @page_title = 'About Us | Go Getter'
    @page_description = "'Know who we are — humans behind 'Go Getter'"
    flash.now[:btm_notice] = "SALE: 1 Year Subscription at 50%"
  end
end
