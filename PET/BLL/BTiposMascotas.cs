using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
   public class BTiposMascotas
    {

       PETEntities pe = new PETEntities();

       public List<TiposMascotas> TraerTiposMascotas()
       {
           return pe.TiposMascotas.ToList(); 
       }

    }
}
