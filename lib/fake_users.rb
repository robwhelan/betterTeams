300.times {

  first_name = Faker::Name.first_name

  u = User.create(
    :email => Faker::Internet.email(first_name),
    :first_name => first_name,
    :last_name => Faker::Name.last_name,
    :password => "password",
    :image => Faker::Avatar.image)
  
    discs = AssessmentDisc.all.sample(2)
    values = AssessmentValue.all.sample(3)
    skills = AssessmentSkill.all.sample(5)

    u.assessment_discs<<discs[0]
    u.assessment_discs<<discs[1]
    u.assessment_values<<values[0]
    u.assessment_values<<values[1]
    u.assessment_values<<values[2]
    u.assessment_skills<<skills[0]
    u.assessment_skills<<skills[1]
    u.assessment_skills<<skills[2]
    u.assessment_skills<<skills[3]
    u.assessment_skills<<skills[4]
  
}