using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Linq.Expressions;
using System.Reflection;

namespace BLL
{
   public class BResultados
    {
        PETEntities pe = new PETEntities();

        public Resultados TraerResultados(string raza, string municipio, int Pagina, int registrosPorPagina, string ordenarPor, bool accendente, bool? esMacho)
        {
            Resultados resultados = new Resultados();
            resultados.Registros = new List<Mascotas>();
            resultados.TotalRegistros = 0;
            resultados.Pagina = 1;
            
            var MUNICIPIO = pe.Municipios.SingleOrDefault(x => x.Nombre.ToLower() == municipio.ToLower());
            var RAZA = pe.Razas.SingleOrDefault(x => x.Nombre.ToLower() == raza.ToLower());
            if (RAZA == null || MUNICIPIO == null)
            { return resultados; }
            List<Mascotas> mascotas = new List<Mascotas>();
            if (esMacho != null)
            {
                mascotas = pe.Mascotas.Where(x => x.RazaId == RAZA.Raza_Id && x.Usuarios.MunicipioId == MUNICIPIO.Municipio_Id && x.EsMacho == esMacho).ToList(); 
           
            }
            else
            {
                mascotas = pe.Mascotas.Where(x => x.RazaId == RAZA.Raza_Id && x.Usuarios.MunicipioId == MUNICIPIO.Municipio_Id).ToList() ;
            }
            resultados.TotalRegistros = mascotas.Count();
            
            if (ordenarPor != null)
            {
                switch (ordenarPor)
                {
                    case "EsMacho": if (accendente) { resultados.Registros = resultados.Registros.OrderBy(x => x.EsMacho).ToList(); } else { resultados.Registros = resultados.Registros.OrderByDescending(x => x.EsMacho).ToList(); } break;
                    case "Edad": if (accendente) { resultados.Registros = resultados.Registros.OrderBy(x => x.Edad).ToList(); } else { resultados.Registros = resultados.Registros.OrderByDescending(x => x.Edad).ToList(); } break;
                  
                }
            
            }
            double div = ((double)(resultados.TotalRegistros) / (double)(registrosPorPagina));
            resultados.paginas = (Int32)Math.Ceiling(div);
            if (Pagina > resultados.paginas)
            {
                Pagina = 1;
            }

            int saltar = (Pagina -1) * registrosPorPagina;
            int tomar = (Pagina < resultados.paginas) ? registrosPorPagina : resultados.TotalRegistros - (registrosPorPagina * (Pagina - 1));
            mascotas = mascotas.Skip(saltar).Take(tomar).ToList();
            resultados.Registros = mascotas;
            return resultados;

         

        }
    }
}
