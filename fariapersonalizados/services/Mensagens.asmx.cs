using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace fariapersonalizados.services
{
    /// <summary>
    /// Summary description for Mensagens
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Mensagens : System.Web.Services.WebService
    {

        [WebMethod]
        public string buscaQtdeMensagem(string Id)
        {
            int idUsuario = int.Parse(Id);
            int qtdeMsg = 0;
            if (idUsuario == 0)
            {
                BancoDados b = new BancoDados();
                b.Query(@"SELECT count(*) msg FROM mensagens where MEN_CODUSUdESTINATARIO = 0 or MEN_CODUSUdESTINATARIO is null");
                DataTable dt = b.ExecutarDataTable();
                if (dt.Rows.Count > 0)
                {

                    qtdeMsg = int.Parse(dt.Rows[0]["msg"].ToString().ToUpper());
                }
            }
            else
            {

                BancoDados b = new BancoDados();
                b.Query(@"SELECT count(*) msg FROM mensagens where MEN_CODUSUdESTINATARIO = ?MEN_CODUSUdESTINATARIO");
                b.SetParametro("?MEN_CODUSUdESTINATARIO", idUsuario);
                DataTable dt = b.ExecutarDataTable();
                if (dt.Rows.Count > 0)
                {
                    qtdeMsg = int.Parse(dt.Rows[0]["msg"].ToString().ToUpper());
                }
            }


            return JsonConvert.SerializeObject(qtdeMsg);
        }
    }
}
