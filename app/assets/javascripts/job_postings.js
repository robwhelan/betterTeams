$( document ).ready(function() {
	
	function updateFormWithBenchmarkData(){
		var _jobTitle = $('#job-title-input').val();
		$.get("/pages/return_benchmark_data?jobTitle=" + _jobTitle);
	}
	
	var substringMatcher = function(strs) {
	  return function findMatches(q, cb) {
	    var matches, substrRegex;
 
	    // an array that will be populated with substring matches
	    matches = [];
 
	    // regex used to determine if a string contains the substring `q`
	    substrRegex = new RegExp(q, 'i');
 
	    // iterate through the pool of strings and for any string that
	    // contains the substring `q`, add it to the `matches` array
	    $.each(strs, function(i, str) {
	      if (substrRegex.test(str)) {
	        // the typeahead jQuery plugin expects suggestions to a
	        // JavaScript object, refer to typeahead docs for more info
	        matches.push({ value: str });
	      }
	    });
 
	    cb(matches);
	  };
	};
 
	var jobTitles = ['Receptionist', 'Programmer', 'Barista', 'Construction', 'Woodworker', 'Quickbooks Person', 'Recreation Supervisor'];
	function scoreDisc(){
		var discList = $('#sortableDisc')
		$($(discList).children()[0]).addClass("btn-success").removeClass("btn-default");
		$($(discList).children()[1]).addClass("btn-success").removeClass("btn-default");
		$($(discList).children()[2]).addClass("btn-default").removeClass("btn-success");
		$($(discList).children()[3]).addClass("btn-default").removeClass("btn-success");
		var serializedOrder = discList.sortable('toArray');
		for( i = 0; i < serializedOrder.length; i++ ){
			var rank = serializedOrder[i].slice(-1);
			rank = parseInt(rank);

			switch(i) {
			case 0:
				$('#d0').val(rank);
				break;
			case 1:
				$('#d1').val(rank);
				break;
			case 2:
			case 3: //non important
				break;
			}		
		};
	}
	
	function scoreValue(){
		var valueList = $('#sortableValue')
		for ( i = 0; i < 3; i++ ){
			$($(valueList).children()[i]).addClass("btn-success").removeClass("btn-default");			
		}
		for ( i = 3; i < 6; i++ ){
			$($(valueList).children()[i]).addClass("btn-default").removeClass("btn-success");			
		}
		var serializedOrder = valueList.sortable('toArray');
		for( i = 0; i < serializedOrder.length; i++ ){
			var rank = serializedOrder[i].slice(-1);
			rank = parseInt(rank);

			switch(i) {
			case 0:
				$('#v0').val(rank);
				break;
			case 1:
				$('#v1').val(rank);
				break;
			case 2:
				$('#v2').val(rank);
				break;
			case 3:
			case 4:
			case 5:
				break;
			}		
		};
	}

	function scoreSkill(){
		var skillList = $('#sortableSkill')
		for ( i = 0; i < 5; i++ ){
			$($(skillList).children()[i]).addClass("btn-success").removeClass("btn-default");			
		}
		for ( i = 5; i < 23; i++ ){
			$($(skillList).children()[i]).addClass("btn-default").removeClass("btn-success");			
		}
		var serializedOrder = skillList.sortable('toArray');
		for( i = 0; i < serializedOrder.length; i++ ){
			var rank = serializedOrder[i].slice(-1);
			rank = parseInt(rank);

			switch(i) {
			case 0:
				$('#s0').val(rank);
				break;
			case 1:
				$('#s1').val(rank);
				break;
			case 2:
				$('#s2').val(rank);
				break;
			case 3:
				$('#s3').val(rank);
				break;
			case 4:
				$('#s4').val(rank);
				break;
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 17:
			case 18:
			case 19:
			case 20:
			case 21:
			case 22:
				break;
			}		
		};
	}
 
	$('#jobTitle .typeahead').typeahead({
	  hint: true,
	  highlight: true,
	  minLength: 1,
	},
	{
	  name: 'jobTitles',
	  displayKey: 'value',
	  source: substringMatcher(jobTitles)
	}).on('typeahead:selected', function () {
		updateFormWithBenchmarkData();
	});
	
    $(function() {
      $( "#sortableDisc" ).sortable({
      	stop: function( event, ui ) {
      		scoreDisc();
      	}
      });
      $( "#sortableDisc" ).disableSelection();
      $( "#sortableValue" ).sortable({
      	stop: function( event, ui ) {
			scoreValue();      	
		}
      });
      $( "#sortableValue" ).disableSelection();
      $( "#sortableSkill" ).sortable({
      	stop: function( event, ui ) {
			scoreSkill();
      	}
      });
      $( "#sortableSkill" ).disableSelection();
    });
	
});