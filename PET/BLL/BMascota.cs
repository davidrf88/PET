using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Data;
using DAL;
using LIB;
using System.Configuration;


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

        public void RegistrarMascota(string _nombre, bool _esMacho, decimal _edad, string _descripcion, int _razaId, int _usuarioId)
        {
            _nombre = _nombre.Trim();
            _descripcion = _descripcion.Trim();

            if (String.IsNullOrEmpty(_nombre))
            { throw new Exception("MENSAJEERROREl nombre es requerido"); }
            if (String.IsNullOrEmpty(_descripcion))
            { throw new Exception("MENSAJEERRORLa descripción es requerida "); }

            if (!CaracteresPermitidos.validar(_nombre, true))
                throw new Exception("MENSAJEERRORTu usuario contiene caracteres no permitidos!");

            if (!CaracteresPermitidos.validar(_descripcion, true))
                throw new Exception("MENSAJEERRORTu usuario contiene caracteres no permitidos!");


            if(_nombre.Length < 2 || _nombre.Length > 100)
            { throw new Exception("MENSAJEERROREl nombre debe contener de 2 a 100 caracteres"); }

            if (_descripcion.Length < 10 || _descripcion.Length > 300)
            { throw new Exception("MENSAJEERRORLa descripcion debe contener entre 10 y 300 caracteres"); }

           int razaencontrada = pe.Razas.Count(x => x.Raza_Id == _razaId);
           if (razaencontrada < 1)
           { throw new Exception(); }

           if (_edad < 0 || _edad > 100)
           { throw new Exception("MENSAJEERRORLa edad debe estar entre 0 y 100 anos"); }



          int numMascotas =  pe.Mascotas.Count(x => x.UsuarioId == _usuarioId);
          int maxmascotas = Int32.Parse(ConfigurationManager.AppSettings["maxmascotas"]);
          if (numMascotas >= (maxmascotas - 1))
          { throw new Exception("MENSAJEERRORYa tienes el limite de mascotas registradas permitidas"); }
         int repetida = pe.Mascotas.Count(x => x.UsuarioId == _usuarioId && x.Nombre == _nombre);
         if (repetida > 0)
         { throw new Exception("MENSAJEERRORYa tienes una mascota del mismo nombre"); }
           
        
        
        
        }


    }
}
