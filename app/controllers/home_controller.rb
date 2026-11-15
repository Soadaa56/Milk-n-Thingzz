class HomeController < ApplicationController
  before_action :set_active_crafts

  def index
    @crafts = @crafts.all
  end

  def store
    @crafts = @crafts.includes(:images)
    @categories = Craft.distinct.pluck(:category).sort

    # filters
    @crafts = @crafts.where(category: params[:category]) if params[:category].present?
    @crafts = @crafts.where(for_sale: true) if params[:for_sale] == "1"
    if params[:in_stock] == "1"
      @crafts = @crafts.joins(:variants).merge(Variant.in_stock).distinct
    end
  end

  def crochet
    @crafts = @crafts.includes(:images).where(category: "Crochet")
  end

  def embroidery
    @crafts = @crafts.includes(:images).where(category: "Embroidery")
  end

  def print
    @crafts = @crafts.includes(:images).where(category: "3D-Print")
  end

  def painting
    @crafts = @crafts.includes(:images).where(category: "Painting")
  end

  def earring
    @crafts = @crafts.includes(:images).where(category: "Earring")
    @subtypes = @crafts.where.not(subtype: [nil, ""]).pluck(:subtype).uniq

    @crafts = sort_crafts_by_subtype
    @selected_subtype = params[:sort_by] || 'All'
  end

  def necklace
    @crafts = @crafts.includes(:images).where(category: 'Necklace')
  end

  def miscellaneous
    @crafts = @crafts.includes(:images).where(category: "Miscellaneous")
  end

  def about; end

  def contact; end

  def credit; end

  def social; end

  private

  def set_active_crafts
    @crafts = Craft.where(active: true)
  end

  def sort_crafts_by_subtype
    if params[:sort_by].present?
      @crafts.where(subtype: params[:sort_by])
    else
      @crafts
    end
  end
end
