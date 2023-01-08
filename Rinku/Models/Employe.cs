using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;

namespace Rinku.Models
{
    public class Employe
    {
        [Display(Name = "Numero")]
        public int? Number { get; set; }

        public int idRol { get; set; }

        [Display(Name = "Nombre")]
        public string Name { get; set; }

        public DateTime? CreationDte { get; set; }
        
        public int? Active { get; set; }
    }

    public class EmployeDBContext : DbContext 
    {
        public DbSet<Employe> Employes { get; set; }
    }
}