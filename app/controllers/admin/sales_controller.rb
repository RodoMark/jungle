class Admin::SalesController < ApplicationController

  def index
    @sales = Sale.order(id: :desc).all
    @sale = Sale.new
  end

end
