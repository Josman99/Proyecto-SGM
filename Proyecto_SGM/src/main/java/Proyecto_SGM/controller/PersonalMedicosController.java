package Proyecto_SGM.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import Proyecto_SGM.beans.Paciente;
import Proyecto_SGM.beans.PersonalMedico;
import Proyecto_SGM.models.PersonalMedicoModel;



/**
 * Servlet implementation class PersonalMedicosController
 */
@WebServlet("/PersonalMedicosController")
public class PersonalMedicosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PersonalMedicoModel model = new PersonalMedicoModel();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PersonalMedicosController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		proceso(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		proceso(request, response);
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
			case "nuevo":
				request.getRequestDispatcher("/PersonalMedico/nuevoPersonal.jsp").forward(request, response);
				break;
			case "insertar":
				insertar(request, response);
				break;
			case "obtener":
    			obtener(request, response);
    			break;
    		case "modificar":
    			modificar(request, response);
    			break;
    		case "eliminar":
    			eliminar(request, response);
    			break;
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en opciones:" + e.getMessage());
		}

	}

	public void listar(HttpServletRequest request, HttpServletResponse response) {

		try {

			request.setAttribute("listarPersonal", model.ListarPersonalMedico());
			Iterator<PersonalMedico> ite = model.ListarPersonalMedico().iterator();

			while (ite.hasNext()) {

				PersonalMedico perso = ite.next();

				System.out.println(perso.getId() + " " + perso.getDni() + " " + perso.getNombre() + " "
						+ perso.getApellido() + " " + perso.getFechaN() + " " + perso.getDireccion() + " " + " "
						+ perso.getTelefono() + " " + perso.getNumeroCole() + " " + perso.getIdpersonal() + " "
						+ perso.getIdespecialidad());

			}

			request.getRequestDispatcher("/PersonalMedico/listaPersonal.jsp").forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en listar 2:" + e.getMessage());
		}

	}
	
	private boolean validar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean res = false;
    	List<String> ListError = new ArrayList<>();
    	try {
			if(request.getParameter("dni").equals("")) {
				res = true;
				ListError.add("Ingrese el DNI del Personal medico");
			}
			if(request.getParameter("nombre").equals("")) {
				res = true;
				ListError.add("Ingrese los nombres del Personal medico");
			}
			if(request.getParameter("apellido").equals("")) {
				res = true;
				ListError.add("Ingrese apellidos del Personal medico");
			}
			if(Date.valueOf(request.getParameter("fecha")).equals("")) {
				res = true;
				ListError.add("Ingrese la fecha de Nacimiento del Personal medico");
			}
			if(request.getParameter("direccion").equals("")) {
				res = true;
				ListError.add("Ingrese el direccion del Personal medico");
			}
			if(request.getParameter("telefono").equals("")) {
				res = true;
				ListError.add("Ingrese el telefono del Personal medico");
			}
			if(request.getParameter("numero").equals("")) {
				res = true;
				ListError.add("Ingrese el numero de colegiatura del Personal medico");
			}
			
			request.setAttribute("respuesta", res);
			request.setAttribute("listaError", ListError);
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
    	return res;
	}

	public void insertar(HttpServletRequest request, HttpServletResponse response) {

		try {
			if(!validar(request, response)) {
				PersonalMedico personal = new PersonalMedico();
				personal.setDni(request.getParameter("dni"));
				personal.setNombre(request.getParameter("nombre"));
				personal.setApellido(request.getParameter("apellido"));
				personal.setFechaN(Date.valueOf(request.getParameter("fecha")));
				personal.setDireccion(request.getParameter("direccion"));
				personal.setTelefono(request.getParameter("telefono"));
				personal.setNumeroCole(request.getParameter("numero"));
				personal.setIdpersonal(Integer.parseInt(request.getParameter("tipo")));
				if(request.getParameter("especialidad")==null) {
					personal.setIdespecialidad(1);
				}else {
					personal.setIdespecialidad(Integer.parseInt(request.getParameter("especialidad")));
				}

				if (model.InsertarPersonalMedico(personal) > 0) {

					request.getSession().setAttribute("exito", "Personal medico guardado exitosamente");
					response.sendRedirect(request.getContextPath() + "/PersonalMedicosController?op=listar");

				} else {

					request.getSession().setAttribute("fracaso", "Personal Medico no guardado exitosamente");
					response.sendRedirect(request.getContextPath() + "/PersonalMedicosController?op=listar");

				}

			} else {
				request.getRequestDispatcher("/PersonalMedico/nuevoPersonal.jsp").forward(request, response);
			}	

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en insertar insertar 2:" + e.getMessage());
		}

	}
	public void obtener(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	try {
    		String id = request.getParameter("id");
			PersonalMedico personalM = model.obtenerPersonalMed(Integer.parseInt(id));
			if(personalM != null) {
				request.setAttribute("personalM", personalM);
				request.getRequestDispatcher("/PersonalMedico/modificarPersonal.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+"/error404.jsp");
				response.sendRedirect(request.getContextPath()+"/PersonalMedicosController?op=listar");
			}		
		} catch (Exception e) {
			System.out.println("error al obtener desde el controlador: "+e.getMessage());
		}
    }
    
    public void modificar(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	PersonalMedico mipersonal = new PersonalMedico();
    	try {
    		mipersonal.setId(Integer.parseInt(request.getParameter("id")));
    		mipersonal.setDni(request.getParameter("dni"));
    		mipersonal.setNombre(request.getParameter("nombre"));
    		mipersonal.setApellido(request.getParameter("apellido"));
    		mipersonal.setFechaN(Date.valueOf(request.getParameter("fecha")));
    		mipersonal.setDireccion(request.getParameter("direccion"));
    		mipersonal.setTelefono(request.getParameter("telefono"));
    		mipersonal.setNumeroCole(request.getParameter("numero"));
    		mipersonal.setIdpersonal(Integer.parseInt(request.getParameter("tipo")));
    		if(request.getParameter("especialidad")==null || Integer.parseInt(request.getParameter("tipo")) != 1 ) {
    			mipersonal.setIdespecialidad(1);
			}else {
				mipersonal.setIdespecialidad(Integer.parseInt(request.getParameter("especialidad")));
			}
			if(model.modificarPersonalMedico(mipersonal)>0) {
				request.getSession().setAttribute("exito", "Personal modificado exitosamente");
				response.sendRedirect(request.getContextPath()+"/PersonalMedicosController?op=listar");
			} else {
				request.getSession().setAttribute("Fracaso", "Paciente no registrado ya que hay otro Paciente con ese codigo ");
				response.sendRedirect(request.getContextPath()+"/PersonalMedicosController?op=listar");
			}	
			response.sendRedirect(request.getContextPath()+"/PersonalMedicosController?op=listar");
		} catch (Exception e) {
			System.out.println("error al modificar desde el controlador: "+e.getMessage());
		}
    }
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	try {
    		int id = Integer.parseInt(request.getParameter("id"));//aqui falta modificar
			
			if(model.eliminarPersonalMedico(id)>0) {
				request.setAttribute("Exito", "Paciente eliminado");
			}else {
				request.setAttribute("Fracaso", "No se puede eliminar este paciente");
			}
			request.getRequestDispatcher("/PersonalMedicosController?op=listar").forward(request, response);
		} catch (Exception e) {
			System.out.println("error al obtener desde el controlador: "+e.getMessage());
		}
    }

}
