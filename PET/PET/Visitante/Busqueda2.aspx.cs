using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;
namespace PET.Visitante
{
    public partial class Busqueda2 : System.Web.UI.Page
    {
        BMascota bmascota = new BMascota();
        BResultados bres = new BResultados();
        int pagina = 1;
        int regxpag = 2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargar();
            }
        }

        public void cargar()
        {

            var r = bres.TraerResultados("Pastor Aleman", "Monterrey", pagina, regxpag, null, false, null);
            Repeater.DataSource = r.Registros;
            DropDownList1.Items.Clear();
            Label1.Text = "Total de Registros" + r.TotalRegistros;
            List<ListItem> paginas = new List<ListItem>();
            for (int x = 0; x < r.paginas; x++ )
            {
                paginas.Add(new ListItem((x + 1).ToString(), (x + 1).ToString()));

            }
            DropDownList1.Items.AddRange(paginas.ToArray());
            DropDownList1.DataBind();
          
            
            Repeater.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show", "showLista();", true);
        }

        public string ObtenerEdad(string edad)
        {

            return bmascota.ObtenerEdad(edad);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            pagina = Int32.Parse(DropDownList1.SelectedValue.ToString());
            regxpag = Int32.Parse(DropDownList2.SelectedValue.ToString());
            cargar();
        }
    }
}