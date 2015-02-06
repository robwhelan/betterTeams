json.array!(@job_benchmarks) do |job_benchmark|
  json.extract! job_benchmark, :id, :title, :description
  json.url job_benchmark_url(job_benchmark, format: :json)
end
