module CategoriesHelper
  def breadcrumbs(category)
    result = ''
    first = true
    category.self_and_ancestors.each do |c|
      unless first
        sep = ' > '
      else
        sep = ''
        first = false
      end
      result += sep + link_to(c.name, category_path(c.id))
    end
    result.html_safe
  end
end
