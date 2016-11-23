json.extract! mooc, :id, :institute, :course, :year, :verified, :created_at, :updated_at
json.url mooc_url(mooc, format: :json)