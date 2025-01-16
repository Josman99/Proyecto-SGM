package Proyecto_SGM.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Proyecto_SGM.models.CitaModel;

/**
 * Servlet implementation class CitaController
 */
@WebServlet("/CitaController")
public class CitaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CitaModel model = new CitaModel();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CitaController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void proceso(HttpServletRequest request, HttpServletResponse response) {

		try {

			if (request.getParameter("op") == null) {
				listar(request, response);
				return;
			}
			String operacion = request.getParameter("op");

			switch (operacion) {

			case "listar":

				listar(request, response);

				break;
				
			case "buscarcita":
				buscar(request, response);
				break;

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void listar(HttpServletRequest request, HttpServletResponse response) {

		try {

			request.setAttribute("listacita", model.listarCita());

			request.getRequestDispatcher("/cita/listacita.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println("error en listar 2:" + e.getMessage());
		}

	}
	
	
	public void buscar(HttpServletRequest request, HttpServletResponse response) {
		
		String dni=request.getParameter("dni");

		try {
			

			request.setAttribute("listacita", model.BuscarCita(dni));

			request.getRequestDispatcher("/cita/listacita.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println("error en listar 2:" + e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		proceso(request, response);

	}
	// TODO Auto-generated method stub

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		proceso(request, response);

	}

}