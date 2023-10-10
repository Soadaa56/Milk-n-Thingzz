class HomeController < ApplicationController

  def index
    @crafts = Craft.all
  end

  def about; end

  def contact; end

  def credit; end

  def crotchet
    @crafts = Craft.where(category: "Crotchet")
  end
  
  def embroidery
    @crafts = Craft.where(category: "Embroidery")
  end

  def print
    @crafts = Craft.where(category: "3D-Print")
  end

  def social; end
end
