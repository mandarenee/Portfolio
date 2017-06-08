@recipe_tags.each do |item|
  xml.url do
    xml.loc recipe_tag_path(item)
  end
end
