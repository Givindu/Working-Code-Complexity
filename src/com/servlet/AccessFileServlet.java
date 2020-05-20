package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.service.MethodComplexity;
//import com.service.SizeComplexity;
//import com.service.VariableComplexity;

import utils.Common;
import utils.IndividualFunction;
import utils.StatementLine;

/**
 * Servlet implementation class AccessFileServlet
 */
@WebServlet("/AccessFileServlet")
public class AccessFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccessFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		//PrintWriter out = response.getWriter();
		//String code = request.getParameter("demo");
		//int type = Integer.parseInt(request.getParameter("type"));

		//out.println(code);

		//files.setCode(code);

		HttpSession httpSession = request.getSession();

//		String[] codeArray = code.split("\\r?\\n");
//		httpSession.setAttribute("lines", codeArray);
//		int arrayLen = codeArray.length;
//		int start;
//		for (start = 0; start < arrayLen; start++) {
//			out.println("Line " + (start + 1) + " :" + codeArray[start]);
//		}

//		ArrayList<IndividualFunction> allFunctions = Common.divideToFunctions(codeArray);
//		for (start = 0; start < allFunctions.size(); start++) {
//		  IndividualFunction function = allFunctions.get(start);
////			out.println(function.getStart());
////			out.println(function.getEnd());
////			out.println(function.getMethodName());
//		}

//		if (type == 1) {
//			ArrayList<StatementLine> StatementListWop = SizeComplexity.sizeByOperators(allFunctions, codeArray);
//
//			out.println(
//					"Wop Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWop.size(); start++) {
//				StatementListWop.get(start);
//				out.println("Line Number " + StatementListWop.get(start).getLineNumber() + ": Wop :  "
//						+ StatementListWop.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWkw = SizeComplexity.sizeByKeyWords(allFunctions, codeArray);
//
//			out.println(
//					"Wkw Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWkw.size(); start++) {
//				StatementListWkw.get(start);
//				out.println("Line Number " + StatementListWkw.get(start).getLineNumber() + ": Wkw :  "
//						+ StatementListWkw.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWnv = SizeComplexity.sizeByNumbers(allFunctions, codeArray);
//
//			out.println(
//					"Wnv Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWnv.size(); start++) {
//				StatementListWnv.get(start);
//				out.println("Line Number " + StatementListWnv.get(start).getLineNumber() + ": Wnv :  "
//						+ StatementListWnv.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWid = SizeComplexity.sizeByKeyIdentifires(allFunctions, codeArray);
//
//			out.println(
//					"Wid Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWid.size(); start++) {
//				StatementListWid.get(start);
//				out.println("Line Number " + StatementListWid.get(start).getLineNumber() + ": Wid :  "
//						+ StatementListWid.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWsl = SizeComplexity.sizeByStrings(allFunctions, codeArray);
//
//			out.println(
//					"Wsl Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWsl.size(); start++) {
//				StatementListWsl.get(start);
//				out.println("Line Number " + StatementListWsl.get(start).getLineNumber() + ": Wsl :  "
//						+ StatementListWsl.get(start).getComplexity());
//			}
//
//			httpSession.setAttribute("Wop", StatementListWop);
//			httpSession.setAttribute("Wkw", StatementListWkw);
//			httpSession.setAttribute("Wnv", StatementListWnv);
//			httpSession.setAttribute("Wid", StatementListWid);
//			httpSession.setAttribute("Wsl", StatementListWsl);
//			request.getRequestDispatcher("size.jsp").forward(request, response);
//
//		}
//
//		if (type == 2) {
//			ArrayList<StatementLine> StatementListWvs = VariableComplexity.variableByScope(allFunctions, codeArray);
//
//			out.println(
//					"Wvs Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWvs.size(); start++) {
//				StatementListWvs.get(start);
//				out.println("Line Number " + StatementListWvs.get(start).getLineNumber() + ": Wvs :  "
//						+ StatementListWvs.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWpdtv = VariableComplexity.variableByPremDataType(allFunctions,
//					codeArray);
//
//			out.println(
//					"Wpdtv Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWpdtv.size(); start++) {
//				StatementListWpdtv.get(start);
//				out.println("Line Number " + StatementListWpdtv.get(start).getLineNumber() + ": Wpdtv :  "
//						+ StatementListWpdtv.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWcdtv = VariableComplexity.variableByCompDataType(allFunctions,
//					codeArray);
//
//			out.println(
//					"Wcdtv Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWcdtv.size(); start++) {
//				StatementListWcdtv.get(start);
//				out.println("Line Number " + StatementListWcdtv.get(start).getLineNumber() + ": Wcdtv :  "
//						+ StatementListWcdtv.get(start).getComplexity());
//			}
//
//			httpSession.setAttribute("Wvs", StatementListWvs);
//			httpSession.setAttribute("Wpdtv", StatementListWpdtv);
//			httpSession.setAttribute("Wcdtv", StatementListWcdtv);
//			request.getRequestDispatcher("variable.jsp").forward(request, response);
//		}
//
//		if (type == 3) {
//			ArrayList<StatementLine> StatementListWmrt = MethodComplexity.methodByReturnType(allFunctions, codeArray);
//
//			out.println(
//					"Wmrt Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWmrt.size(); start++) {
//				StatementListWmrt.get(start);
//				out.println("Line Number " + StatementListWmrt.get(start).getLineNumber() + ": Wmrt :  "
//						+ StatementListWmrt.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWpdtp = MethodComplexity.methodByPrimDataTypePara(allFunctions,
//					codeArray);
//
//			out.println(
//					"Wpdtp Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWpdtp.size(); start++) {
//				StatementListWpdtp.get(start);
//				out.println("Line Number " + StatementListWpdtp.get(start).getLineNumber() + ": Wpdtp :  "
//						+ StatementListWpdtp.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListWcdtp = MethodComplexity.methodByCompDataTypePara(allFunctions,
//					codeArray);
//
//			out.println(
//					"Wcdtp Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListWcdtp.size(); start++) {
//				StatementListWcdtp.get(start);
//				out.println("Line Number " + StatementListWcdtp.get(start).getLineNumber() + ": Wcdtp :  "
//						+ StatementListWcdtp.get(start).getComplexity());
//			}
//
//			httpSession.setAttribute("Wmrt", StatementListWmrt);
//			httpSession.setAttribute("Wpdtp", StatementListWpdtp);
//			httpSession.setAttribute("Wcdtp", StatementListWcdtp);
//			request.getRequestDispatcher("method.jsp").forward(request, response);
//		}

//		if (type == 5) {
//			
//
//			//out.println("Ctc Value for lines -------------------------------------------------------------------------------");
//
//			response.sendRedirect(request.getContextPath() +"/action_file_upload_inheritnce.jsp");
//		}
		response.sendRedirect(request.getContextPath() +"/action_file_upload_inheritnce.jsp");
		//response.sendRedirect(request.getContextPath() +"/www.google.com");
//		if (type == 5) {// Inheritance
//			ArrayList<StatementLine> StatementListCtc = ControlStructureService.calculateComplexityByType(allFunctions,
//					codeArray);
//
//			out.println(
//					"Ctc Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListCtc.size(); start++) {
//				StatementListCtc.get(start);
//				out.println("Line Number " + StatementListCtc.get(start).getLineNumber() + ": Ctc :  "
//						+ StatementListCtc.get(start).getComplexity());
//			}
//
//			ArrayList<StatementLine> StatementListCnc = ControlStructureService
//					.calculateComplexityByNestingControlStructure(allFunctions, codeArray);
//
//			out.println(
//					"Cnc Value for lines -------------------------------------------------------------------------------");
//
//			for (start = 0; start < StatementListCnc.size(); start++) {
//				StatementListCnc.get(start);
//				out.println("Line Number " + StatementListCnc.get(start).getLineNumber() + ": Cnc :  "
//						+ StatementListCnc.get(start).getComplexity());
//			}
//
//			httpSession.setAttribute("Ctc", StatementListCtc);
//			httpSession.setAttribute("Cnc", StatementListCnc);
//			request.getRequestDispatcher("controlStructure.jsp").forward(request, response);
//		}
//
//		if (type == 6) {
//			// Coupling
//		}
//	}
	}

//	private ArrayList<StatementLine> sizeByOperators(ArrayList<IndividualFunction> allFunctions, String[] codeArray) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
}
