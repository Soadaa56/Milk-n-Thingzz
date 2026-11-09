module CraftsHelper
  def craft_category_path_helper(craft)
    case craft.category
    when 'Crotchet'
      home_crotchet_path
    when 'Embroidery'
      home_embroidery_path

    when '3d-print', 'print'
      home_print_path

    when 'miscellaneous', 'misc', 'misc.'
      home_miscellaneous_path

    when 'necklace'
      home_necklace_path

    when 'painting'
      home_painting_path
      
    else
      '#'
    end
  end
end
