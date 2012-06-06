class StaticPagesController < ApplicationController

  before_filter :require_sign_in, :except => [:index, :about]

  def index

  end

  def about

  end
end