using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;

namespace Rinku.Models
{
    public class Movements : Employe
    {
        public int IDEmploye { get; set; }
        public int IDMonth { get; set; }
        public int QtyShip { get; set; }
        public Employe Employe { get; set; }
    }

    public class MovementsDBContext : DbContext
    {
        public DbSet<Movements> Movements { get; set; }
    }
}