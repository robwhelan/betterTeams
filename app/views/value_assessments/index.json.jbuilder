json.array!(@value_assessments) do |value_assessment|
  json.extract! value_assessment, :id, :user_id, :aesthetic_score, :individualistic_score, :social_score, :theoretical_score, :traditional_score, :utilitarian_score
  json.url value_assessment_url(value_assessment, format: :json)
end
