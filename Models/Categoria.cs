using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Sistema.Models
{
   public class Categoria
   {
       public int CategoriaID{get;set;}
       [Required (ErrorMessage ="Campo Requerido")]
       [StringLength(50,MinimumLength=4,ErrorMessage="El nombre es incorrecto")]
       public string Nombre {get;set;}
       [StringLength(256,ErrorMessage="La descripción es incorrecta")]
       [Display (Name="Descripción")]
       public string Descripcion {get;set;} 
       public Boolean Estado {get;set;}
   }
}