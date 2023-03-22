using System.ComponentModel.DataAnnotations;

namespace MinhaApiCore.Model
{
    public class PalavraChave
    {
        [Key]
        public Guid Id { get; set; }
        public string nome { get; set; }    
        public string categoria { get; set; }
    }


}
