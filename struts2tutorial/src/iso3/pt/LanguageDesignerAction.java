package iso3.pt;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LanguageDesignerAction extends ActionSupport implements Preparable {

	private Log logger = LogFactory.getLog(this.getClass());

	private List<LanguageDesigner> languageDesigners = null;
	private LanguageDesigner selectedLanguageDesigner = null;
	
	public void setSelectedLanguageDesigner(LanguageDesigner designer) {
		this.selectedLanguageDesigner = designer;
	}
	
	public LanguageDesigner getSelectedLanguageDesigner() {
		return selectedLanguageDesigner;
	}

	public String getAuthor() {
		return "Pepito de los Palotes";
	}
	
	public List<LanguageDesigner> getLanguageDesigners() {
        return this.languageDesigners;
    }
	
	public void prepare() throws Exception {
		//carga la lista
		this.languageDesigners = new java.util.ArrayList<LanguageDesigner>();
		this.languageDesigners.add(new LanguageDesigner("Guido van Rosum", "Dutch", "Python"));
		this.languageDesigners.add(new LanguageDesigner("Bjarne Stroustrup", "Danish", "C++"));
		this.languageDesigners.add(new LanguageDesigner("James Gosling", "Canadian", "Java"));
		this.languageDesigners.add(new LanguageDesigner("Craig McClanahan", "American", "Tomcat & Struts"));
		
		if (this.selectedLanguageDesigner != null && this.selectedLanguageDesigner.getFullName() != null) {
			for (LanguageDesigner designer: this.languageDesigners) {
				if (designer.getFullName().equals(this.selectedLanguageDesigner.getFullName())) {
					this.selectedLanguageDesigner = designer;
					break;
				}
			}
		}
	}
	
	public String doListing() {
		// Aqu� habr�a que acceder a los objetos DAO para obtener los datos que se mostrar�an en el JSP, 
		// tales datos se guardar�an en una variable para la que habr�a que haber un m�todo get correspondiente
		// En nuestro como ya asignamos valores v�lidos a languageDesigners en el prepare, no es necesario
		return SUCCESS;
	}
	
	public String doSelectDesigner() {
		// Aqu� habr�a que acceder a los objetos DAO para obtener los datos que se mostrar�an en el JSP, 
		// tales datos se guardar�an en una variable para la que habr�a que haber un m�todo get correspondiente
		// En nuestro como ya asignamos valores v�lidos a languageDesigners en el prepare, no es necesario
		
		// El trabajo ya ha sido hecho en prepare() que obtiene todos los datos asociados al dise�ador elegido
		// En este m�todo podr�amos por ejemplo incrementar el contador de popularidad del dise�ado
		return "designerMarked";
	}
	
}
