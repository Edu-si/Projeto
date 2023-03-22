using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using System.ComponentModel.DataAnnotations;

namespace MinhaApiCore.Model
{
    public class Dados
    {
        [Key]
        public Guid Id { get; set; }
        public string NomeArquivo { get; set; }
        public string Remetente { get; set; }
        public string Destinatario { get; set; }
        public string DataHora { get; set; }
        public string Conteudo { get; set; }

    }
}
