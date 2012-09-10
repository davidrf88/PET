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
   public class BMascota
    {
        PETEntities pe = new PETEntities();


        public string ObtenerEdad(string edadstr)
        {
          decimal edad =  decimal.Parse(edadstr);
            return  ((edad) > 1) ? edad + " años" :
                                                  (edad == 1) ?edad + " año" :(
                                                              Decimal.ToInt32((edad * 10m))   + " meses");
        
        }


    }
}
