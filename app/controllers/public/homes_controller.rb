class Public::HomesController < ApplicationController
  def top
    @items = Item.limit(4).order("created_at DESC")#４件の新着商品
  end
  
  def about
  end
  
end
