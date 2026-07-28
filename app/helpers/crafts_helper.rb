module CraftsHelper
  def craft_category_path_helper(craft)
    case craft.category.downcase
    when 'crochet'
      home_crochet_path
    when 'earring'
      home_earring_path
    when 'embroidery'
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
