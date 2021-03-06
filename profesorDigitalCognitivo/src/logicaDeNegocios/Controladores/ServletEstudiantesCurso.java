package logicaDeNegocios.Controladores;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logicaDeNegocios.dao.DaoEstudiante;
import logicaDeNegocios.dto.DtoEstudiante;

/**
 * Servlet implementation class ServletEstudiantesCurso
 */
@WebServlet("/ServletEstudiantesCurso")
public class ServletEstudiantesCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEstudiantesCurso() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DaoEstudiante transferencia=new DaoEstudiante();
		if(request.getParameter("ListaEstudiantes")!=null){
			response.sendRedirect("EstudiantesCursos.jsp");
			
		}else if(request.getParameter("agregarEstudianteCurso")!=null){
			transferencia.agregarEstudianteCurso(request.getParameter("comboboxEstudiante"), request.getParameter("CursoActual"));
			response.sendRedirect("AgregarEstudiantesCurso.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
