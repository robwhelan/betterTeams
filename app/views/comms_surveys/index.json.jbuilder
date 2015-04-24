json.array!(@comms_surveys) do |comms_survey|
  json.extract! comms_survey, :id, :improvement_plan_id, :name, :email, :user_id
  json.url comms_survey_url(comms_survey, format: :json)
end
