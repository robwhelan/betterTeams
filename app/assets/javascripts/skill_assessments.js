$( document ).ready(function() {
	var skillArray = ['Analytical Problem Solving', 'Conflict Management', 'Continuous Learning', 'Creativity/Innovation', 'Customer Service', 'Decision Making', 'Diplomacy', 'Empathy', 'Employee Development/Coaching', 'Flexibility', 'Futuristic Thinking', 'Goal Orientation', 'Interpersonal Skills', 'Leadership', 'Management', 'Negotiation', 'Personal Effectiveness', 'Persuasion', 'Planning and Organizing', 'Presenting', 'Self-Management', 'Teamwork', 'Written Communication'];
	var questionArray = ['I know what I want and I usually get it.', 'I need more time than most people to adjust to changes.', 'I enjoy speaking to large groups.', "It's difficult for me to influence the outcome of discussions.", 'I like going out of my way to help others get their needs met.', 'I am not very good at dealing with deadlines.', 'I prefer structure in my work.', 'I would not want the responsibility of getting others to work towards goals, especially if it involved risk.', 'I believe results are more important than the process used to obtain them.', 'It bothers me when I see others passing up opportunities to learn.', 'Too much competition upsets me.', 'I like to plan my work very carefully before starting.', 'I prefer working alone.', "People spend too much time dreaming about the future instead of solving today's problems.", 'I have difficulty making quick decisions.', "I don't like haggling over prices.", 'I have difficulty putting my thoughts in writing.', 'Demanding customers irritate me.', 'I prefer to be evaluated on my results rather than my methods.', 'I prefer a tried and true approach.', 'One thing I am very good at is spontaneity.', 'It bothers me when people say things that are obviously politically incorrect.', 'I feel that people on government assistance are just looking for a handout.', 'One of my greatest fears is getting up in front of a group of people and speaking.', 'I am grateful for my failures because they have been some of my best learning experiences.', 'Too often old traditions are discarded in favor of untested ideas.', 'I would rather wait for someone else to take the lead.', 'Too much emphasis is placed on learning new things when there is so much work to do.', 'I go out of my way to avoid conflict.', 'Meeting new people is hard for me.', 'I rely on my instincts to solve problems.', 'I am not known for being creative or inventive.', 'I enjoy expressing my thoughts and feelings in writing.', 'Persuasion is not one of my strengths.', "I don't spend time worrying about other people's problems.", 'Besides being boring, theoretical discussions are a waste of time.', 'I am shy at social gatherings.', 'I dislike participating in negotiations.', 'I feel uncomfortable when working with people who consistently make decisions without a proper analysis of the data.', 'I have been criticized for being too emotional.', 'One thing I am very good at is identifying the best solution to a problem.', 'I have to work on managing my time continually.', 'I spend time in libraries, bookstores and researching on the Internet.', 'People come to me for advice on how to handle politically sensitive issues.', 'What I am most proud of is what others have accomplished as a result of my mentoring.', 'I have been criticized for being too far out in my ideas.', 'I am most productive when working closely with others to achieve goals.', 'In the past, people have taken risks to support my vision, mission or goals.', 'I have a history of making significant contributions as a member of a high performing team.', 'I have a gift for resolving conflict.', "I have a reputation for keeping up with what's new in my field.", 'I am known for my ability to build and maintain many relationships with all kinds of people.', "I have been recognized for achieving results when others couldn't.", 'I have been criticized for being too concerned about the difficulties of others.', 'I am known for making timely decisions even when the risk of an error was high.', 'People will verify my ability to facilitate win/win agreements.', 'I am known for taking unique or unusual approaches to get results.', 'I have been recognized for my ability to get others to say yes.', 'I have been acknowledged for my ability to write proposals, reports, newsletters, articles, or other business documents.', 'I have been acknowledged for going the extra mile to satisfy customers.', 'I have been invited back to speak to the same group.', 'In the past, I have been one of the first to get on board when changes occur.', 'I have been criticized for being too competitive.', 'I have been acknowledged for my attention to detail.', 'I have been criticized for not handling sensitive organizational issues very well.', 'I have been acknowledged for my ability to handle sensitive organizational issues.', "I have accomplished things others didn't believe I could.", 'I have a reputation for delivering powerful presentations.', 'I have been recognized for my ability to turn things around financially.', 'I have been criticized for holding people accountable for their actions.', 'I have played a key role in negotiating significant contracts or agreements.', "It's been said that I could sell shoes to a shoemaker.", 'I am known for overcoming significant obstacles to reach goals.', 'I have been recognized for my contributions to the disadvantaged.', 'I have been recognized for my ability to resolve conflict in the workplace.', 'Others consider me a resource for knowledge.', 'My ability to get along with people has been a key to my greatest accomplishments.', 'I have a reputation for using a disciplined approach to collecting and analyzing data to define, diagnose and resolve problems.', 'I have a history of championing futuristic ideas when others predicted failure.', 'I am known for acknowledging the contributions of every member of the team.', 'Even outside of work, I am asked to take a leadership role.', 'I am known for my ability to calm people who are emotionally upset.', 'I have been acknowledged for my role in training and/or developing others.', 'I have been recognized for coming up with new ideas, methods or processes that improved results.', "I have been recognized for doing a good job of editing other people's writing.", 'I am known for standing up for customers.', 'I have been acknowledged for my ability to adapt quickly to changes.', 'I have a reputation for always being prepared.', 'I have been recognized for my ability to maintain my composure in emotionally charged situations.', 'I have been recognized for my ability to make good decisions under pressure.', 'People will verify that I rarely, if ever, attempt to resolve a problem without a disciplined approach to gathering and analyzing the appropriate data first.', 'I have been recognized for my ability to manage my time and priorities well.'];
	var skillIndexArray = [11, 9, 19, 17, 4, 20, 14, 13, 14, 2, 11, 18, 21, 10, 5, 15, 22, 4, 11, 9, 3, 6, 7, 19, 16, 10, 13, 2, 1, 12, 0, 3, 22, 17, 7, 2, 12, 15, 5, 20, 0, 20, 2, 6, 8, 10, 21, 13, 21, 1, 8, 12, 16, 7, 5, 15, 3, 17, 22, 4, 19, 9, 11, 18, 6, 6, 16, 19, 14, 14, 15, 17, 16, 7, 1, 8, 12, 0, 10, 21, 13, 1, 8, 3, 22, 4, 9, 18, 20, 5, 0, 18];
	var multiplierArray = [1, -1, 1, -1, 1, -1, 1, -1, 1, 1, -1, 1, -1, -1, -1, -1, 1, -1, 1, -1, 1, 1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, -1, -1, 1, -1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

	$('#statement_1_question').html(questionArray[0]);
	$('#statement_2_question').html(questionArray[1]);
	$('#statement_3_question').html(questionArray[2]);

	$('.score_buttons_1').attr('data-multiplier', multiplierArray[0])
						 .attr('data-skill-index', skillIndexArray[0]);
	$('.score_buttons_2').attr('data-multiplier', multiplierArray[1])
	 					 .attr('data-skill-index', skillIndexArray[1]);
	$('.score_buttons_3').attr('data-multiplier', multiplierArray[2])
	 					 .attr('data-skill-index', skillIndexArray[2]);

	var q1_done, q2_done, q3_done;

	$('.score_buttons_1').click(function(){
		var multiplier = $(this).attr('data-multiplier');
		var score = $(this).attr('data-score');
		var scoreIncrement = multiplier * score;
		var skillIndex = $(this).attr('data-skill-index');
		q1_done = true;
		if(q1_done && q2_done && q3_done){
			$('#nextButton').removeClass('disabled');
		}
		
		$('#score_1').val(scoreIncrement);
		$('#score_1_skill_index').val(skillIndex);
	});

	$('.score_buttons_2').click(function(){
		var multiplier = $(this).attr('data-multiplier');
		var score = $(this).attr('data-score');
		var scoreIncrement = multiplier * score;
		var skillIndex = $(this).attr('data-skill-index');
		q2_done = true;
		if(q1_done && q2_done && q3_done){
			$('#nextButton').removeClass('disabled');
		}

		$('#score_2').val(scoreIncrement);
		$('#score_2_skill_index').val(skillIndex);
	});

	$('.score_buttons_3').click(function(){
		var multiplier = $(this).attr('data-multiplier');
		var score = $(this).attr('data-score');
		var scoreIncrement = multiplier * score;
		var skillIndex = $(this).attr('data-skill-index');
		q3_done = true;
		if(q1_done && q2_done && q3_done){
			$('#nextButton').removeClass('disabled');
		}

		$('#score_3').val(scoreIncrement);
		$('#score_3_skill_index').val(skillIndex);
	});
	
	$('#nextButton').click(function(){
		//populate big form inputs
		var score_1_increment = $('#score_1').val();
		var score_2_increment = $('#score_2').val();
		var score_3_increment = $('#score_3').val();

		var score_1_index = $('#score_1_skill_index').val();
		var score_2_index = $('#score_2_skill_index').val();
		var score_3_index = $('#score_3_skill_index').val();
		
		var inputArray = $('#skillFormInputs').children();

		var new_score_1 = parseInt(score_1_increment) + parseInt($(inputArray[score_1_index]).val());
		var new_score_2 = parseInt(score_2_increment) + parseInt($(inputArray[score_2_index]).val());
		var new_score_3 = parseInt(score_3_increment) + parseInt($(inputArray[score_3_index]).val());
		
		$(inputArray[score_1_index]).val(new_score_1);
		$(inputArray[score_2_index]).val(new_score_2);
		$(inputArray[score_3_index]).val(new_score_3);

		//clear temp scores
		$('#score_1').val(0);
		$('#score_2').val(0);
		$('#score_3').val(0);
		$('#score_1_skill_index').val(0);
		$('#score_2_skill_index').val(0);
		$('#score_3_skill_index').val(0);
		$('#nextButton').addClass('disabled');
		q1_done = false;
		q2_done = false;
		q3_done = false;

		//incremenet question count
		var newQuestionNumber = parseInt($('#questionNumber').html()) + 1;
		$('#questionNumber').html(newQuestionNumber);

		//load next question
		$('#statement_1_question').html(questionArray[3 * newQuestionNumber]);
		$('#statement_2_question').html(questionArray[3 * newQuestionNumber + 1]);
		$('#statement_3_question').html(questionArray[3 * newQuestionNumber + 2]);

		$('.score_buttons_1').attr('data-multiplier', multiplierArray[3 * newQuestionNumber])
							 .attr('data-skill-index', skillIndexArray[3 * newQuestionNumber]);
		$('.score_buttons_2').attr('data-multiplier', multiplierArray[3 * newQuestionNumber + 1])
		 					 .attr('data-skill-index', skillIndexArray[3 * newQuestionNumber + 1]);
		$('.score_buttons_3').attr('data-multiplier', multiplierArray[3 * newQuestionNumber + 2])
		 					 .attr('data-skill-index', skillIndexArray[3 * newQuestionNumber + 2]);
							 
		//change boundary adjectives if necessary
							 
		//change button to green Finish if at the last question
		
	});


});