using System;
using System.Collections.Generic;
using System.Linq;
using Sistema.Models;
using System.Threading.Tasks;

namespace Sistema.Data {

    public class Dbinitializer {
        public static void Initialize (ApplicationDbContext context) {
            context.Database.EnsureCreated ();
            if (context.Categoria.Any ()) {
                return;
            }

            var categoria = new Categoria[] {
                new Categoria { Nombre = "Programacion", Descripcion = "Curso de programación", Estado = true },
                new Categoria { Nombre = "Redes", Descripcion = "Curso de Redes", Estado = true }
            };

            foreach (Categoria c in categoria) {
                context.Categoria.Add (c);
            }
            context.SaveChanges ();
        }
    }
}