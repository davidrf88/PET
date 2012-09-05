using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Data;
using DAL;
using LIB;


namespace BLL
{
   public class BUsuario
    {
        PETEntities pe = new PETEntities();

        public bool EnviarConfirmacion(string usuario,int municipio,string lat,string lng)
        {
            try
            {//Obtener el usuario de membership 
                MembershipUser mu = Membership.GetUser(usuario);
                //Obtener el GUID 
                Guid userId = (Guid)mu.ProviderUserKey;
                //Obtener el usuario replicado
                Usuarios u = pe.Usuarios.SingleOrDefault(x => x.Usuario_UID == userId);
                u.MunicipioId = municipio;
                u.Latitud = lat;
                u.Longitud = lng;
                pe.SaveChanges();
                Email email = new Email();
                //Enviar el mail de activación
                bool enviado = email.SendEmail(mu.Email, mu.UserName, u.UUID);
                return enviado;
            }
            catch (Exception e)
            {
                //LOG
                return false;

            
            }
           
        }

        public bool ValidarEntrada(string usuario)
        {
            MembershipUser mu = Membership.GetUser(usuario);
            //Obtener el GUID 
            Guid userId = (Guid)mu.ProviderUserKey;
            Usuarios u = pe.Usuarios.SingleOrDefault(x => x.Usuario_UID == userId);
            if (u.Status == "Registrado")
            {
                FormsAuthentication.SignOut(); throw new Exception("Debes activar tu cuenta desde tu correo electronico");
            }
            if(u.Status == "Bloqueado")
            {
                FormsAuthentication.SignOut(); throw new Exception("El Usuario ha sido desactivado");
            }
            return true;

        }

        public bool ActualizarUsuario(string usuario, int? municipio, string lat, string lng, string status)
        {
            MembershipUser mu = Membership.GetUser(usuario);
            //Obtener el GUID 
            Guid userId = (Guid)mu.ProviderUserKey;
            Usuarios u = pe.Usuarios.SingleOrDefault(x => x.Usuario_UID == userId);
            bool save = false;
            if (!String.IsNullOrEmpty(municipio.ToString()))
            {
                save = true;
                u.MunicipioId = municipio;
            }
            if (!String.IsNullOrEmpty(lat))
            {
                save = true;
                u.Latitud = lat;
            }
            if (!String.IsNullOrEmpty(lng))
            {
                save = true;
                u.Longitud = lng;
            }
            if (!String.IsNullOrEmpty(status))
            {
                save = true;
                u.Status = status;
            }

            if (save)
                pe.SaveChanges();

            return true;
        
        
        }



    }
}
