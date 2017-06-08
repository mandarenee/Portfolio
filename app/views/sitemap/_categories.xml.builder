@categories.each do |item|
  xml.url do
    xml.loc category_path(item)
  end
end
