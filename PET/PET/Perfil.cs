using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;
using PET.PerfilDatos;

namespace PET 
{
   

    public class Perfil : ProfileBase
    {
        public Datos Informacion
        {
            get { return (Datos)GetPropertyValue("Informacion"); }
        }

        

       

        /// <summary>
        /// Get the profile of the currently logged-on user.
        /// </summary>      
        public static Perfil GetProfile()
        {
            return (Perfil)HttpContext.Current.Profile;
        }

        /// <summary>
        /// Gets the profile of a specific user.
        /// </summary>
        /// <param name="userName">The user name of the user whose profile you want to retrieve.</param>
        public static Perfil GetProfile(string userName)
        {
            return (Perfil)Create(userName);
        }
    }
}