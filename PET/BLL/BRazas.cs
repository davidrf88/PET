using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class BRazas
    {

        PETEntities pe = new PETEntities();
        public List<Razas> TraerRazas()
        {
            return pe.Razas.ToList();
        }
    }
}
