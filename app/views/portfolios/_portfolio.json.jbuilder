json.extract! portfolio, :id, :title, :type, :description, :link, :image, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)