json.array!(@disc_assessments) do |disc_assessment|
  json.extract! disc_assessment, :id, :user_id, :driver_score, :influencer_score, :sociable_score, :conscientious_score
  json.url disc_assessment_url(disc_assessment, format: :json)
end
