package utils;

import java.util.ArrayList;

public class Common {
	public static ArrayList<IndividualFunction> divideToFunctions(String[] codeArray) {

		int x = codeArray.length;
		int y;
		int z;
		int a;
		int b;
		String methodName = null;

		ArrayList<IndividualFunction> FunctionList = new ArrayList<IndividualFunction>();

		String[] methodLineSplitBySpaces;

		System.out.println(x);
		for (y = 0; y < x; y++) {

			System.out.println("Line " + y + "  : " + codeArray[y]);

		}

//		 System.out.println("The type of complexity is : " + type);
//		 System.out.println("The type of Language is : " + language);

		// Divide each function for java
		ArrayList<Integer> methodNameLineNumberList = new ArrayList<Integer>(); // stores the line number of method starting

		ArrayList<String> bracketCheckArray = new ArrayList<String>(); // used to store opening and closing brackets to divide
																	// the functions
		String[] lineToChars; // to check each brackets

		System.out.println("The lines of method name are given below \n");
		for (y = 0; y < x; y++) {

			if ((codeArray[y].contains("public") || codeArray[y].contains("private") || codeArray[y].contains("protected"))
					&& (codeArray[y].contains("void") || codeArray[y].contains("int") || codeArray[y].contains("long")
							|| codeArray[y].contains("float") || codeArray[y].contains("double")
							|| codeArray[y].contains("boolean") || codeArray[y].contains("String")
							|| codeArray[y].contains("ArrayList"))) {
				// Modifier Checked

				// Return Type Checked
				if (codeArray[y].contains("(") && codeArray[y].contains(")") && codeArray[y].contains("{")) {
					System.out.println(codeArray[y]);
					methodNameLineNumberList.add(y);
				}

			}

		}
		System.out.println(methodNameLineNumberList.size());
		for (y = 0; y < methodNameLineNumberList.size(); y++) {
			System.out.println("Line number : " + methodNameLineNumberList.get(y));

			for (z = methodNameLineNumberList.get(y); z < codeArray.length; z++) {
				lineToChars = codeArray[z].split("(?!^)");

				for (a = 0; a < lineToChars.length; a++) {
					if (lineToChars[a].contains("{")) {
						bracketCheckArray.add("{");
						System.out.println("{");
						System.out.println(bracketCheckArray.toString());
					}
					if (lineToChars[a].contains("}")) {
						bracketCheckArray.remove(bracketCheckArray.size() - 1);
						System.out.println("}");
						System.out.println(bracketCheckArray.toString());
					}

				}

				if (bracketCheckArray.toString() == "[]") {
					break;
				}
			}
			System.out.println("From :" + methodNameLineNumberList.get(y) + " To : " + z);
			methodLineSplitBySpaces = codeArray[methodNameLineNumberList.get(y)].split("\\s");
			for (b = 0; b < methodLineSplitBySpaces.length; b++) {

				if (methodLineSplitBySpaces[b].contains("(")) {
					System.out.println(methodLineSplitBySpaces[b]);
					System.out.println(methodLineSplitBySpaces[b].split("\\(")[0]);
					methodName = methodLineSplitBySpaces[b].split("\\(")[0];
				}
			}
			IndividualFunction f1 = new IndividualFunction(methodNameLineNumberList.get(y), z, methodName);
			FunctionList.add(f1);
		}

		for (y = 0; y < FunctionList.size(); y++) {
			IndividualFunction f2 = FunctionList.get(y);
			System.out.println(f2.getStart());
			System.out.println(f2.getEnd());
			System.out.println(f2.getMethodName());
		}

		return FunctionList;

	}
}
