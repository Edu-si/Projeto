using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using MinhaApiCore.Model;
using NuGet.Versioning;
using static Azure.Core.HttpHeader;

namespace MinhaApiCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TarefasController : ControllerBase
    {
        private readonly ApiDbContext _context;

        public TarefasController(ApiDbContext context)
        {
            _context = context;
        }
        
        // GET: api/tarefas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Dados>>> GetTarefa1()
        {

            string diretorio = @"C:\Fiotec\MinhaApiCore\MinhaApiCore\Mensagens";

            string[] files = Directory.GetFiles(diretorio, "*.txt");

            foreach (string s in files)
            {
               
                var fi = new FileInfo(s);
                //VERIFICA SE O ARQUIVO EXISTE 
                IQueryable<Dados> verificar =
                     from Dados in _context.Dados
                     where Dados.NomeArquivo == fi.Name
                     select Dados;

                //SE NÃO EXISTE CADASTRA O ARQUIVO
                if (verificar.Count() == 0)
                {
                    try
                    {
                        if (s == null)
                        {
                            return NotFound(s);
                        }
                        else
                        {
                            try
                            {
                                using (StreamReader sr = new StreamReader(s))
                                {
                                    String? linha;

                                    string remetente = "";
                                    string destinatario = "";
                                    string dataHora = "";
                                    string conteudo = "";
                                    string nomeArquivo = fi.Name;

                                    // Lê linha por linha
                                    while ((linha = sr.ReadLine()) != null)
                                    {

                                        if (linha.Contains("De:"))
                                        {
                                            remetente = linha.Remove(0, 4);
                                        }
                                        else if (linha.Contains("Enviado em:"))
                                        {
                                            dataHora = linha.Remove(0, 12);
                                        }
                                        else if (linha.Contains("Para:"))
                                        {
                                            destinatario = linha.Remove(0, 6);
                                          
                                        }
                                        else
                                        {
                                            conteudo = sr.ReadToEndAsync().Result;

                                            Dados dados = new Dados
                                            {
                                                Id = Guid.NewGuid(),
                                                NomeArquivo = nomeArquivo,
                                                Remetente = remetente,
                                                Destinatario = destinatario,
                                                DataHora = dataHora,
                                                Conteudo = conteudo
                                            };

                                            _context.Dados.Add(dados);
                                            _context.SaveChanges();
                                        }
                                        
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }
                        }

                        fi = new System.IO.FileInfo(s);
                    }
                    catch (System.IO.FileNotFoundException e)
                    {

                        Console.WriteLine(e.Message);
                        continue;
                    }
                }
            }

            return await _context.Dados.ToListAsync();
        }


        // GET: api/tarefas2
        [HttpGet("tarefas2")]
        public async Task<ActionResult<IEnumerable<PalavraChave>>> GetTarefa2()
        {
            string diretorio = @"C:\Fiotec\MinhaApiCore\MinhaApiCore\Palavras\Externo_palavras.txt";
            using var file = new StreamReader(diretorio);
            string? line;

            _context.PalavraChave.ExecuteDelete();

            IQueryable<Dados> dados =
                from Dados in _context.Dados
                select Dados;
         
              
            foreach (Dados retorno in dados)
            {
              
                // LER O EXTERNO PALAVRAS
                while ((line = file.ReadLine()) != null)
                {
                    var arr = retorno.Conteudo.Split(' ');
                    if (arr.Contains(line))
                    {
                        PalavraChave palavraChave = new PalavraChave
                        {
                            Id = Guid.NewGuid(),
                            nome = line,
                            categoria = "Dicionário"
                        };

                        _context.PalavraChave.Add(palavraChave);
                        _context.SaveChanges();
                    }
                }
               
            }
         
            file.Close();

            return await _context.PalavraChave.ToListAsync();
        }


    }
}
