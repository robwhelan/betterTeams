AssessmentDisc.create(:name => "Driver")
AssessmentDisc.create(:name => "Influencer")
AssessmentDisc.create(:name => "Sociable")
AssessmentDisc.create(:name => "Conscientious")

AssessmentValue.create(:name => "Aesthetic")
AssessmentValue.create(:name => "Economic")
AssessmentValue.create(:name => "Political")
AssessmentValue.create(:name => "Social")
AssessmentValue.create(:name => "Theoretical")
AssessmentValue.create(:name => "Traditional")

AssessmentSkill.create(:name => "Analytical Problem Solving")
AssessmentSkill.create(:name => "Conflict Management")
AssessmentSkill.create(:name => "Continuous Learning")
AssessmentSkill.create(:name => "Creativity/Innovation")
AssessmentSkill.create(:name => "Customer Service")
AssessmentSkill.create(:name => "Decision Making")
AssessmentSkill.create(:name => "Diplomacy")
AssessmentSkill.create(:name => "Empathy")
AssessmentSkill.create(:name => "Employee Development/Coaching")
AssessmentSkill.create(:name => "Flexibility")
AssessmentSkill.create(:name => "Futuristic Thinking")
AssessmentSkill.create(:name => "Goal Orientation")
AssessmentSkill.create(:name => "Interpersonal Skills")
AssessmentSkill.create(:name => "Leadership")
AssessmentSkill.create(:name => "Management")
AssessmentSkill.create(:name => "Negotiation")
AssessmentSkill.create(:name => "Personal Effectiveness")
AssessmentSkill.create(:name => "Persuasion")
AssessmentSkill.create(:name => "Planning and Organizing")
AssessmentSkill.create(:name => "Presenting")
AssessmentSkill.create(:name => "Self-Management")
AssessmentSkill.create(:name => "Teamwork")
AssessmentSkill.create(:name => "Written Communication")
TaskStatement.create(:onet_id => 1, :body => "Operate telephone switchboard to answer, screen, or forward calls, providing information, taking messages, or scheduling appointments.")
TaskStatement.create(:onet_id => 2, :body => "Greet persons entering establishment, determine nature and purpose of visit, and direct or escort them to specific destinations.")
TaskStatement.create(:onet_id => 3, :body => "Schedule appointments and maintain and update appointment calendars.")
TaskStatement.create(:onet_id => 4, :body => "Hear and resolve complaints from customers or the public.")
TaskStatement.create(:onet_id => 5, :body => "File and maintain records.")
TaskStatement.create(:onet_id => 6, :body => "Receive payment and record receipts for services.")
TaskStatement.create(:onet_id => 7, :body => "Perform administrative support tasks, such as proofreading, transcribing handwritten information, or operating calculators or computers to work with pay records, invoices, balance sheets, or other documents.")
TaskStatement.create(:onet_id => 8, :body => "Transmit information or documents to customers, using computer, mail, or facsimile machine.")
TaskStatement.create(:onet_id => 9, :body => "Analyze data to determine answers to questions from customers or members of the public.")
TaskStatement.create(:onet_id => 10, :body => "Collect, sort, distribute, or prepare mail, messages, or courier deliveries.")

AssessmentSkill.all.each do |d|
  d.destroy
end
AssessmentValue.all.each do |d|
  d.destroy
end
AssessmentDisc.all.each do |d|
  d.destroy
end
TaskStatement.all.each do |d|
  d.destroy
end
JobTask.all.each do |d|
  d.destroy
end

#create a receptionist
j=JobBenchmark.create(:title => "Receptionist", :description => "Answer inquiries and provide information to the general public, customers, visitors, and other interested parties regarding activities conducted at establishment and location of departments, offices, and employees within the organization.")
j.assessment_discs<<AssessmentDisc.find_by_name("Influencer")
j.assessment_discs<<AssessmentDisc.find_by_name("Sociable")
j.assessment_values<<AssessmentValue.find_by_name("Social")
j.assessment_values<<AssessmentValue.find_by_name("Traditional")
j.assessment_values<<AssessmentValue.find_by_name("Economic")
j.assessment_skills<<AssessmentSkill.find_by_name("Customer Service")
j.assessment_skills<<AssessmentSkill.find_by_name("Diplomacy")
j.assessment_skills<<AssessmentSkill.find_by_name("Interpersonal Skills")
j.assessment_skills<<AssessmentSkill.find_by_name("Planning and Organizing")
j.assessment_skills<<AssessmentSkill.find_by_name("Written Communication")
j.task_statements<<TaskStatement.find(1)
j.task_statements<<TaskStatement.find(2)
j.task_statements<<TaskStatement.find(3)
j.task_statements<<TaskStatement.find(4)
j.task_statements<<TaskStatement.find(5)
j.task_statements<<TaskStatement.find(6)
j.task_statements<<TaskStatement.find(7)
j.task_statements<<TaskStatement.find(8)
j.task_statements<<TaskStatement.find(9)
j.task_statements<<TaskStatement.find(10)