package Proyecto_SGM.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import Proyecto_SGM.beans.Cita;
import Proyecto_SGM.beans.Horario;
import Proyecto_SGM.beans.Intervalo;
import Proyecto_SGM.beans.Paciente;
import Proyecto_SGM.models.CitaModel;
import Proyecto_SGM.models.HorarioModel;
import Proyecto_SGM.models.IntervaloModel;
import Proyecto_SGM.models.PacienteModel;

/**
 * Servlet implementation class PacienteController
 */
public class PacienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PacienteModel modelo = new PacienteModel();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PacienteController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response) 
    		throws ServerException, IOException{
    	try {
    		if(request.getParameter("op") == null) {
        		listar(request, response);
        		return;
        	}
    		String operacion = request.getParameter("op");
    		switch(operacion) {
    		case "listar":
    			listar(request, response);
    			break;
    		case "nuevo":
    			request.getRequestDispatcher("/paciente/nuevoPaciente.jsp").forward(request, response);
    			break;
    		case "ingresar":
    			ingresar(request, response);
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
    		case "cita":
    			obtenerDatoCita(request, response);
    			break;
    		case "listarHorario":
    			listarHorario(request, response);
    			break;
    		case "listarAtencion":
				listarAtencion(request, response);

				break;		
			case "insertarcita":
				insertarCita(request, response);
				break;
				
			case "buscarpaciente":
				buscar(request, response);
				break;
    		}
		} catch (Exception e) {
			// TODO: handle exception
		}
    }
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws SQLException {
    	try {
			request.setAttribute("listaPacientes", modelo.listaPaciente());
	    	Iterator<Paciente> it = modelo.listaPaciente().iterator();
	    	while (it.hasNext()) {
				Paciente p = it.next();
				System.out.println(p.getIdPaciente()+" "+p.getNombres()+" "+p.getApellidos());
			}
    	request.getRequestDispatcher("/paciente/listaPaciente.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}   	
    }  
    
    private boolean validar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean res = false;
    	List<String> ListError = new ArrayList<>();
    	try {
			if(request.getParameter("docIden").equals("")) {
				res = true;
				ListError.add("Ingrese el documento de indentidad del paciente");
			}
			if(request.getParameter("nombres").equals("")) {
				res = true;
				ListError.add("Ingrese los nombres del paciente");
			}
			if(request.getParameter("apellidos").equals("")) {
				res = true;
				ListError.add("Ingrese apellidos del paciente");
			}
			if(Date.valueOf(request.getParameter("fechNaci")).equals("")) {
				res = true;
				ListError.add("Ingrese la fecha de Nacimiento del paciente");
			}
			if(request.getParameter("direccion").equals("")) {
				res = true;
				ListError.add("Ingrese el direccion del paciente");
			}
			if(request.getParameter("telefono").equals("")) {
				res = true;
				ListError.add("Ingrese el telefono del cliente");
			}
			request.setAttribute("respuesta", res);
			request.setAttribute("listaError", ListError);
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}
    	return res;
    }
    public void ingresar(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	try {
    		if(!validar(request, response)) {
    			Paciente mipaciente = new Paciente();
        		mipaciente.setDocIdent(request.getParameter("docIden"));
        		mipaciente.setNombres(request.getParameter("nombres"));
        		mipaciente.setApellidos(request.getParameter("apellidos"));
        		mipaciente.setFechNaci(Date.valueOf(request.getParameter("fechNaci")));
        		mipaciente.setDireccion(request.getParameter("direccion"));
        		mipaciente.setTelefono(request.getParameter("telefono"));
        		mipaciente.setApoder(request.getParameter("apoderado"));
    			if(modelo.insertarPaciente(mipaciente)>0) {
    				request.getSession().setAttribute("exito", "Paciente registrado exitosamente");
    				response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
    			} else {
    				request.getSession().setAttribute("Fracaso", "Paciente no registrado ya que hay otro autor con ese codigo ");
    				response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
    			}
    		} else {
				request.getRequestDispatcher("/paciente/nuevoPaciente.jsp").forward(request, response);
			}		
			
		} catch (Exception e) {
			System.out.println("error al ingresar desde el contyrolador: "+e.getMessage());
		}
    }
    
    public void obtener(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	try {
    		String id = request.getParameter("id");
			Paciente paciente = modelo.obtenerPaciente(Integer.parseInt(id));
			if(paciente != null) {
				request.setAttribute("paciente", paciente);
				request.getRequestDispatcher("/paciente/modificarPaciente.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+"/error404.jsp");
			}		
			response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
		} catch (Exception e) {
			System.out.println("error al obtener desde el controlador: "+e.getMessage());
		}
    }
    
    public void modificar(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	Paciente mipaciente = new Paciente();
    	try {
    		mipaciente.setIdPaciente(Integer.parseInt(request.getParameter("id")));
    		mipaciente.setDocIdent(request.getParameter("docIden"));
    		mipaciente.setNombres(request.getParameter("nombres"));
    		mipaciente.setApellidos(request.getParameter("apellidos"));
    		mipaciente.setFechNaci(Date.valueOf(request.getParameter("fechNaci")));
    		mipaciente.setDireccion(request.getParameter("direccion"));
    		mipaciente.setTelefono(request.getParameter("telefono"));
    		mipaciente.setApoder(request.getParameter("apoderado"));
			if(modelo.modificarPaciente(mipaciente)>0) {
				request.getSession().setAttribute("exito", "Paciente modificado exitosamente");
				response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
			} else {
				request.getSession().setAttribute("Fracaso", "Paciente no registrado ya que hay otro Paciente con ese codigo ");
				response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
			}	
			response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
		} catch (Exception e) {
			System.out.println("error al modificar desde el controlador: "+e.getMessage());
		}
    }
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	try {
    		int id = Integer.parseInt(request.getParameter("id"));//aqui falta modificar
			
			if(modelo.eliminarPaciente(id)>0) {
				request.setAttribute("Exito", "Paciente eliminado");
			}else {
				request.setAttribute("Fracaso", "No se puede eliminar este paciente");
			}
			request.getRequestDispatcher("/PacienteController?op=listar").forward(request, response);
		} catch (Exception e) {
			System.out.println("error al obtener desde el controlador: "+e.getMessage());
		}
    }
    public void obtenerDatoCita(HttpServletRequest request, HttpServletResponse response) throws SQLException{
    	try {
    		String id = request.getParameter("id");
			Paciente paciente = modelo.obtenerPacientes(Integer.parseInt(id));
			if(paciente != null) {
				request.setAttribute("paciente", paciente);
				request.getRequestDispatcher("/paciente/generarCita.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+"/error404.jsp");
				response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
			}		
			
		} catch (Exception e) {
			System.out.println("error al obtener desde el controlador 2: "+e.getMessage());
		}
    }
    
    
    public void listarHorario(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        
    	try {
    		
    		String ids = request.getParameter("id");
			Paciente paciente = modelo.obtenerPacientes(Integer.parseInt(ids));
			int id = Integer.parseInt(request.getParameter("especialidadId"));
			HorarioModel mo=new HorarioModel();
			
			if(paciente != null) {
				request.setAttribute("paciente", paciente);
				request.setAttribute("horarios", mo.listarEspecialidadHorario(id));
				request.getRequestDispatcher("/paciente/generarCita.jsp").forward(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+"/error404.jsp");
				response.sendRedirect(request.getContextPath()+"/PacienteController?op=listar");
			}		
    		

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error en buscar horario 2:" + e.getMessage());
		}
    		
    }
    
    public void listarAtencion(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		try {
			// Obtener el ID del horario desde la URL
			int idintervalo = Integer.parseInt(request.getParameter("ide"));

			String ids = request.getParameter("id");
			Paciente paciente = modelo.obtenerPacientes(Integer.parseInt(ids));
			
			int idhorario = Integer.parseInt(request.getParameter("especialidadId"));
			HorarioModel mo = new HorarioModel();
			
			List<Horario>hora=mo.listarEspecialidadHorario(idhorario);


			// Obtener los intervalos para el horario seleccionado
			IntervaloModel model = new IntervaloModel();
			List<Intervalo> lista = model.listarintervalos(idintervalo);
			
			
			if (paciente != null) {
				request.setAttribute("paciente", paciente);
				request.setAttribute("intervalos", lista);
				request.setAttribute("horarios", hora);
				request.getRequestDispatcher("/paciente/generarCita.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/error404.jsp");
				response.sendRedirect(request.getContextPath() + "/PacienteController?op=listar");
			}

		} catch (Exception e) {
			System.out.println("Error al listar atención: " + e.getMessage());
		}
	}
	
	public void insertarCita(HttpServletRequest request, HttpServletResponse response) {
	    try {
	     
	        System.out.println("ID Paciente: " + request.getParameter("id"));
	        System.out.println("Intervalo: " + request.getParameter("intervalo"));
	        System.out.println("Fecha: " + request.getParameter("fecha"));

	       
	        Cita cita = new Cita();
	        cita.setId_paciente(Integer.parseInt(request.getParameter("id")));
	        cita.setId_horario(Integer.parseInt(request.getParameter("intervalo")));
	        cita.setFechacita(Date.valueOf(request.getParameter("fecha")));  

	        CitaModel mod = new CitaModel();
	        
	       
	        boolean citaExistente = mod.verificarCitaExistente(cita.getId_horario());
	        if (citaExistente) {
	            request.getSession().setAttribute("fracaso", "El horario seleccionado ya está ocupado. Por favor, elija otro.");
	            response.sendRedirect(request.getContextPath() + "/PacienteController?op=listar");
	            return; 
	        }

	        
	        if (mod.insertarCita(cita) > 0) {
	            request.getSession().setAttribute("exito", "Cita registrada exitosamente");
	        } else {
	            request.getSession().setAttribute("fracaso", "Error al registrar la cita.");
	        }
	        
	        response.sendRedirect(request.getContextPath() + "/CitaController?op=listar");
	    } catch (Exception e) {
	        System.out.println("Error en insertarCita: " + e.getMessage());
	        request.getSession().setAttribute("fracaso", "Error al procesar la solicitud.");
	        try {
	            response.sendRedirect(request.getContextPath() + "/CitaController?op=listar");
	        } catch (IOException ioException) {
	            ioException.printStackTrace();
	        }
	    }
	}
	public void buscar(HttpServletRequest request, HttpServletResponse response) {
			
			String dni=request.getParameter("dni");
	
			try {
				
	
				request.setAttribute("listaPacientes", modelo.BuscarPaciente(dni));
	
				request.getRequestDispatcher("/paciente/listaPaciente.jsp").forward(request, response);
	
			} catch (Exception e) {
				System.out.println("error en listar 2:" + e.getMessage());
			}
	
		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
