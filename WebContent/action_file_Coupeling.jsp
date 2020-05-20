<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="CSS/main.css">
<link rel="stylesheet" type="text/css"
	href="Plugins/codemirror/lib/codemirror.css">
<title>File Uploader</title>
</head>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #00376c;
	font-family: century gothic;
	font-size: 25px;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #ffd700;
}

.active {
	background-color: #ffd700;
}
</style>
<body class="body">
	<!--Header section-->
	<section>
		<div class="header-container">
			<header>
				<!--Header image-->
				<img class="header-image" src="Images/header-image-crop.png" alt="">
				<!--Heading-->
				<h1 class="heading">Code Quality Measure</h1>
			</header>

		</div>
	</section>
	<div>
	<button>
<a href="Action_file_Size.jsp" type="button">Size</a>
</button>
	<button>
<a href="Action_file_Variable.jsp" type="button">Variable</a>
</button>
	<button>
<a href="Action_file_Method.jsp" type="button">Method</a>
</button>
	<button>
<a href="action_file_Inheritance.jsp" type="button">Inheritance</a>
</button>
<button>
<a href="action_file_ControlStructures.jsp" type="button">Control Structures</a>
</button>
<button>
<a href="action_file_Coupeling.jsp" type="button">Coupeling</a>
</button>
<button>
<a href="action_file_allfactors.jsp" type="button">All Factors</a>
</button>
</div>
	
	<h1 style="color:#FFFAFA; font-size:64px; text-align: center;">Coupeling</h1>
	<div style="margin-left: 369px;">
		<h1>Select Folder:</h1>
		<br />
		</hr>
		<form action="action_file_upload_Coupeling.jsp" method="post"
			enctype="multipart/form-data">
			<input id="myInput" type="file" name="file" webkitdirectory directory
				multiple="multiple" size="50" /> <br /> <br />
			<div style="margin-left: 69px;">
				<div class="form-group"
					style="font-size: 25px; margin-left: -70px; font-weight: normal; width: 81%;">
					<label for="complexity">Programming Language :</label> <select
						class="custom-select" name="language">

						<option value="1">Java</option>
						<option value="2">C++</option>

					</select>
				</div>

				<div class="form-group"
					style="font-size: 25px; margin-left: -69px; width: 81%; font-weight: normal;">
					<label for="code">Enter Code:</label>
					<textarea class="form-control" rows="10" id="code" name="code"></textarea>
				</div>
			</div>

			<input type="submit" value="Calculate" class="btn btn-primary btn-lg" />
			</hr>
		</form>

	</div>
	<!--Footer-->
	<div class="footer-container">
		<!--Footer image-->
		<img class="footer-image" src="Images/footer-image-crop.png" alt="">

	</div>

	</div>

	<!-- Javascript -->
	<script type="text/javascript" src="JS/jqueryComp.js"></script>
	<script type="text/javascript"
		src="Plugins/codemirror/lib/codemirror.js"></script>
	<script type="text/javascript" src="JS/default.js"></script>

	<script type="text/javascript" src="JS/behave.js"></script>
	<script type="text/javascript" src="JS/script.js"></script>
	<script>
		var folder = document.getElementById("myInput");
		folder.onchange = function() {
			var files = folder.files, len = files.length, i;
			for (i = 0; i < len; i += 1) {
				console.log(files[i]);
			}
		}
	</script>
</body>
</html>
