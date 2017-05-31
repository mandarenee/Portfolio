@articles.each do |item|
  xml.url do
    xml.loc article_path(item)
  end
end