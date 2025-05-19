module ApplicationHelper
  def home_craft_category_path(craft)
    case craft.category.downcase
    when 'print'
      home_print_path
    when 'crotchet'
      home_crotchet_path
    when 'embroidery'
      home_embroidery_path
    when 'painting'
      home_painting_path
    when 'earrings'
      home_earrings_path
    when 'necklace'
      home_necklace_path
    when 'miscellaneous'
      home_miscellaneous_path
    else
      '#'
    end
  end
end
