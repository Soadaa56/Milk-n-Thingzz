class HomeController < ApplicationController

  def index
    @crafts = Craft.all
  end

  def about; end

  def contact; end

  def credit; end

  def crotchet
    @crafts = Craft.includes(:craft_images).where(category: "Crotchet")
  end

  def embroidery
    @crafts = Craft.includes(:craft_images).where(category: "Embroidery")
  end

  def print
    @crafts = Craft.includes(:craft_images).where(category: "3D-Print")
  end

  def painting
    @crafts = Craft.includes(:craft_images).where(category: "Painting")
  end

  def earring
    @crafts = Craft.includes(:craft_images).where(category: "Earring")
    @subtypes = @crafts.pluck(:subtype).uniq

    @crafts = sort_crafts_by_subtype
    @selected_subtype = params[:sort_by] || 'All'
  end

  def miscellaneous
    @crafts = Craft.includes(:craft_images).where(category: "Miscellaneous")
  end

  def social; end

  private

  def sort_crafts_by_subtype
    if params[:sort_by].present?
      @crafts.where(subtype: params[:sort_by])
    else
      @crafts
    end
  end
end
