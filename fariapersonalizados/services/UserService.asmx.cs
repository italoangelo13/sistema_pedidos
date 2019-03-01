using fariapersonalizados.Models;
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
    /// Summary description for UserService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class UserService : System.Web.Services.WebService
    {

        [WebMethod]
        public string GetUsuarioPorId(string Id)
        {
            UsuarioModels um = new UsuarioModels();
            int idUsuario = int.Parse(Id);
            if (idUsuario == 0)
            {
                um.Id = 0;
                um.Nome = "Administrador";
                um.Perfil = 1;
                um.Usuario = "admin";
            }
            else
            {

                BancoDados b = new BancoDados();
                b.Query(@"SELECT * FROM usuario where USU_CODIGOID = ?USU_CODIGOID");
                b.SetParametro("?USU_CODIGOID", idUsuario);
                DataTable dt = b.ExecutarDataTable();
                if (dt.Rows.Count > 0)
                {
                    //USU_CODIGOID, USU_NOME, USU_USUARIO, USU_SENHA, USU_PERFIL, USU_EMAIL, USU_ENDERECO, USU_TELEFONE, USU_CELULAR, USU_DATACADASTRO, USU_CEP, USU_CAMINHO_IMG_PERFIL
                    um.Celular = dt.Rows[0]["USU_CELULAR"].ToString().ToUpper();
                    um.Cep = dt.Rows[0]["USU_CEP"].ToString().ToUpper();
                    um.DataCadastro = DateTime.Parse(dt.Rows[0]["USU_DATACADASTRO"].ToString().ToUpper());
                    um.Email = dt.Rows[0]["USU_EMAIL"].ToString().ToUpper();
                    um.Endereco = dt.Rows[0]["USU_ENDERECO"].ToString().ToUpper();
                    um.Id = int.Parse(dt.Rows[0]["USU_CODIGOID"].ToString().ToUpper());
                    um.Nome = dt.Rows[0]["USU_NOME"].ToString().ToUpper();
                    um.Perfil = int.Parse(dt.Rows[0]["USU_PERFIL"].ToString().ToUpper());
                    um.Senha = null;
                    um.Telefone = dt.Rows[0]["USU_TELEFONE"].ToString().ToUpper();
                    um.Usuario = dt.Rows[0]["USU_USUARIO"].ToString().ToUpper();
                    um.CaminhoImagem = dt.Rows[0]["USU_CAMINHO_IMG_PERFIL"].ToString();
                }
            }


            return JsonConvert.SerializeObject(um);
        }
    }
}
