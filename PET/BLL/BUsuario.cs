using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Data;
using DAL;
using LIB;
using System.Text.RegularExpressions;


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
           //     bool enviado = email.SendEmail(mu.Email, mu.UserName, u.UUID);
           //     return enviado;
                return true;
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

        public bool CrearUsuario(string usuario,string correo,string password,bool soloValidar)
        {
           
            if (usuario == " Usuario ") { usuario = ""; }
            if (password == " Password ") { password = ""; }
            if (correo == " Correo ") { correo = ""; }


            //Validar Campos requeridos
            usuario = usuario.Trim();
            password = password.Trim();
            correo = correo.Trim();

            if (String.IsNullOrEmpty(usuario))
            { throw new Exception("MENSAJEERROREl nombre de usuario es requerido!"); }

            if (String.IsNullOrEmpty(password))
            { throw new Exception("MENSAJEERROREl password es requerido!"); }

            if (String.IsNullOrEmpty(correo))
            { throw new Exception("MENSAJEERROREl correo es requerido!"); }


            //Validar nombre de username
                var us = pe.Usuarios.Where(x => x.aspnet_Users.LoweredUserName == usuario.ToLower());
                if (us.Count() > 0)
                { throw new Exception("MENSAJEERROREl nombre de usuario ya existe!"); }
            //Validar Longitud username
                if (usuario.Trim().Length < 6)
                { throw new Exception("MENSAJEERRORIntenta un nombre de usuario mas grande!"); }
            //Validar Caracteres  username
                if(! CaracteresPermitidos.validar(usuario, false))
                 throw new Exception("MENSAJEERRORTu usuario contiene caracteres no permitidos!");
               


                //Validar Longitud password
                if (password.Trim().Length < 6)
                { throw new Exception("MENSAJEERRORIntenta un password mas grande!"); }
                //Validar Caracteres password
                if (!CaracteresPermitidos.validar(password, false))
                    throw new Exception("MENSAJEERRORTu password contiene caracteres no permitidos!");
               

                string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
            @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
            @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
                Regex re = new Regex(strRegex);
                if (!re.IsMatch(correo))
                {
                    throw new Exception("MENSAJEERRORIngresa un correo valido!");
                }
                //Validar correo repetido
                var usc = pe.Usuarios.Where(x => x.aspnet_Users.aspnet_Membership.Email.ToLower() == correo.ToLower());
                if (usc.Count() > 0)
                { throw new Exception("MENSAJEERRORCorreo registado anteriormente!"); }


                if (!soloValidar)
                {
                    MembershipUser newUser = Membership.CreateUser(usuario, password, correo);

                    return EnviarConfirmacion(usuario, 1, "", "");
                }
               
           
 return true;
        
        }



    }
}
