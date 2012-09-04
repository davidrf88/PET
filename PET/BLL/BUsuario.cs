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

        public bool EnviarConfirmacion(string usuario)
        {
            try
            {//Obtener el usuario de membership 
                MembershipUser mu = Membership.GetUser(usuario);
                //Obtener el GUID 
                Guid userId = (Guid)mu.ProviderUserKey;
                //Obtener el usuario replicado
                Usuarios u = pe.Usuarios.SingleOrDefault(x => x.Usuario_UID == userId);
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
              throw new Exception("Debes activar tu cuenta desde tu correo electronico");
            if(u.Status == "Bloqueado")
                throw new Exception("ElUsuario ha sido desactivado");
            return true;

        }



    }
}
