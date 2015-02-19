		$( document ).ready(function() {
			function shuffle(array) {
			  var currentIndex = array.length, temporaryValue, randomIndex ;
			  while (0 !== currentIndex) {
			    randomIndex = Math.floor(Math.random() * currentIndex);
			    currentIndex -= 1;
			    temporaryValue = array[currentIndex];
			    array[currentIndex] = array[randomIndex];
			    array[randomIndex] = temporaryValue;
			  }
			  return array;
			}	

			//track time for the app
			//var startTime = Date.now();
			
			$( "#sortable_2" ).sortable({
				connectWith: ".connectedSortable",
				receive: function( event, ui ) {
					//count the number of items. if 6, then enable the button.
					var questionsAnswered = $('#sortable_2').sortable('toArray').length;
					if (questionsAnswered == 6){
						$('#nextButton').removeAttr("disabled")
										.removeClass("btn-primary")
										.addClass("btn-success");
					}
				}
			}).disableSelection();
			$( "#sortable_1" ).sortable({
				connectWith: ".connectedSortable"
			}).disableSelection();

			var questionText 	= ["Which would you read first?","If salaries and benefits are equal, would you prefer the work of...","In which order would you explore these topics?","In which order would you choose to study these subjects?","An advantage of being in charge is...","Rank order the importance of these statements...","Given equal costs and resources, which would you prefer to do?","Rank order the importance of these concepts...","In which order would you attend presentations on these topics?","At a conference, in which order would you attend these exhibits?"];
			var topText			= ["First","Prefer Most","First","Study First","Biggest Advantage","Most Important","Prefer Most","Most Important","First","First"];
			var bottomText		= ["Last","Prefer Least","Last","Study Last","Smallest Advantage","Least Important","Prefer Least","Least Important","Last","Last"];
			var questionA 		= ["Creating Balance in Work and Home Life",'designer, architect, artist','maintaining creative freedom, uniqueness','creativity','choosing the design, colors, and layout of the area','Aesthetics are meant to enhance our surroundings','relax and "rebalance" in beautiful surroundings','I like form, harmony, and creative design',"Creating balance and harmony in life and work",'ideas on recycling, artwork'];
			var questionI 		= ["The Psychology of Negotiating To Win",'business owner, workplace leader','power, control, influencing','persuasion','influence & authority','Rules are made to be re­written','be elected to local or government office','I respect leadership & the ability to influence',"Persuading and Influencing others",'leadership resources'];
			var questionS 		= ["A New Spirit of Volunteering Emerges",'social worker, relief aid worker','volunteerism, helping others','social work','helping others grow and develop','Charity is meant to help society','volunteer for a charity or cause','I like helping others and volunteering',"Helping others to help themselves",'volunteer opportunities'];
			var questionTh 		= ["New Breakthrough Theory Revealed",'researcher, scientist','philosophy, theories, technology','science, new theories','strategizing & new ideas','Ideas are meant to be studied','learn about a new technology or scientific idea','I have an appetite for learning new things',"Effective ways of learning for retention",'scientific equipment'];
			var questionTr 		= ["Traditional Methods To Increase Effectiveness",'law enforcement, lawyer','organization, regulation','law','being able to set standards','Rules are made to be followed','participate in a patriotic or community event',"I like things I trust; new doesn't always mean better","Encouraging better citizenship and ethics",'quality improvement systems'];
			var questionU 		= ["Breaking News in Market Conditions",'high paid executive','building wealth, investments','investments, stock markets','money & financial rewards','Money is best used to make more money','learn about money making opportunities','I like financial incentives',"Increasing your financial return",'money making opportunities'];
			
			var startingPositions = ["#starting_1", "#starting_2", "#starting_3", "#starting_4", "#starting_5", "#starting_6"];
			
			$('#starting_1').html(questionA[0]);
			$('#starting_2').html(questionI[0]);
			$('#starting_3').html(questionS[0]);
			$('#starting_4').html(questionTh[0]);				
			$('#starting_5').html(questionTr[0]);				
			$('#starting_6').html(questionU[0]);				

			var progressBarWidths = ["width:10%;",
				"width:20%;",
				"width:30%;",
				"width:40%;",
				"width:50%;",
				"width:60%;",
				"width:70%;",
				"width:80%;",
				"width:90%;",
				"width:100%;"];
			
			$('#nextButton').click(function(){
				var questionNumber = $('#questionNumber').html();
				questionNumber++;
				$('#questionNumber').html(questionNumber);
				$('#questionText').html(questionText[questionNumber-1]);
				$('#ratingTop').html(topText[questionNumber-1]);
				$('#ratingBottom').html(bottomText[questionNumber-1]);
				
				if(questionNumber == 11) {
					//manually click the submit button
					//var endTime = Date.now();
					//var totalTime = endTime - startTime;
					//$('#disc_assessment_survey_time').val(totalTime);
					$('#submitButton').click();
				}

				var finalList = $('#sortable_2');
				
				//get order of elements
				var serializedOrder = finalList.sortable('toArray');
				var score = [10, 8, 5, 3, 1, 0];

				//score the response
				for( i = 0; i < serializedOrder.length; i++ ){
					var rank = serializedOrder[i].slice(-1);
					rank = parseInt(rank);
					switch(rank) {
						case 1:
							var aestheticScore = $('#value_assessment_aesthetic_score').val();
							aestheticScore = parseInt(aestheticScore) + score[i];
							$('#value_assessment_aesthetic_score').val(aestheticScore);
							break;
						case 2: 
							var individualisticScore = $('#value_assessment_individualistic_score').val();
							individualisticScore = parseInt(individualisticScore) + score[i];
							$('#value_assessment_individualistic_score').val(individualisticScore);
							break;
						case 3:
							var socialScore = $('#value_assessment_social_score').val();
							socialScore = parseInt(socialScore) + score[i];
							$('#value_assessment_social_score').val(socialScore);
							break;
						case 4:
							var theoreticalScore = $('#value_assessment_theoretical_score').val();
							theoreticalScore = parseInt(theoreticalScore) + score[i];
							$('#value_assessment_theoretical_score').val(theoreticalScore);
							break;
						case 5:
							var traditionalScore = $('#value_assessment_traditional_score').val();
							traditionalScore = parseInt(traditionalScore) + score[i];
							$('#value_assessment_traditional_score').val(traditionalScore);
							break;
						case 6:
							var utilitarianScore = $('#value_assessment_utilitarian_score').val();
							utilitarianScore = parseInt(utilitarianScore) + score[i];
							$('#value_assessment_utilitarian_score').val(utilitarianScore);
							break;
						default:
							alert("No rank detected at " + i);
							break;
					}
				}
				//push forward the progress bar
				var multiplier = (10)*questionNumber;
				var progressVal = multiplier;
			
				$('#progressBar').attr("aria-valuenow",multiplier)
				$('#progressBar').attr("style", progressBarWidths[questionNumber-1])
				
				//refresh the two lists
				$('#sortable_1,#sortable_2').html("");
				$('#sortable_1').html(
						'<li id="starting_1" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_2" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_3" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_4" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_5" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_6" class="ui-state-default btn btn-default btn-lg btn-block"></li>'
				)

				//populate the list with new answers
				$(startingPositions[0]).html(questionA[questionNumber-1]);
				$(startingPositions[1]).html(questionI[questionNumber-1]);
				$(startingPositions[2]).html(questionS[questionNumber-1]);
				$(startingPositions[3]).html(questionTh[questionNumber-1]);
				$(startingPositions[4]).html(questionTr[questionNumber-1]);
				$(startingPositions[5]).html(questionU[questionNumber-1]);

				//shuffle the order of answers
				var originalList = $('#sortable_1');
			    var lis = originalList.children();
			    while (lis.length) {
			        originalList.append(lis.splice(Math.floor(Math.random() * lis.length), 1)[0]);
			    }
				
				//disable the button
				$('#nextButton').attr("disabled", "disabled")
								.removeClass("btn-success")
								.addClass("btn-primary");
				
				if(questionNumber == 9) {
					$('#nextButton').html('Finish');
				}

				

			})
		});