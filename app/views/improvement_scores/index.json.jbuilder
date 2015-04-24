json.array!(@improvement_scores) do |improvement_score|
  json.extract! improvement_score, :id, :comms_question_id, :improvement_plan_id, :score
  json.url improvement_score_url(improvement_score, format: :json)
end
