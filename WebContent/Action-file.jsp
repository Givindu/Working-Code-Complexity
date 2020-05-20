<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Uploader</title>
</head>
<body>
	<h1>
		<a> File Upload:</a>
	</h1>
	<h1>Select Folder:</h1>
	<br />
	</hr>
	<form action="action_file_upload.jsp" method="post"
		enctype="multipart/form-data">
		<input id="myInput" type="file" name="file" webkitdirectory directory
			multiple="multiple" size="50" /> <br /> <br /> <input
			type="submit" value="Upload File" />
		</hr>
	</form>

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
