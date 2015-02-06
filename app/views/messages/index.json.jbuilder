json.array!(@messages) do |message|
  json.extract! message, :id, :body, :user_id, :job_posting_id
  json.url message_url(message, format: :json)
end
