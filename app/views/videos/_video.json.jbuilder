json.extract! video, :id, :title, :description, :thumbnail, :release_date, :created_at, :updated_at
json.url video_url(video, format: :json)
