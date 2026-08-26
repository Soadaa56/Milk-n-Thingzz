class HomeController < ApplicationController

  def index
    @crafts = Craft.all
  end

  def store
    @crafts = Craft.includes(:images).all

    @crafts = @crafts.where(category: params[:category]) if params[:category].present?
  end

  def crochet
    @crafts = Craft.includes(:images).where(category: "Crochet")
  end

  def embroidery
    @crafts = Craft.includes(:images).where(category: "Embroidery")
  end

  def print
    @crafts = Craft.includes(:images).where(category: "3D-Print")
  end

  def painting
    @crafts = Craft.includes(:images).where(category: "Painting")
  end

  def earring
    @crafts = Craft.includes(:images).where(category: "Earring")
    @subtypes = @crafts.where.not(subtype: [nil, ""]).pluck(:subtype).uniq

    @crafts = sort_crafts_by_subtype
    @selected_subtype = params[:sort_by] || 'All'
  end

  def necklace
    @crafts = Craft.includes(:images).where(category: 'Necklace')
  end

  def miscellaneous
    @crafts = Craft.includes(:images).where(category: "Miscellaneous")
  end

  def about; end

  def contact; end

  def credit; end

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
