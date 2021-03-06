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
        public bool? Administrador { get; set; }

        [DataMember]
        public bool? Seguridad { get; set; }

        [DataMember]
        public bool? Consecutivo { get; set; }

        [DataMember]
        public bool? Mantenimiento { get; set; }

        [DataMember]
        public bool? Consulta { get; set; }

        [DataMember]
        public bool? Cliente { get; set; }

        //Variables Internas

        [DataMember]
        public List<SeguridadModel> allUsers { get; set; }

        [DataMember]
        public string newcontrasena { get; set; }

        [DataMember]
        public string newcontrasena2 { get; set; }

        #endregion

        #region Constructores

        public SeguridadModel(int USRID, string Usuario, string Contrasena, string Nombre, string Primer_Apellido, string Segundo_Apellido, string Correo,
            bool Administrador, bool Seguridad, bool Consecutivo, bool Mantenimiento, bool Consulta, bool Cliente)
        {
            this.USRID = USRID;
            this.Usuario = Usuario;
            this.Contrasena = Contrasena;
            this.Nombre = Nombre;
            this.Primer_Apellido = Primer_Apellido;
            this.Segundo_Apellido = Segundo_Apellido;
            this.Correo = Correo;
            this.Administrador = Administrador;
            this.Seguridad = Seguridad;
            this.Consecutivo = Consecutivo;
            this.Mantenimiento = Mantenimiento;
            this.Consulta = Consulta;
            this.Cliente = Cliente;
        }

        public SeguridadModel()
        {
        }

        #endregion
    }
}