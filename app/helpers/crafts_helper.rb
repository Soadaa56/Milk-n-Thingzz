module CraftsHelper
  def craft_category_path_helper(craft)
    case craft.category
    when 'Crotchet'
      home_crotchet_path
    when 'Embroidery'
      home_embroidery_path
    when '3D-Print'
      home_print_path
    when 'Earring'
      home_earring_path
    when 'Painting'
      home_painting_path
    else
      home_craft_category_path(craft)
    end
  end
end
