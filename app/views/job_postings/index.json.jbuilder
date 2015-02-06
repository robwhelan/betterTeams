json.array!(@job_postings) do |job_posting|
  json.extract! job_posting, :id, :job_benchmark_id, :user_id, :title, :description
  json.url job_posting_url(job_posting, format: :json)
end
