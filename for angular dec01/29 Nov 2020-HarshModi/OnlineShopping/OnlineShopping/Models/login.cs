using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace OnlineShopping.Models
{
    [DataContract]
    public class login
    {
        [DataMember]
        public string email { get; set; }
        [DataMember]
        public string password { get; set; }
    }
}