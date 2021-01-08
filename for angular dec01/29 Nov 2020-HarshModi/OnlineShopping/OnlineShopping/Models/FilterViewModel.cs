using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShopping.Models
{
    public class FilterViewModel
    {
        public string SortBy { get; set; }
        public string Search { get; set; }
        public int MaxPrice { get; set; }
        public int MinPrice { get; set; }
    }
}