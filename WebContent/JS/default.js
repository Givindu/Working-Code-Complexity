/**
 * 
 */

$(document).ready(function(){
	var code = $(".codemirror-textarea")[0];
	var editor = CodeMirror.fromTextArea(code, {
		lineNumbers : true
	});
});


function readURL(input) {
	if(input.files && input.files[0]){
		var reader = new FileReader();
		
		reader.onlode = function(e){
			$("#inputCode")
			.attr('src', e.target.result)
            .width(150)
            .height(200);
    };

    reader.readAsDataURL(input.files[0]);
		
	}
}

function selectTopicFunction(){
	var checkBoxSize = document.getElementById("size");
	var topicSize = document.getElementById("topicSize") ;
	if(checkBoxSize.checked == true){
		topicSize.style.display = "block";
	} else {
		topicSize.style.display = "none";
	}
	
	var checkBoxVariables = document.getElementById("variables");
	var topicVariables = document.getElementById("topicVariable") ;
	if(checkBoxVariables.checked == true){
		topicVariables.style.display = "block";
	} else {
		topicVariables.style.display = "none";
	}
	
	var checkBoxMethod = document.getElementById("method");
	var topicMethod = document.getElementById("topicMethod") ;
	if(checkBoxMethod.checked == true){
		topicMethod.style.display = "block";
	} else {
		topicMethod.style.display = "none";
	}
	
	var checkBoxInheritance = document.getElementById("inheritance");
	var topicInheritance = document.getElementById("topicInheritance") ;
	if(checkBoxInheritance.checked == true){
		topicInheritance.style.display = "block";
	} else {
		topicInheritance.style.display = "none";
	}
	
	var checkBoxCoupling = document.getElementById("coupling");
	var topicCoupling = document.getElementById("topicCoupling") ;
	if(checkBoxCoupling.checked == true){
		topicCoupling.style.display = "block";
	} else {
		topicCoupling.style.display = "none";
	}
	
	var checkBoxControlStr = document.getElementById("control-structures");
	var topicControlStr = document.getElementById("topicControlStr") ;
	if(checkBoxControlStr.checked == true){
		topicControlStr.style.display = "block";
	} else {
		topicControlStr.style.display = "none";
	}
}



document.getElementById('input-file')
.addEventListener('change', getFile)

function getFile(event) {
	const input = event.target
if ('files' in input && input.files.length > 0) {
	  placeFileContent(
    document.getElementById('code'),
    input.files[0])
}
}

function placeFileContent(target, file) {
	readFileContent(file).then(content => {
	target.value = content
}).catch(error => console.log(error))
}

function readFileContent(file) {
	const reader = new FileReader()
return new Promise((resolve, reject) => {
  reader.onload = event => resolve(event.target.result)
  reader.onerror = error => reject(error)
  reader.readAsText(file)
})
}





