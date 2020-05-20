
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
</style>
</head>
<body>
	<%
		String currentClassName = "";
	File file = null;
	int maxFileSize = 5000 * 1004;
	int maxMemSize = 5000 * 1004;
	//if dont have E use access ok drive
	String filePath = "E:/";

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
	%>

	<button type="button" onclick="show(); showAll(); ">All
		complexity Table</button>

	<button type="button" onclick="show(); showControle();">Controle
		Structure complexity Table</button>

	<button type="button" onclick="show(); showCouple();">Method
		complexity Table</button>

	<button type="button" onclick="show(); showCoupleComplex();">showCouple
		complexity Table</button>


	<button type="button" onclick="show(); showInhe();">Inheritance
		complexity Table</button>

	<button type="button" onclick="show(); showVar();">Variable
		complexity Table</button>

	<button type="button" onclick="show(); showSize();">Size
		complexity Table</button>

	<script>
			
		//	[...document.querySelectorAll("div.show")].forEach(e=>e.hidden=true);
			
			function show() {
             alert("okkkkk");
				[...document.querySelectorAll("div.size")].forEach(e=>e.hidden=false);
					
			}
			
			function showAll() {
				
				

				
				var control = document.getElementsByClassName("control");
				  var i;
				  for (i = 0; i < control.length; i++) {
					  control[i].style.display = "none";
				  }
				
				var method = document.getElementsByClassName("method");
				  var i;
				  for (i = 0; i < method.length; i++) {
					  method[i].style.display = "none";
				  }
				  
				  var couple = document.getElementsByClassName("couple");
				  var i;
				  for (i = 0; i < couple.length; i++) {
					  couple[i].style.display = "none";
				  }
				  
				  var inheritance = document.getElementsByClassName("inheritance");
				  var i;
				  for (i = 0; i < inheritance.length; i++) {
					  inheritance[i].style.display = "none";
				  }
				  
				  var variable = document.getElementsByClassName("variable");
				  var i;
				  for (i = 0; i < variable.length; i++) {
					  variable[i].style.display = "none";
				  }
				  
				  var all = document.getElementsByClassName("all");
				  var i;
				  for (i = 0; i < all.length; i++) {
					  all[i].style.display = "";
				  }
				  
				  var show = document.getElementsByClassName("show");
				  var i;
				  for (i = 0; i < show.length; i++) {
					  show[i].style.display = "none";
				  }
				
				
				
				
			}
			
			function showControle() {
				
				var control = document.getElementsByClassName("control");
				  var i;
				  for (i = 0; i < control.length; i++) {
					  control[i].style.display = "";
				  }
				
				var method = document.getElementsByClassName("method");
				  var i;
				  for (i = 0; i < method.length; i++) {
					  method[i].style.display = "none";
				  }
				  
				  var couple = document.getElementsByClassName("couple");
				  var i;
				  for (i = 0; i < couple.length; i++) {
					  couple[i].style.display = "none";
				  }
				  
				  var inheritance = document.getElementsByClassName("inheritance");
				  var i;
				  for (i = 0; i < inheritance.length; i++) {
					  inheritance[i].style.display = "none";
				  }
				  
				  var variable = document.getElementsByClassName("variable");
				  var i;
				  for (i = 0; i < variable.length; i++) {
					  variable[i].style.display = "none";
				  }
				  
				  var all = document.getElementsByClassName("all");
				  var i;
				  for (i = 0; i < all.length; i++) {
					  all[i].style.display = "none";
				  }
				  
				  var show = document.getElementsByClassName("show");
				  var i;
				  for (i = 0; i < show.length; i++) {
					  show[i].style.display = "none";
				  }
				  
				
			}
			
			function showCouple() {

				var control = document.getElementsByClassName("control");
				  var i;
				  for (i = 0; i < control.length; i++) {
					  control[i].style.display = "none";
				  }
				
				var method = document.getElementsByClassName("method");
				  var i;
				  for (i = 0; i < method.length; i++) {
					  method[i].style.display = "";
				  }
				  
				  var couple = document.getElementsByClassName("couple");
				  var i;
				  for (i = 0; i < couple.length; i++) {
					  couple[i].style.display = "none";
				  }
				  
				  var inheritance = document.getElementsByClassName("inheritance");
				  var i;
				  for (i = 0; i < inheritance.length; i++) {
					  inheritance[i].style.display = "none";
				  }
				  
				  var variable = document.getElementsByClassName("variable");
				  var i;
				  for (i = 0; i < variable.length; i++) {
					  variable[i].style.display = "none";
				  }
				  
				  var all = document.getElementsByClassName("all");
				  var i;
				  for (i = 0; i < all.length; i++) {
					  all[i].style.display = "none";
				  }
				  
				  var show = document.getElementsByClassName("show");
				  var i;
				  for (i = 0; i < show.length; i++) {
					  show[i].style.display = "none";
				  }
				  
				
				
			}
			
			function showCoupleComplex() {
				
				

				var control = document.getElementsByClassName("control");
				  var i;
				  for (i = 0; i < control.length; i++) {
					  control[i].style.display = "none";
				  }
				
				var method = document.getElementsByClassName("method");
				  var i;
				  for (i = 0; i < method.length; i++) {
					  method[i].style.display = "none";
				  }
				  
				  var couple = document.getElementsByClassName("couple");
				  var i;
				  for (i = 0; i < couple.length; i++) {
					  couple[i].style.display = "";
				  }
				  
				  var inheritance = document.getElementsByClassName("inheritance");
				  var i;
				  for (i = 0; i < inheritance.length; i++) {
					  inheritance[i].style.display = "none";
				  }
				  
				  var variable = document.getElementsByClassName("variable");
				  var i;
				  for (i = 0; i < variable.length; i++) {
					  variable[i].style.display = "none";
				  }
				  
				  var all = document.getElementsByClassName("all");
				  var i;
				  for (i = 0; i < all.length; i++) {
					  all[i].style.display = "none";
				  }
				  
				  var show = document.getElementsByClassName("show");
				  var i;
				  for (i = 0; i < show.length; i++) {
					  show[i].style.display = "none";
				  }
				  
				
				
				
			}
			
			function showInhe() {
				
				
				var control = document.getElementsByClassName("control");
				  var i;
				  for (i = 0; i < control.length; i++) {
					  control[i].style.display = "none";
				  }
				
				var method = document.getElementsByClassName("method");
				  var i;
				  for (i = 0; i < method.length; i++) {
					  method[i].style.display = "none";
				  }
				  
				  var couple = document.getElementsByClassName("couple");
				  var i;
				  for (i = 0; i < couple.length; i++) {
					  couple[i].style.display = "none";
				  }
				  
				  var inheritance = document.getElementsByClassName("inheritance");
				  var i;
				  for (i = 0; i < inheritance.length; i++) {
					  inheritance[i].style.display = "";
				  }
				  
				  var variable = document.getElementsByClassName("variable");
				  var i;
				  for (i = 0; i < variable.length; i++) {
					  variable[i].style.display = "none";
				  }
				  
				  var all = document.getElementsByClassName("all");
				  var i;
				  for (i = 0; i < all.length; i++) {
					  all[i].style.display = "none";
				  }
				  
				  var show = document.getElementsByClassName("show");
				  var i;
				  for (i = 0; i < show.length; i++) {
					  show[i].style.display = "none";
				  }
				
				
			}
			
			
			function showVar() {
				
				

				
				var control = document.getElementsByClassName("control");
				  var i;
				  for (i = 0; i < control.length; i++) {
					  control[i].style.display = "none";
				  }
				
				var method = document.getElementsByClassName("method");
				  var i;
				  for (i = 0; i < method.length; i++) {
					  method[i].style.display = "none";
				  }
				  
				  var couple = document.getElementsByClassName("couple");
				  var i;
				  for (i = 0; i < couple.length; i++) {
					  couple[i].style.display = "none";
				  }
				  
				  var inheritance = document.getElementsByClassName("inheritance");
				  var i;
				  for (i = 0; i < inheritance.length; i++) {
					  inheritance[i].style.display = "none";
				  }
				  
				  var variable = document.getElementsByClassName("variable");
				  var i;
				  for (i = 0; i < variable.length; i++) {
					  variable[i].style.display = "";
				  }
				  
				  var all = document.getElementsByClassName("all");
				  var i;
				  for (i = 0; i < all.length; i++) {
					  all[i].style.display = "none";
				  }
				  
				  var show = document.getElementsByClassName("show");
				  var i;
				  for (i = 0; i < show.length; i++) {
					  show[i].style.display = "none";
				  }
				
				
				
	
			}
			
			function showSize() {
				
				

				
				var control = document.getElementsByClassName("control");
				  var i;
				  for (i = 0; i < control.length; i++) {
					  control[i].style.display = "none";
				  }
				
				var method = document.getElementsByClassName("method");
				  var i;
				  for (i = 0; i < method.length; i++) {
					  method[i].style.display = "none";
				  }
				  
				  var couple = document.getElementsByClassName("couple");
				  var i;
				  for (i = 0; i < couple.length; i++) {
					  couple[i].style.display = "none";
				  }
				  
				  var inheritance = document.getElementsByClassName("inheritance");
				  var i;
				  for (i = 0; i < inheritance.length; i++) {
					  inheritance[i].style.display = "none";
				  }
				  
				  var variable = document.getElementsByClassName("variable");
				  var i;
				  for (i = 0; i < variable.length; i++) {
					  variable[i].style.display = "none";
				  }
				  
				  var all = document.getElementsByClassName("all");
				  var i;
				  for (i = 0; i < all.length; i++) {
					  all[i].style.display = "none";
				  }
				  
				  var show = document.getElementsByClassName("show");
				  var i;
				  for (i = 0; i < show.length; i++) {
					  show[i].style.display = "";
				  }
				
				
				
			}
			
			
			</script>
	<%
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
	<h1><%=nowfile.getName()%></h1>



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

	<div class="size" hidden>

		<table class="show" style="width: 100%">
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
			<h1 class="show">Size complexity</h1>


			<!-- Put <thead>, <tbody>, and <tr>'s here! -->

			<!-- CS    -->

			<!-- Nkw  -->

			<!-- Nid    -->

			<!-- Nop  -->

			<!-- Nnv  -->

			<!-- Nsl  -->



			<tbody>
				<tr>
					<th>no</th>
					<th>Program statements</th>


					<th>Nkw</th>

					<th>Nid</th>
					<th>Nop</th>

					<th>Nnv</th>
					<th>Nsl</th>

					<th>CS</th>

				</tr>
				<%
					//validate size table

				// 				thisFileMethods.entrySet().stream().forEach(e->{

				// 					System.out.println(e.getValue().getMethodBody());
				// 				});

				for (int i1 = 0; i1 < list.size(); i1++) {

					String originalCodeLine = list.get(i1).toString();
					String codeLine[] = { list.get(i1).toString() };
					String number = codeLine[0].substring(0, codeLine[0].indexOf("#"));

					//match keywords 
					//if you find new ones add using |keyword to end inside brakets

					Pattern patternKeyword = Pattern.compile(
					"(class|public|void|true|else|default|return|null|break|thisabstract|break|catch|class|continue|default|enum|extends|final|finally|implements|import|instanceof|interface|native|new|null|package|private|protected|public|return|static|strictfp|super|synchronized|this|throw|throws|transient|try|void|volatile)");
					Matcher mKeyWords = patternKeyword.matcher(codeLine[0]);
					int keyCount = 0;
					while (mKeyWords.find()) {
						// replace first number with "number" and second number with the first
						String identifier = mKeyWords.group();
						int count = mKeyWords.groupCount();
						keyCount++;

					}

					//identifier check
					int identifiers = 0;
					//this is a method so increment by 1
					String thisFileMehodAdded = thisFileMethods.keySet().stream().reduce((added, val) -> {
						return added.trim() + "|" + val.trim();
					}).get().toString();
					if (codeLine[0].trim().matches(".*(" + thisFileMehodAdded + ")\\(.*\\)( )*(\\{).*")) {
						identifiers++;
					} else {
						//not a variable and ahs identifiers
						if (!codeLine[0].trim().matches("(.+)=.+;")) {

					Pattern patternIdentifiers = Pattern.compile(
							"(?!.*class)(?!.*public)(?!.*for)(?!.*boolean)(?!.*byte)(?!.*char)(?!.*short)(?!.?int)(?!.*long)(?!.*float)(?!.*double)\\b([A-Za-z][A-Za-z0-9_]*)\\b");
					Matcher mIdentifiers = patternIdentifiers.matcher(codeLine[0]);

					while (mIdentifiers.find()) {
						identifiers++;
					}

						}

					}

					//opetaror Check
					//(--|==|!=|>=|<=|&&>|<|\+\+|\*|\/|%|\+|\||!|\^|~|>>>=|>>>|<<<|<<|>>|\,|->|-|\.|::|\+=|-=|\*=|\/=|=|&=|%=|<<=|>>=|\^=)

					int operators = 0;
					Pattern patternOperators = Pattern.compile(
					"(--|==|!=|>=|<=|&&|>|<|\\+\\+|\\*|\\/|%|\\+|\\||!|\\^|~|>>>=|>>>|<<<|<<|>>|\\,|->|-|\\.|::|\\+=|-=|\\*=|\\/=|=|&=|%=|<<=|>>=|\\^=)");
					Matcher mOperators = patternOperators.matcher(codeLine[0]);

					while (mOperators.find()) {
						operators++;
					}

					//check for numaric values

					int numeric = 0;
					Pattern patternnumeric = Pattern.compile("\\b(\\d+\\.\\d+)\\b|\\b(\\d+)\\b");
					Matcher mnumeric = patternnumeric.matcher(codeLine[0].split("#")[1]);

					while (mnumeric.find()) {

						numeric++;
					}

					//check for String literals
					//\".*?\"

					int stringCount = 0;
					Pattern patternStringCount = Pattern.compile("\".*?\"");
					Matcher mpatternStringCount = patternStringCount.matcher(codeLine[0]);

					while (mpatternStringCount.find()) {

						stringCount++;
					}
				%>


				<tr>

					<td><%=originalCodeLine.substring(0, originalCodeLine.indexOf("#"))%></td>
					<td><%=originalCodeLine.substring(originalCodeLine.indexOf("#") + 1)%></td>

					<td><%=keyCount%></td>

					<td><%=identifiers%></td>

					<td><%=operators%></td>

					<td><%=numeric%></td>

					<td><%=stringCount%></td>
					<%
						table1.put(number, (keyCount + identifiers + operators + numeric + stringCount));
					%>
					<td><%=keyCount + identifiers + operators + numeric + stringCount%></td>


				</tr>
				<%
					}
				%>


			</tbody>
		</table>
		<br> <br>



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

		<table class="variable" style="width: 100%">
			<colgroup>
				<col style="width: 1%;">
				<col style="width: 48%;">
				<col style="width: 1%;">

				<col style="width: 4%;">
				<col style="width: 4%;">


			</colgroup>

			<h1 class="variable">Variable complexity</h1>

			<!-- 		Wvs Npdtv Ncdtv Cv  -->



			<tbody>
				<tr>
					<th>no</th>
					<th>Program statements</th>


					<th>Wvs</th>

					<th>Npdtv</th>
					<th>Ncdtv</th>

					<th>Cv</th>


				</tr>
				<%
					//validate size table

				// 				thisFileMethods.entrySet().stream().forEach(e->{

				// 					System.out.println(e.getValue().getMethodBody());
				// 				});

				for (int i1 = 0; i1 < list.size(); i1++) {

					String originalCodeLine = list.get(i1).toString();
					String codeLine[] = { list.get(i1).toString() };
					String number = codeLine[0].substring(0, codeLine[0].indexOf("#"));

					int scope = 0;
					//System.out.println(allGlobalVar+"     global var       "+currentClassName);

					final String stupidFinal = currentClassName;
					Map<String, String> keys = allGlobalVar.entrySet().stream().filter(e -> e.getKey().contains(stupidFinal))
					.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
					//keys.keySet().forEach(System.out::println);

					int scopeType = 0;
					int primitive = 0;
					int global = 0;

					if (keys.containsKey(number.trim() + "," + currentClassName) && !codeLine[0].contains("class")) {

						if (codeLine[0].matches(".+(byte|short|int|long|float|double|boolean|char).+")) {
					//System.out.println(originalCodeLine + " this is primitive and global");
					primitive = 1;
					scopeType = 2;
						} else {
					//System.out.println(originalCodeLine + "  this is notttttt primitive and global");
					global = 1;
					scopeType = 2;
						}

					} else {

						if (codeLine[0].trim().matches("(.+)=.+;")) {
					if (codeLine[0].matches(".+(byte|short|int|long|float|double|boolean|char).+")) {
						//System.out.println(originalCodeLine + " this is primitive and not global");
						primitive = 1;
						scopeType = 1;
					} else {
						//System.out.println(originalCodeLine + "  this is notttttt primitive and not global");
						global = 1;
						scopeType = 1;
					}
						}
					}
				%>


				<tr>

					<td><%=originalCodeLine.substring(0, originalCodeLine.indexOf("#"))%></td>
					<td><%=originalCodeLine.substring(originalCodeLine.indexOf("#") + 1)%></td>

					<td><%=scopeType%></td>

					<td><%=primitive%></td>

					<td><%=global%></td>

					<%
						table2.put(number, scopeType * ((1 * primitive) + (2 * global)));
					%>

					<td><%=scopeType * ((1 * primitive) + (2 * global))%></td>




				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br> <br> <br> <br>
		<table class="method" style="width: 100%">
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


			<h1 class="method">complexity of a program due to methods</h1>

			<!-- 
		
		Wmrt Npdtp Ncdtp Cm 
		Put <thead>, <tbody>, and <tr>'s here! -->
			<tbody>
				<tr>
					<th>no</th>
					<th>Program statements</th>
					<th>Wmrt</th>
					<th>Npdtp</th>

					<th>Ncdtp</th>
					<th>Cm</th>



				</tr>




				<%
					for (int i1 = 0; i1 < list.size(); i1++) {

					String originalCodeLine = list.get(i1).toString();
					String codeLine[] = { list.get(i1).toString() };
					String number = codeLine[0].substring(0, codeLine[0].indexOf("#"));

					//		if(originalCodeLine.matches(".*(\\w+)( )+(\\w+)+( )*\\((.*)\\)( )*\\{.*"))
					//	System.out.println(originalCodeLine+"  this is a method ");

					Matcher methoFound = Pattern.compile("(\\w+)( )+(\\w+)+( )*\\((.*)\\)( )*\\{").matcher(originalCodeLine);
					int returnTypePorO = 0;
					int isPrimitive = 0;
					int isComposite = 0;

					while (methoFound.find()) {

						String returnType = methoFound.group(1);
						String parameter = methoFound.group(5);
						System.out.println(returnType + "  Return Type  - parameter " + parameter);

						if (returnType.matches(".*(byte|short|int|long|float|double|boolean|char).*")) {
					System.out.println(" return type primitive ");
					returnTypePorO = 1;
						} else {

					if (!returnType.contains("void")) {
						returnTypePorO = 2;
					}

					System.out.println(" return type not primitive ");

						}

						if (parameter.matches(".*(byte|short|int|long|float|double|boolean|char).*")) {
					System.out.println(" para type primitive ");
					isPrimitive = 1;
						} else {
					isComposite = 1;
					System.out.println(" para type not primitive ");

						}

					}
				%>
				<tr>
					<td><%=originalCodeLine.substring(0, originalCodeLine.indexOf("#"))%></td>
					<td><%=originalCodeLine.substring(originalCodeLine.indexOf("#") + 1)%></td>
					<td><%=returnTypePorO%></td>
					<td><%=isPrimitive%></td>
					<td><%=isComposite%></td>
					<%
						table3.put(number, returnTypePorO + (1 * isPrimitive) + (2 * isComposite));
					%>

					<td><%=returnTypePorO + (1 * isPrimitive) + (2 * isComposite)%></td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
		<br> <br>


		<table class="couple" style="width: 100%">
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

			<h1 class="couple">Coupeling complexity</h1>

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
		<br>
		<br>

		<table class="control" style="width: 100%">
			<colgroup>
				<col style="width: 1%;">
				<col style="width: 48%;">
				<col style="width: 1%;">

				<col style="width: 4%;">
				<col style="width: 4%;">


			</colgroup>


			<h1 class="control">complexity of a program due to control structures</h1>

			<!-- 		Wtcs NC Ccspps Ccs   -->



			<tbody>
				<tr>
					<th>no</th>
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
		<br> <br>

		<table class="inheritance" style="width: 100%">
			<colgroup>
				<col style="width: 1%;">
				<col style="width: 48%;">

				<col style="width: 6%;">
				<col style="width: 6%;">
				<col style="width: 6%;">
				<col style="width: 6%;">

				<col style="width: 6%;">
				<col style="width: 6%;">
				<col style="width: 10%;">

			</colgroup>

			<h1 class="inheritance">complexity of a program due to Inheritance</h1>


			<!-- 	Cs Cv Cm Ci Ccp Ccs TCps    -->

			<!-- Count Class Name No of direct inheritances -->
			<!--  (Ndi) -->
			<!-- No of indirect inheritances -->
			<!-- (Nidi) -->
			<!-- Total inheritances -->
			<!-- (Ti) Ci -->

			<tbody>
				<tr>
					<th>no</th>
					<th>Program statements</th>



					<th>Count</th>
					<th>Class Name</th>
					<th>No of direct inheritances</th>
					<th>No of indirect inheritances</th>
					<th>Total inheritances</th>
					<th>Ci</th>


				</tr>
				<%!public String getMapping(String className, Map<String, String> classesAndData) {

		Matcher extendedClass = Pattern.compile(".*extends( )+(.+)").matcher(className);
		String fullClassMap = className;
		if (extendedClass.find()) {

			//	System.out.println(classesAndData.get(extendedClass.group(2).trim()).equals("")+"          dsssssssssssssssssss");

			if (classesAndData.get(extendedClass.group(2).trim()).equals("")) {
				fullClassMap = fullClassMap + "null";
			} else {
				fullClassMap += classesAndData.get(extendedClass.group(2).trim());

			}

		}

		return fullClassMap;
	}%>

				<%
					Map<String, String> classesAndData = new LinkedHashMap();

				Matcher classes = Pattern.compile("class( )+(.+)\\{").matcher(regexString);

				while (classes.find()) {
					String className = classes.group(2);
					if (className.contains("extends")) {
						classesAndData.put(className.substring(0, className.indexOf("extends")).trim(), className);
					} else {

						classesAndData.put(className, "");
					}
				}

				for (int i1 = 0; i1 < list.size(); i1++) {

					String originalCodeLine = list.get(i1).toString();
					String codeLine[] = { list.get(i1).toString() };
					String number = codeLine[0].substring(0, codeLine[0].indexOf("#"));

					int ci = 0;
					int classScore = 0;
					int direct = 0;
					int inDirect = 0;
					String classNameCol = "";

					Matcher matchAgain = Pattern.compile("class( )+(.+)\\{").matcher(originalCodeLine);

					while (matchAgain.find()) {
						String className = matchAgain.group(2);

						if (originalCodeLine.contains("extends")) {

					direct = 1;

					String lastExtend = className.substring(className.indexOf("extends"));
					String fullClassMap = className;
					System.out.println(className.split("extends")[0] + "2111111111111111111111111111111111111");
					classNameCol = className.split("extends")[0];
					Matcher extendedClass = Pattern.compile("extends( )+(.+)").matcher(className);
					if (extendedClass.find()) {

						while (!fullClassMap.contains("null")) {

							fullClassMap = getMapping(fullClassMap, classesAndData);

						}

						Matcher countOfExtend = Pattern.compile("extends").matcher(fullClassMap);
						while (countOfExtend.find()) {
							System.out.println(fullClassMap.replaceAll("null", "") + "  data Map Generated count "
									+ countOfExtend.group());
							classScore++;
						}

					}

						} else {
					System.out.println(className + "2111111111111111111111111111111111111");
					classNameCol = className;
					classScore = 0;
						}
					}

					if (classScore > 4) {
						classScore = 4;
					}

					for (int x = 1; x <= classScore; x++) {
						ci += x;
					}
				%>


				<tr>

					<td><%=originalCodeLine.substring(0, originalCodeLine.indexOf("#"))%></td>
					<td><%=originalCodeLine.substring(originalCodeLine.indexOf("#") + 1)%></td>
					<%
						table4.put(number, ci);
					%>

					<td><%=number%></td>
					<td><%=classNameCol%></td>
					<td><%=direct%></td>
					<td><%=classScore - direct%></td>
					<td><%=classScore%></td>
					<td><%=ci%></td>






				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br> <br>






		<table class="all" style="width: 100%">
			<colgroup>
				<col style="width: 1%;">
				<col style="width: 48%;">

				<col style="width: 6%;">
				<col style="width: 6%;">
				<col style="width: 6%;">
				<col style="width: 6%;">

				<col style="width: 6%;">
				<col style="width: 6%;">
				<col style="width: 10%;">

			</colgroup>

			<h1 class="all">complexity of a program due to all the factors</h1>


			<!-- 	Cs Cv Cm Ci Ccp Ccs TCps    -->



			<tbody>
				<tr>
					<th>no</th>
					<th>Program statements</th>


					<th>Cs</th>

					<th>Cv</th>
					<th>Cm</th>

					<th>Ci</th>

					<th>Ccp</th>
					<th>Ccs</th>
					<th>Tcps</th>

				</tr>


				<%
					for (int i1 = 0; i1 < list.size(); i1++) {

					String originalCodeLine = list.get(i1).toString();
					String codeLine[] = { list.get(i1).toString() };
					String number = codeLine[0].substring(0, codeLine[0].indexOf("#"));
				%>


				<tr>

					<td><%=originalCodeLine.substring(0, originalCodeLine.indexOf("#"))%></td>
					<td><%=originalCodeLine.substring(originalCodeLine.indexOf("#") + 1)%></td>

					<td><%=table1.get(number)%></td>

					<td><%=table2.get(number)%></td>

					<td><%=table3.get(number)%></td>

					<td><%=table4.get(number)%></td>
					<td><%=table5.get(number)%></td>

					<td><%=table6.get(number)%></td>

					<td><%=table1.get(number) + table2.get(number) + table3.get(number) + table4.get(number) + table5.get(number)
		+ table6.get(number)%></td>




				</tr>
				<%
					}
				%>
				<tr>


					<td colspan="2"><center>
							<strong>Total</strong>
						</center></td>
					<td><%=table1.values().stream().reduce((value, tot) -> value + tot).get().intValue()%></td>
					<td><%=table2.values().stream().reduce((value, tot) -> value + tot).get().intValue()%></td>
					<td><%=table3.values().stream().reduce((value, tot) -> value + tot).get().intValue()%></td>
					<td><%=table4.values().stream().reduce((value, tot) -> value + tot).get().intValue()%></td>
					<td><%=table5.values().stream().reduce((value, tot) -> value + tot).get().intValue()%></td>
					<td><%=table6.values().stream().reduce((value, tot) -> value + tot).get().intValue()%></td>
					<td><%=table1.values().stream().reduce((value, tot) -> value + tot).get().intValue()
		+ table2.values().stream().reduce((value, tot) -> value + tot).get().intValue()
		+ table3.values().stream().reduce((value, tot) -> value + tot).get().intValue()
		+ table4.values().stream().reduce((value, tot) -> value + tot).get().intValue()
		+ table5.values().stream().reduce((value, tot) -> value + tot).get().intValue()
		+ table6.values().stream().reduce((value, tot) -> value + tot).get().intValue()%></td>



				</tr>

			</tbody>
		</table>
		<br> <br>
	</div>
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
</html>