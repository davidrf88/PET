using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace PET.Visitante
{
    public partial class Busqueda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargar();
        }

        public  void cargar()
        {
            List<Mascotas> LM = new List<Mascotas>();
            var r = new Razas() { Nombre = "Pastor Aleman" };
            LM.Add(new Mascotas() { Nombre = "Elvis", Razas = r, EsMacho = true, Mascota_Id = 1 });
            var r2 = new Razas() { Nombre = "Poodle" };
            LM.Add(new Mascotas() { Nombre = "Bolsin", Razas = r2, EsMacho = false, Mascota_Id = 2 });
            var r3 = new Razas() { Nombre = "Sangaruto" };
            LM.Add(new Mascotas() { Nombre = "Jesus Aguilar", Razas = r3, EsMacho = true, Mascota_Id = 3 });


            Repeater.DataSource = LM;
            Repeater.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "show", "showLista();", true);
        }
    }
}