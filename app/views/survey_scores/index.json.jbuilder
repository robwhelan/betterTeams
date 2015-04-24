json.array!(@survey_scores) do |survey_score|
  json.extract! survey_score, :id, :comms_question_id, :comms_suvey_id, :score
  json.url survey_score_url(survey_score, format: :json)
end
