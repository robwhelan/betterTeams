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

			$( "#sortable_2" ).sortable({
				connectWith: ".connectedSortable",
				receive: function( event, ui ) {
					//count the number of items. if 4, then enable the button.
					var questionsAnswered = $('#sortable_2').sortable('toArray').length;
					if (questionsAnswered == 4){
						$('#nextButton').removeAttr("disabled")
										.removeClass("btn-primary")
										.addClass("btn-success");
					}
				}
			}).disableSelection();
			$( "#sortable_1" ).sortable({
				connectWith: ".connectedSortable"
			}).disableSelection();
						
			var questionD = ["Strong-Willed", "Aggressive", "Determined", "Assertive", "Bold", "Competitive", "Pioneering", "Daring", "Forceful", "Outspoken", "Vigorous", "Impatient", "Extroverted"];
			var questionI = ["Inspiring", "Charming", "Playful", "Cheerful", "Entertaining", "Enthusiastic", "Poised", "Expressive", "Talkative", "Friendly", "Influential", "Gregarious", "Persuasive"];
			var questionS = ["Moderate", "Generous", "Neighborly", "Good Listener", "Sympathetic", "Even-Tempered", "Steady", "Compassionate", "Accomodating", "Diplomatic", "Calm", "Cooperative", "Tactful"];
			var questionC = ["Introspective", "Cautious", "Ordlerly", "Disciplined", "Soft Spoken", "Careful", "Controlled", "Correct", "Restrained", "Accepting", "Impartial", "Constant", "Stable"];
			var startingPositions = ["#starting_1", "#starting_2", "#starting_3", "#starting_4"];
			
			$('#starting_1').html(questionD[0]);
			$('#starting_2').html(questionI[0]);
			$('#starting_3').html(questionS[0]);
			$('#starting_4').html(questionC[0]);				

			var progressBarWidths = ["width:8%;",
				"width:15%;",
				"width:23%;",
				"width:31%;",
				"width:38%;",
				"width:46%;",
				"width:54%;",
				"width:62%;",
				"width:69%;",
				"width:77%;",
				"width:85%;",
				"width:92%;",
				"width:100%;"]
			
			$('#nextButton').click(function(){
				var questionNumber = $('#questionNumber').html();
				questionNumber++;
				$('#questionNumber').html(questionNumber);
				
				if(questionNumber == 14) {
					//manually click the submit button
					$('#submitButton').click();
				}

				var finalList = $('#sortable_2');
				
				//get order of elements
				var serializedOrder = finalList.sortable('toArray');
				var score = 4;

				//score teh response
				for( i = 0; i < serializedOrder.length; i++ ){
					var rank = serializedOrder[i].slice(-1);
					rank = parseInt(rank);
					switch(rank) {
						case 1:
							var driverScore = $('#disc_assessment_driver_score').val();
							driverScore = parseInt(driverScore) + score;
							$('#disc_assessment_driver_score').val(driverScore);
							break;
						case 2: 
							var influencerScore = $('#disc_assessment_influencer_score').val();
							influencerScore = parseInt(influencerScore) + score;
							$('#disc_assessment_influencer_score').val(influencerScore);
							break;
						case 3:
							var sociableScore = $('#disc_assessment_sociable_score').val();
							sociableScore = parseInt(sociableScore) + score;
							$('#disc_assessment_sociable_score').val(sociableScore);
							break;
						case 4:
							var conscientiousScore = $('#disc_assessment_conscientious_score').val();
							conscientiousScore = parseInt(conscientiousScore) + score;
							$('#disc_assessment_conscientious_score').val(conscientiousScore);
							break;
						default:
							alert("No rank detected at " + i);
							break;
					}
					score--;
				}
				//push forward the progress bar
				var multiplier = (100/15)*questionNumber;
				var progressVal = multiplier;
			
				$('#progressBar').attr("aria-valuenow",multiplier)
				$('#progressBar').attr("style", progressBarWidths[questionNumber-1])
				
				//refresh the two lists
				$('#sortable_1,#sortable_2').html("");
				$('#sortable_1').html(
						'<li id="starting_1" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_2" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_3" class="ui-state-default btn btn-default btn-lg btn-block"></li>' +
						'<li id="starting_4" class="ui-state-default btn btn-default btn-lg btn-block"></li>'
				)

				//populate the list with new answers
				$(startingPositions[0]).html(questionD[questionNumber-1]);
				$(startingPositions[1]).html(questionI[questionNumber-1]);
				$(startingPositions[2]).html(questionS[questionNumber-1]);
				$(startingPositions[3]).html(questionC[questionNumber-1]);

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
				
				if(questionNumber == 13) {
					$('#nextButton').html('Finish');
				}

				

			})
		});
