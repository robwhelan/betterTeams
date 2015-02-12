json.array!(@task_statements) do |task_statement|
  json.extract! task_statement, :id, :onet_id, :body
  json.url task_statement_url(task_statement, format: :json)
end
