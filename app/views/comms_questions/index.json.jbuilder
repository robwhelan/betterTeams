json.array!(@comms_questions) do |comms_question|
  json.extract! comms_question, :id, :body, :assessment_disc_id
  json.url comms_question_url(comms_question, format: :json)
end
