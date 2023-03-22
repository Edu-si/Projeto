using Microsoft.EntityFrameworkCore;

namespace MinhaApiCore.Model
{
    public class ApiDbContext : DbContext
    {

        public ApiDbContext (DbContextOptions options) : base(options)
        {

        }

        public DbSet<Dados> Dados {  get; set; }
    }
}
