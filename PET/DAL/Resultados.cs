using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
   public class Resultados
    {
        public int TotalRegistros;
        public int Pagina;
        public int paginas;
        public int RegistrosAMostrar;
        public int RegistrosPorPagina;
        public string Raza;
        public string OrdenarPor;
        public bool Accendente;
        public List<Mascotas> Registros;

    }
}
