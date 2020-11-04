﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace ProyectoV_Vuelos.Models
{
    public class SeguridadModel
    {
        #region Propiedades

        [DataMember]
        public int USRID { get; set; }
        [DataMember]
        public int ID_Rol { get; set; }
        [DataMember]
        public string Usuario { get; set; }
        [DataMember]
        public string Contrasena { get; set; }
        [DataMember]
        public string Nombre { get; set; }
        [DataMember]
        public string Primer_Apellido { get; set; }
        [DataMember]
        public string Segundo_Apellido { get; set; }
        [DataMember]
        public string Pregunta { get; set; }
        [DataMember]
        public string Respuesta { get; set; }

        [DataMember]
        public string Correo { get; set; }





        [DataMember]
        public string newcontrasena { get; set; }


        [DataMember]
        public string newcontrasena2 { get; set; }



        #endregion

        #region Constructores

        public SeguridadModel(int USRID, int ID_Rol, string Usuario, string Contrasena, string Nombre, string Primer_Apellido, string Segundo_Apellido, string Correo)
        {
            this.USRID = USRID;
            this.ID_Rol = ID_Rol;
            this.Usuario = Usuario;
            this.Contrasena = Contrasena;
            this.Nombre = Nombre;
            this.Primer_Apellido = Primer_Apellido;
            this.Segundo_Apellido = Segundo_Apellido;
            this.Correo = Correo;
        }

        public SeguridadModel()
        {
        }

        #endregion
    }
}