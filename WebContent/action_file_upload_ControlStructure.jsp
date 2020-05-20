
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="model.Method"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.regex.Matcher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Code Complexity Tool</title>




<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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


<style>



table, td, th {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th {
	height: 50px;
}

#myBtn {
  display: none; /* Hidden by default */
  position: fixed; /* Fixed/sticky position */
  bottom: 20px; /* Place the button at the bottom of the page */
  right: 30px; /* Place the button 30px from the right */
  z-index: 99; /* Make sure it does not overlap */
  border: none; /* Remove borders */
  outline: none; /* Remove outline */
  background-color: red; /* Set a background color */
  color: white; /* Text color */
  cursor: pointer; /* Add a mouse pointer on hover */
  padding: 15px; /* Some padding */
  border-radius: 10px; /* Rounded corners */
  font-size: 18px; /* Increase font size */
}

#myBtn:hover {
  background-color: #555; /* Add a dark-grey background on hover */
}

</style>
</head>
<body>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<%
		String currentClassName = "";
	File file = null;
	int maxFileSize = 5000 * 1004;
	int maxMemSize = 5000 * 1004;
	//if dont have E use access ok drive
	String filePath = "D:/";

	Path root = Paths.get(".").normalize().toAbsolutePath();
	String path = root.toAbsolutePath().toString();

	List<File> fileList = new ArrayList();

	String contentType = request.getContentType();
	if ((contentType.indexOf("multipart/form-data") >= 0)) {

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(maxMemSize);
		//  factory.setRepository(new File("c:\\text"));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxFileSize);
		try {
			List fileItems = upload.parseRequest(request);
			Iterator i = fileItems.iterator();
			out.println("<h1>All Files Complexity </h1>");
			//out.println("<hr>");
			while (i.hasNext()) {
		FileItem fi = (FileItem) i.next();
		if (!fi.isFormField()) {
			String fieldName = fi.getFieldName();
			String fileName = fi.getName();

			boolean isInMemory = fi.isInMemory();
			long sizeInBytes = fi.getSize();
			file = new File(filePath + fileName.substring(fileName.indexOf("\\") + 1));
			fi.write(file);
			System.out.println(fileName.substring(fileName.indexOf("\\") + 1) + "  file we dealing with");
			if(fileName.endsWith(".java")){
			out.println("<a href='#id"+fileName.split("/")[1].replaceAll(" ","")+"'><button>"+fileName.split("/")[1]+"</button></a>");
			}
			fileList.add(file);
			//   out.println("Uploaded Filename: " + filePath + fileName + "<br>");
		}
			}

			//filter files for .java

			fileList = fileList.stream().filter(e -> e.getName().endsWith(".java")).collect(Collectors.toList());

			//Get all methods and store them
			//Get all VAr and store them
			Map<String, String> allGlobalVar = new LinkedHashMap();
			Map<String, Method> allFileMethods = new HashMap();

			for (File nowfile : fileList) {
		List<String> allProgrammeList = new ArrayList();

		try (BufferedReader br = new BufferedReader(new FileReader(nowfile))) {

			String line;
			int no = 1;

			while ((line = br.readLine()) != null) {
				// process the line.
				//Add to list for no and codeline
				if (!line.trim().equals("")) {

					allProgrammeList.add(no + "#" + line);
					no++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String regexString = "";

		for (int x = 0; x < allProgrammeList.size(); x++)
			regexString += allProgrammeList.get(x) + "\n";

		String className = "";

		Matcher classF = Pattern.compile("class (.*)( )*\\{").matcher(regexString);
		while (classF.find()) {
			className = classF.group(1);

		}

		currentClassName = className;
		//replace if } with +if to resolve complexity
		Pattern p = Pattern.compile("if( )*\\((.)*\\)( )*\\{(.|\\n)*?(\\d+#.*})");
		Matcher mif = p.matcher(regexString);
		while (mif.find()) {
			// replace first number with "number" and second number with the first
			String identifier = mif.group(5);
			String ifIdentify = identifier.replace("}", "-if");
			regexString = regexString.replace(identifier, ifIdentify);
		}
		//replace if end

		//replace for } with +for to resolve complexity
		Pattern p1 = Pattern.compile("for( )*\\((.)*\\)( )*\\{(.|\\n)*?(\\d+#.*})");
		Matcher mif1 = p1.matcher(regexString);
		while (mif1.find()) {
			// replace first number with "number" and second number with the first
			String identifier = mif1.group(5);
			String ifIdentify = identifier.replace("}", "-for");
			regexString = regexString.replace(identifier, ifIdentify);
		}
		//replace for  end

		Matcher m = Pattern.compile("((.+\\(.*\\))( )*\\{(\\n|\\r|\\n|.)*?\\})").matcher(regexString);
		while (m.find()) {

			//name with access and return 
			String methodName = m.group(2);

			String methodWithAccessAndReturn = (methodName.replaceAll("\\(.*\\)", ""));

			String onlyMethodName = methodWithAccessAndReturn.substring(methodWithAccessAndReturn.lastIndexOf(" "));

			Method method = new Method();
			String methodBody = m.group().substring(m.group().indexOf("{"));
			method.setMethodBody(methodBody);

			//get no of the recursive call to own mwthod
			Pattern pattern = Pattern.compile("(\\d*)#.*" + onlyMethodName);
			Matcher matcher = pattern.matcher(methodBody);
			//set recursive call no and put to method object

			if (matcher.find()) {

				//check if method recursive
				method.setRecursiveCall(true);
				method.setRecursiveCallNo(matcher.group(1));
			}

			allFileMethods.put(onlyMethodName + "," + className, method);
		}
		//all methods are added

		//check global vaiables

		//remove methods from class
		String[] removeMetho = { regexString };

		allFileMethods.entrySet().forEach(e -> {
			removeMetho[0] = removeMetho[0].replace(e.getValue().getMethodBody(), "");
		});

		Matcher globalVariables = Pattern.compile("(\\d)+#.+ (.+)=.+;").matcher(removeMetho[0]);
		while (globalVariables.find()) {

			allGlobalVar.put(globalVariables.group(1) + "," + className, globalVariables.group(2));
		}

			}

			//individual class file checking	

			for (File nowfile : fileList) {
	%>
	</br>
	</br>
	<hr>
	<h1 id="<%="id"+nowfile.getName().replaceAll(" ","")%>"><%=nowfile.getName()%></h1>
	<hr>
	
	<div hidden>
	<%
		List<String> list = new ArrayList();
	//Set<String> listOfOtherMethodCallsThisFile = new HashSet();

	Map<String, String> normalToNormal = new LinkedHashMap();
	Map<String, String> normalToRecursive = new LinkedHashMap();
	Map<String, String> RecursiveToNormal = new LinkedHashMap();
	Map<String, String> RecursiveToRecursive = new LinkedHashMap();

	Map<String, String> globalVar = new LinkedHashMap();

	try (BufferedReader br = new BufferedReader(new FileReader(nowfile))) {

		String line;
		int no = 1;

		while ((line = br.readLine()) != null) {
			// process the line.
			//Add to list for no and codeline
			if (!line.trim().equals("")) {
		list.add(no + "#" + line);
		out.println(line + "</br>");
		no++;
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	out.println("<hr>");
	out.println("<hr>");
	out.println("<br><br>");
	out.println("<br><br>");

	String regexString = "";

	for (int x = 0; x < list.size(); x++)
		regexString += list.get(x) + "\n";

	//finding the main class name of the file

	//Finding  methods
	//Map designed with method name and method body
	Map<String, Method> thisFileMethods = new HashMap();
	Map<String, Integer> table1 = new HashMap();
	Map<String, Integer> table2 = new HashMap();
	Map<String, Integer> table3 = new HashMap();
	Map<String, Integer> table4 = new HashMap();
	Map<String, Integer> table5 = new HashMap();
	Map<String, Integer> table6 = new HashMap();

	//replace if } with +if to resolve complexity
	Pattern p = Pattern.compile("if( )*\\((.)*\\)( )*\\{(.|\\n)*?(\\d+#.*})");
	Matcher mif = p.matcher(regexString);
	while (mif.find()) {
		// replace first number with "number" and second number with the first
		String identifier = mif.group(5);
		String ifIdentify = identifier.replace("}", "-if");
		regexString = regexString.replace(identifier, ifIdentify);
	}
	//replace if end

	//replace for } with +for to resolve complexity
	Pattern p1 = Pattern.compile("for( )*\\((.)*\\)( )*\\{(.|\\n)*?(\\d+#.*})");
	Matcher mif1 = p1.matcher(regexString);
	while (mif1.find()) {
		// replace first number with "number" and second number with the first
		String identifier = mif1.group(5);
		String ifIdentify = identifier.replace("}", "-for");
		regexString = regexString.replace(identifier, ifIdentify);
	}
	//replace for  end

	Matcher m = Pattern.compile("((.+\\(.*\\))( )*\\{(\\n|\\r|\\n|.)*?\\})").matcher(regexString);
	while (m.find()) {

		//name with access and return 
		String methodName = m.group(2);

		String methodWithAccessAndReturn = (methodName.replaceAll("\\(.*\\)", ""));

		String onlyMethodName = methodWithAccessAndReturn.substring(methodWithAccessAndReturn.lastIndexOf(" "));

		//System.out.println(onlyMethodName);
		System.out.println("\n__________________________________________");

		Method method = new Method();
		String methodBody = m.group().substring(m.group().indexOf("{"));
		method.setMethodBody(methodBody);

		//get no of the recursive call to own mwthod
		Pattern pattern = Pattern.compile("(\\d*)#.*" + onlyMethodName);
		Matcher matcher = pattern.matcher(methodBody);
		//set recursive call no and put to method object
		if (matcher.find()) {

			//check if method recursive
			method.setRecursiveCall(true);
			// 			System.out.println(matcher.group() + " own method call found");
			// 			System.out.println(matcher.group(1));
			method.setRecursiveCallNo(matcher.group(1));
		}
		System.out.println(thisFileMethods + "\n_________________________________________");

		thisFileMethods.put(onlyMethodName, method);
	}

	//size taaaaaaaaaaaaaaaabellllllllll starteeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddd
	// 	for (int x = 0; x < list.size(); x++)
	// 		regexString += list.get(x) + "\n";
	%>
	</div>
	
	
	
	
	
	

	<%
		//size taaaaaaaaaaaaaaaabellllllllll endeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

	//all methods are added

	//check global vaiables

	//remove methods from class
	String[] removeMetho = { regexString };

	thisFileMethods.entrySet().forEach(e -> {
		removeMetho[0] = removeMetho[0].replace(e.getValue().getMethodBody(), "");
	});

	Matcher globalVariables = Pattern.compile("(\\d)+#.+ (.+)=.+;").matcher(removeMetho[0]);
	while (globalVariables.find()) {
		globalVar.put(globalVariables.group(1), globalVariables.group(2));
	}

	//find other methods called in this method 

	thisFileMethods.entrySet().stream().forEach((entry) -> {
		String bodyWithOutMethod = entry.getValue().getMethodBody().replaceAll(entry.getKey(), "");
		thisFileMethods.entrySet().stream().filter(e -> !e.getKey().equals(entry.getKey())).forEach(methodName -> {
			//get other method calls from this method	
			Pattern pattern = Pattern.compile("(\\d*)#.*" + methodName.getKey().trim());
			Matcher matcher = pattern.matcher(bodyWithOutMethod);

			//set recursive call no and put to method object
			if (matcher.find()) {
		System.out.println(entry.getKey() + " method  inner call " + methodName.getKey());
		System.out.println(matcher.group(1) + " number ");

		if (entry.getValue().isRecursiveCall()) {
			//inside recursive method
			if (methodName.getValue().isRecursiveCall()) {
				//calling method recursive
				RecursiveToRecursive.put(methodName.getKey(), matcher.group(1));
			} else {
				//calling method not recursive
				RecursiveToNormal.put(methodName.getKey(), matcher.group(1));
			}

		} else {
			//inside normal method 
			if (methodName.getValue().isRecursiveCall()) {
				//calling method recursive
				normalToRecursive.put(methodName.getKey(), matcher.group(1));
			} else {
				//calling method normal
				normalToNormal.put(methodName.getKey(), matcher.group(1));

			}

		}

			}
			System.out.println();

		});

	});

	System.out.println(normalToNormal + "  normalToNormal");
	System.out.println(normalToRecursive + " normalToRecursive");
	System.out.println(RecursiveToNormal + " RecursiveToNormal");
	System.out.println(RecursiveToRecursive + " RecursiveToRecursive");

	//variable complexity taaaaaaaaaaaaaaaabellllllllll starteeeeeeeeeeeeeeeeeeeedddddddddddddddddddddddddddddddddddddddddd
	%>
	

	

	


	<h1 style="position: absolute; right: 282px;">complexity of a program due to control structures</h1>
	<br><br><br><br><br>


	<table class="table table-striped table-dark" style="width: 78%; margin-left: 184px;" >
		<colgroup>
			<col style="width: 8%;">
			<col style="width: 78%;">
			<col style="width: 1%;">

			<col style="width: 4%;">
			<col style="width: 4%;">


		</colgroup>



		<!-- 		Wtcs NC Ccspps Ccs   -->



		<tbody>
			<tr>
				<th>Line No</th>
				<th>Program statements</th>


				<th>Wtcs</th>

				<th>NC</th>
				<th>Ccspps</th>

				<th>Ccs</th>


			</tr>


			<%
				int outermost = 0;

			for (int i1 = 0; i1 < list.size(); i1++) {

				String originalCodeLine = list.get(i1).toString();
				String codeLine[] = { list.get(i1).toString() };
				String number = codeLine[0].substring(0, codeLine[0].indexOf("#"));

				int typeOfStructure = 0;
				int noOfConditions = 0;
				int previouse = 0;
				Matcher controleTypes = Pattern.compile("(for|if|switch|case|while)( )*(\\((.*)\\)|.*\\:)")
				.matcher(originalCodeLine);

				while (controleTypes.find()) {

					String type = controleTypes.group(1);
					System.out.println(type + " typeeeeeeeeee " + originalCodeLine);

					String conditions = controleTypes.group(3);

					switch (type) {

					case "for":
				if (outermost != 0) {
					previouse = 3;
				}
				outermost++;
				typeOfStructure = 3;
				break;

					case "while":
				typeOfStructure = 3;
				break;

					case "if":
				typeOfStructure = 2;
				break;

					case "switch":
				typeOfStructure = 2;
				break;

					case "case":
				typeOfStructure = 1;
				break;

					}

					Matcher conditionSet = Pattern.compile("(==|!=|<=|>=|>|<)").matcher(conditions);
					while (conditionSet.find()) {
				System.out.println(conditionSet.group(1) + " condition");
				noOfConditions++;
					}

					System.out.println("structureeeeeeeeeeeeeeee    " + typeOfStructure + "\n\n\n");

				}
			%>


			<tr>

				<td><%=originalCodeLine.substring(0, originalCodeLine.indexOf("#"))%></td>
				<td><%=originalCodeLine.substring(originalCodeLine.indexOf("#") + 1)%></td>

				<td><%=typeOfStructure%></td>

				<td><%=noOfConditions%></td>

				<td><%=previouse%></td>
				<%
					table6.put(number, (typeOfStructure * noOfConditions) + previouse);
				%>

				<td><%=(typeOfStructure * noOfConditions) + previouse%></td>




			</tr>
			<%
				}
			%>
		</tbody>
	</table>


	
	<br>
	<br>

	<%
		}

	} catch (Exception exc) {
		exc.printStackTrace();
	}

	//file ekak naththm output eka
	} else {
		out.println("<html>");
		out.println("<body>");
		out.println("<p>No file uploaded</p>");
		out.println("</body>");
		out.println("</html>");
	}
	%>


</body>

<script type="text/javascript">

mybutton = document.getElementById("myBtn");

//When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
 mybutton.style.display = "block";
} else {
 mybutton.style.display = "none";
}
}

//When the user clicks on the button, scroll to the top of the document
function topFunction() {
document.body.scrollTop = 0; // For Safari
document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

</script>

</html>