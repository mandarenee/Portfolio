@recipes.each do |item|
  xml.url do
    xml.loc recipe_path(item)
  end
end
