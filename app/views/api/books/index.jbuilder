json.books do
  json.array!(@books) do |book|
    json.(book, :id, :title, :created_at)
  end
end
