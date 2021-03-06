﻿using BLL;
using ProyectoV_Vuelos.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace ProyectoV_Vuelos.Controllers
{
    public class BitacoraCRUDController : Controller
    {
        public ActionResult Index()
        {
            Errores Error = new Errores();

            try
            {
                if (BuscarBitacoras() != null)
                {
                    return View(BuscarBitacoras());
                }
                else
                {
                    throw new Exception();
                }

            }
            catch (Exception ex)
            {
                Error.GenerarError(DateTime.Now, "Error al mostrar el Index en la Tabla Bitácora: " + ex);
                throw;
            }
        }

        public static string Split(string d)
        {
            string[] lista = d.Split(' ');
            string descripcion = lista[lista.Length - 1];

            return descripcion;
        }

        public ActionResult DetalleRegistro(int id, string descripcion)
        {
            Errores Error = new Errores();
            string descrip = Split(descripcion);

            try
            {
                switch (descrip)
                {
                    case "País":
                        var Datos_Pais = BuscarBitacoras().Where(x => x.BTCID == id).Select(x => x).ToList();
                        return View("~/Views/BitacoraCRUD/Detalle_Pais.cshtml", Datos_Pais);

                    case "Consecutivo":
                        var Datos_Consec = BuscarBitacoras().Where(x => x.BTCID == id).Select(x => x).ToList();
                        return View("~/Views/BitacoraCRUD/Detalle_Consecutivo.cshtml", Datos_Consec);

                    case "Aerolínea":
                        var Datos_Aerol = BuscarBitacoras().Where(x => x.BTCID == id).Select(x => x).ToList();
                        return View("~/Views/BitacoraCRUD/Detalle_Aerolinea.cshtml", Datos_Aerol);

                    case "Aeropuerto":
                        var Datos_Aerop = BuscarBitacoras().Where(x => x.BTCID == id).Select(x => x).ToList();
                        return View("~/Views/BitacoraCRUD/Detalle_Aeropuerto.cshtml", Datos_Aerop);

                    case "Vuelo":
                        var Datos_Vuelo = BuscarBitacoras().Where(x => x.BTCID == id).Select(x => x).ToList();
                        return View("~/Views/BitacoraCRUD/Detalle_Vuelo.cshtml", Datos_Vuelo);

                    default:
                        Console.WriteLine("La descripción es nula o tiene otro valor");
                        break;
                }
            }
            catch (Exception ex)
            {
                Error.GenerarError(DateTime.Now, "Error a la hora de separar los detalles en registro de las bitácoras en la Tabla Bitácora: " + ex);
                throw;
            }

            return View();
        }

        public ActionResult Busqueda(FormCollection item)
        {
            Errores Error = new Errores();
            string usuario = item["user"];
            string fechainicio = item["fechainicio"];
            string fechafinal = item["fechafinal"];
            string tipo = item["tipo"];

            try
            {
                if (usuario == "" && fechainicio == "" && fechafinal == "" && tipo == "")
                {
                    return View("~/Views/BitacoraCRUD/Consulta.cshtml", BuscarBitacoras());
                }
                else
                {
                    if (usuario != "" && fechainicio != "" && fechafinal != "" && tipo != "")
                    {
                        var datos = BuscarBitacoras().Where(x => x.Usuario_Bitac == Convert.ToInt32(usuario) && x.Fecha >= Convert.ToDateTime(fechainicio)
                        && x.Fecha <= Convert.ToDateTime(fechafinal) && x.Tipo == tipo).Select(x => x).ToList();
                        return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                    }
                    else
                    {
                        if ((usuario != "" && fechainicio != "" && fechafinal != "") && tipo == "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Usuario_Bitac == Convert.ToInt32(usuario) && x.Fecha >= Convert.ToDateTime(fechainicio)
                            && x.Fecha <= Convert.ToDateTime(fechafinal)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if ((fechainicio != "" && fechafinal != "" && tipo != "") && usuario == "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Fecha >= Convert.ToDateTime(fechainicio)
                            && x.Fecha <= Convert.ToDateTime(fechafinal) && x.Tipo == tipo).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if ((usuario != "" && tipo != "") && (fechainicio == "" && fechafinal == ""))
                        {
                            var datos = BuscarBitacoras().Where(x => x.Usuario_Bitac == Convert.ToInt32(usuario) && x.Tipo == tipo).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (usuario != "" && fechainicio != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Usuario_Bitac == Convert.ToInt32(usuario) && x.Fecha >= Convert.ToDateTime(fechainicio)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (usuario != "" && fechafinal != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Usuario_Bitac == Convert.ToInt32(usuario) && x.Fecha <= Convert.ToDateTime(fechafinal)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (fechainicio != "" && fechafinal != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Fecha >= Convert.ToDateTime(fechainicio) && x.Fecha <= Convert.ToDateTime(fechafinal)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (tipo != "" && fechainicio != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Tipo == tipo && x.Fecha >= Convert.ToDateTime(fechainicio)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (tipo != "" && fechafinal != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Tipo == tipo && x.Fecha <= Convert.ToDateTime(fechafinal)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (usuario != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Usuario_Bitac == Convert.ToInt32(usuario)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (fechainicio != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Fecha >= Convert.ToDateTime(fechainicio)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (fechafinal != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Fecha <= Convert.ToDateTime(fechafinal)).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }

                        if (tipo != "")
                        {
                            var datos = BuscarBitacoras().Where(x => x.Tipo == tipo).Select(x => x).ToList();
                            return View("~/Views/BitacoraCRUD/Consulta.cshtml", datos);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Error.GenerarError(DateTime.Now, "Error al realizar la busqueda en la Tabla Bitácora: " + ex);
                throw;
            }

            return View("~/Views/BitacoraCRUD/Consulta.cshtml", BuscarBitacoras());
        }

        public ActionResult Consulta()
        {
            Errores Error = new Errores();

            try
            {
                if (BuscarBitacoras() != null)
                {
                    return View(BuscarBitacoras());
                }
                else
                {
                    throw new Exception();
                }

            }
            catch (Exception ex)
            {
                Error.GenerarError(DateTime.Now, "Error al mostrar las Consultas en la Tabla Bitácora: " + ex);
                throw;
            }
        }

        public List<BitacorasModel> BuscarBitacoras()
        {
            Errores Error = new Errores();

            try
            {
                Bitacoras Bitacoras = new Bitacoras();
                List<BitacorasModel> lista =
                Bitacoras.SP_Solicitar_Info_Bitacoras().Tables[0].AsEnumerable().Select(e => new BitacorasModel
                {
                    BTCID = e.Field<int>("BTCID"),
                    Consec_Bitacora = e.Field<int>("Consec_Bitacora"),
                    Usuario_Bitac = e.Field<int>("Usuario_Bitac"),
                    Cod_Registro = e.Field<int>("Cod_Registro"),
                    Fecha = e.Field<DateTime>("Fecha"),
                    Tipo = e.Field<string>("Tipo"),
                    Descripcion = e.Field<string>("Descripcion"),
                    Codigo = e.Field<string>("Codigo"),
                    Nombre = e.Field<string>("Nombre"),
                    Imagen = e.Field<string>("Imagen"),
                    Num_Puerta = e.Field<int>("Num_Puerta"),
                    Detalle = e.Field<string>("Detalle"),
                    Consec_Descripcion = e.Field<string>("Consec_Descripcion"),
                    Consecutivo = e.Field<string>("Consecutivo"),
                    Destino = e.Field<string>("Destino"),
                    Procedencia = e.Field<string>("Procedencia"),
                    Fecha_Vuelo = e.Field<DateTime>("Fecha_Vuelo"),
                    Estado = e.Field<string>("Estado"),
                    Monto = e.Field<double>("Monto")

                }).ToList();

                return lista;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Valor Null detectado");
                Error.GenerarError(DateTime.Now, "Error al buscar las bitácoras en la Tabla Bitácora: " + ex);
                throw;
            }
        }
    }
}