using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace LIB
{
    public class Email
    {

        public bool SendEmail(string _to, string username, string guid)
        {

            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("socialpetsclub@gmail.com", "petpassword"),
                EnableSsl = true
           };
            MailMessage msg = new MailMessage("socialpetsclub@gmail.com", _to, "Confirmación", " Hola <b>"+username+"</b> <br/>Para activar tu cuenta haz click aqui <a href='"+ConfigurationManager.AppSettings.GetValues("sitio").First()+"/activarcuenta.aspx?guid= " + guid + "'>ACTIVAR MI CUENTA</a>") { IsBodyHtml= true };
            try
            {
                client.Send(msg);
                return true;
            }
            catch (Exception er)
            {
                //logeo
                return false;


            }
        
        
        
        
        }

    }
}