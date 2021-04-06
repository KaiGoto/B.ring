class Admins::RegionsController < ApplicationController
before_action :authenticate_admin!
  def index
    @regions = Region.all
    @region = Region.new
  end

  def show
    @regions = Region
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end
end
