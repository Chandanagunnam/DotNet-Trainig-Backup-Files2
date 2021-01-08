using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShopping.Models
{
    public class ChangePasswordModel
    {
        public string Password { get; set; }
        public int OTP { get; set; }
        public string EmailId { get; set; }
    }
}