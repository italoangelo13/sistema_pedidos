using Helper.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;

namespace fariapersonalizados.services
{
    /// <summary>
    /// Summary description for Auth
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Auth : System.Web.Services.WebService
    {

        [WebMethod]
        public string AutenticarUsuario(string usuario, string senha)
        {
            AuthModels auth = new AuthModels();
            if (usuario.ToUpper().Equals("ADMIN") && senha.Equals("faria*perso"))
            {
                auth.Autenticado = true;
                auth.Id = 0;
                auth.Perfil = 1;
                auth.Usuario = "ADMIN";
            }
            else
            {

                BancoDados b = new BancoDados();
                b.Query(@"SELECT *
                            FROM   USUARIO where USU_USUARIO = ?USU_USUARIO and USU_SENHA = ?USU_SENHA");
                b.SetParametro("?USU_USUARIO", usuario);
                b.SetParametro("?USU_SENHA", FormsAuthentication.HashPasswordForStoringInConfigFile(senha, "md5"));
                DataTable dt = b.ExecutarDataTable();
                if (dt.Rows.Count > 0)
                {
                    auth.Autenticado = true;
                    auth.Id = int.Parse(dt.Rows[0]["USU_CODIGOID"].ToString().ToUpper());
                    auth.Perfil = int.Parse(dt.Rows[0]["USU_PERFIL"].ToString().ToUpper());
                    auth.Usuario = dt.Rows[0]["USU_USUARIO"].ToString().ToUpper();
                }
                else
                {
                    auth.Autenticado = false;
                }
            }



            return JsonConvert.SerializeObject(auth);
        }
    }
}
