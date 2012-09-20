using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LIB
{
   public class CaracteresPermitidos
    {
        public static char[] caracteresValidos = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '-', '_', '@', '!', '#', '$', '%', '&', '*', '(', ')' };


        public static char[] caracteresValidosEspacio = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '-', '_', '@', '!', '#', '$', '%', '&', '*', '(', ')', ' ' };

        public static bool validar(string texto,bool espacio)
        {
            texto = texto.ToLower();
            char[] car = (espacio) ? caracteresValidosEspacio : caracteresValidos;
            foreach (char c in texto.Trim().ToLower())
            {
                if (car.Contains(c)) continue;
                else return false;
            }
            return true;
        
        }



    }
}
