json.array!(@improvement_plans) do |improvement_plan|
  json.extract! improvement_plan, :id, :initiator_id, :follower_id
  json.url improvement_plan_url(improvement_plan, format: :json)
end
