using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace fariapersonalizados.Models
{
    public class UsuarioModels
    {
        //Campos: USU_CODIGOID, USU_NOME, USU_USUARIO, USU_SENHA, USU_PERFIL, USU_EMAIL, USU_ENDERECO, USU_TELEFONE, USU_CELULAR, USU_DATACADASTRO, USU_CEP, USU_CAMINHO_IMG_PERFIL
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Usuario { get; set; }
        public string Senha { get; set; }
        public int Perfil { get; set; }
        public string Email { get; set; }
        public string Endereco { get; set; }
        public string Telefone { get; set; }
        public string Celular { get; set; }
        public DateTime DataCadastro { get; set; }
        public string Cep { get; set; }
        public string CaminhoImagem { get; set; }
    }
}