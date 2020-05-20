
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
<title>File Upload</title>
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
	

	<table style="width: 100%">
		<colgroup>
			<col style="width: 1%;">
			<col style="width: 48%;">
			<col style="width: 1%;">

			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">
			<col style="width: 4%;">

			<col style="width: 1%;">
		</colgroup>

		<h1>Coupeling complexity</h1>

		<!-- Put <thead>, <tbody>, and <tr>'s here! -->
		<tbody>
			<tr>
				<th>no</th>
				<th>Program statements</th>
				<th>Nr</th>
				<th>Nmcms</th>

				<th>Nmcmd</th>
				<th>Nmcmrs</th>

				<th>Nmcrmd</th>
				<th>Nrmcrms</th>

				<th>Nrmcrmd</th>
				<th>Nrmcms</th>

				<th>Nrmcmd</th>
				<th>Nmrgvs</th>

				<th>Nmrgvd</th>
				<th>Nrmrgvs</th>
				<th>Nrmrgvd</th>
				<th>Ccp</th>

			</tr>

			<%
				for (int i1 = 0; i1 < list.size(); i1++) {

				String originalCodeLine = list.get(i1).toString();
				String codeLine[] = { list.get(i1).toString() };
				String number = codeLine[0].substring(0, codeLine[0].indexOf("#"));

				boolean[] isRecursiveMethod = { false };

				int[] normalToNormalVal = { 0 };
				int[] normalToRecursiveVal = { 0 };
				int[] RecursiveToNormalVal = { 0 };
				int[] RecursiveToRecursiveVal = { 0 };

				int[] normalToOtherNormalM = { 0 };
				int[] normalToOtherRecursiveM = { 0 };
				int[] RecursiveToOtherNormalM = { 0 };
				int[] RecursiveToOtherRecursiveM = { 0 };

				//check map  for any lines match this line
				//check map  for any lines match this line
				int noOfRCall = 0;

				thisFileMethods.entrySet().forEach(e -> {
					if (e.getValue().getRecursiveCallNo().equals(number)) {
				isRecursiveMethod[0] = true;

					}
				});

				normalToNormal.entrySet().forEach(normal -> {

					if (normal.getValue().equals(number))
				normalToNormalVal[0]++;
				});

				normalToRecursive.entrySet().forEach(normal -> {

					if (normal.getValue().equals(number))
				normalToRecursiveVal[0]++;
				});

				RecursiveToNormal.entrySet().forEach(normal -> {

					if (normal.getValue().equals(number))
				RecursiveToNormalVal[0]++;
				});

				RecursiveToRecursive.entrySet().forEach(normal -> {

					if (normal.getValue().equals(number))
				RecursiveToRecursiveVal[0]++;
				});

				int globelVarUse[] = { 0 };

				int globalUsedByR = 0;
				int globalUsedByNonR = 0;

				int globalFromOtherR = 0;
				int globalFromOtherNonR = 0;

				//check about globle var calling from other files

				int globleFromOther[] = { 0 };

				String[] replacement = { "" };

				allGlobalVar.entrySet().stream().forEach(e -> {
					if (codeLine[0].contains(e.getKey().split(",")[1].trim() + "." + e.getValue())) {

				codeLine[0] = (codeLine[0].replaceAll(e.getKey().split(",")[1].trim() + "." + e.getValue(), ""));

				globleFromOther[0]++;
					}

				});

				globalVar.entrySet().forEach(e -> {
					//declare karapu thana magaharinna
					if (!e.getKey().trim().equals(number)) {

				{
					int noOfVarInLine = 0;
					Matcher matcher = Pattern.compile("(.*)[ \\(=+]*(" + e.getValue().trim() + ")[ \\)=;+](.*)")
							.matcher(codeLine[0]);
					while (matcher.find()) {

						noOfVarInLine++;
					}

					globelVarUse[0] += noOfVarInLine;

				}

					}

				});

				boolean[] isGloblalCalledFromRecursive = { false };
				boolean[] isMethodRecursive = { false };

				thisFileMethods.values().stream().filter(e -> e.isRecursiveCall()).collect(Collectors.toList()).forEach(e -> {

					if (e.getMethodBody().contains(codeLine[0])) {
				isMethodRecursive[0] = true;
				if (globelVarUse[0] > 0)
					isGloblalCalledFromRecursive[0] = true;

					}
				});

				//check method calling of other file methods
				allFileMethods.entrySet().stream().forEach(e -> {
					String[] valArray = e.getKey().split(",");
					if (codeLine[0].contains(valArray[1].trim() + "." + valArray[0].trim())) {
				//is other Method is recursuve
				if (e.getValue().isRecursiveCall()) {
					if (isMethodRecursive[0]) {
						//this file method isRecursive	  
						//recursive to other method recursive call
						RecursiveToOtherRecursiveM[0] = 1;
					} else {
						//this file method normal		
						//normal to other method recursive call
						normalToOtherRecursiveM[0] = 1;
					}
				} else {
					//is other Method is normal
					if (isMethodRecursive[0]) {
						//this file method isRecursive	  
						//recursive to other method normal call
						RecursiveToOtherNormalM[0] = 1;
					} else {
						//this file method normal		
						//normal to other method normal call
						normalToOtherNormalM[0] = 1;
					}
				}
					}

				});

				//check is this method recursive and called one
				if (isGloblalCalledFromRecursive[0]) {
					globalFromOtherR = globleFromOther[0];
					globalUsedByR = globelVarUse[0];
				} else {
					globalUsedByNonR = globelVarUse[0];
					globalFromOtherNonR = globleFromOther[0];
				}
			%>


			<tr>

				<td><%=originalCodeLine.substring(0, originalCodeLine.indexOf("#"))%></td>
				<td><%=originalCodeLine.substring(originalCodeLine.indexOf("#") + 1)%></td>
				<td><%=(isRecursiveMethod[0]) ? "1" : "0"%></td>

				<td><%=normalToNormalVal[0]%></td>
				<td><%=normalToOtherNormalM[0]%></td>

				<td><%=normalToRecursiveVal[0]%></td>
				<td><%=normalToOtherRecursiveM[0]%></td>

				<td><%=RecursiveToRecursiveVal[0]%></td>
				<td><%=RecursiveToOtherRecursiveM[0]%></td>

				<td><%=RecursiveToNormalVal[0]%></td>
				<td><%=RecursiveToOtherNormalM[0]%></td>

				<td><%=globalUsedByNonR%></td>
				<td><%=globalFromOtherNonR%></td>


				<td><%=globalUsedByR%></td>
				<td><%=globalFromOtherR%></td>

				<%
					table5.put(number,
						((isRecursiveMethod[0]) ? 2 : 0) + normalToNormalVal[0] * 2 + normalToOtherNormalM[0] * 3
						+ normalToRecursiveVal[0] * 3 + normalToOtherRecursiveM[0] * 4 + RecursiveToRecursiveVal[0] * 4
						+ RecursiveToOtherRecursiveM[0] * 5 + RecursiveToNormalVal[0] * 3 + RecursiveToOtherNormalM[0] * 4
						+ globalUsedByNonR * 1 + globalFromOtherNonR * 2 + globalUsedByR * 1 + globalFromOtherR * 2);
				%>
				<td><%=((isRecursiveMethod[0]) ? 2 : 0) + normalToNormalVal[0] * 2 + normalToOtherNormalM[0] * 3
		+ normalToRecursiveVal[0] * 3 + normalToOtherRecursiveM[0] * 4 + RecursiveToRecursiveVal[0] * 4
		+ RecursiveToOtherRecursiveM[0] * 5 + RecursiveToNormalVal[0] * 3 + RecursiveToOtherNormalM[0] * 4
		+ globalUsedByNonR * 1 + globalFromOtherNonR * 2 + globalUsedByR * 1 + globalFromOtherR * 2%></td>



			</tr>
			<%
				}
			%>

		</tbody>
	</table>


	


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