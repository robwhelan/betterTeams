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

AssessmentSkill.all.each do |d|
  d.destroy
end

AssessmentValue.all.each do |d|
  d.destroy
end
AssessmentDisc.all.each do |d|
  d.destroy
end

#create a receptionist
j=JobBenchmark.create(:title => "Receptionist", :description => "Receptionist description.")
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
