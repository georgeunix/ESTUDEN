import 'package:floor/floor.dart';
import 'package:student_maintenance/dao/model/studentapidao.dart';

import '../../utils/constants.dart';
import '../../utils/helpers.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? id_corte;
  String? ut;
  String? departamento;
  String? provincia;
  String? distrito;
  String? id_hogar;
  String? cod_hogar;
  String? id_persona;
  String? dni;
  String? nombre;
  String? papellido;
  String? sapellido;
  String? fnacimiento;
  String? genero;
  String? cod_estado_mo;
  String? estado_mo;
  String? cotejo;
  String? edad;
  String? cod_grado;
  String? descripcion;
  String? seccion;
  String? anio_matricula;
  String? c_modular;
  String? motivo_no_estudio;
  String? categoria_matricula;
  String? editDate;
  bool? flagEdit;
  String? syncDate;
  bool? flagSync;

  Student(
      {this.id,
      this.id_corte,
      this.ut,
      this.departamento,
      this.provincia,
      this.distrito,
      this.id_hogar,
      this.cod_hogar,
      this.id_persona,
      this.dni,
      this.nombre,
      this.papellido,
      this.sapellido,
      this.fnacimiento,
      this.genero,
      this.cod_estado_mo,
      this.estado_mo,
      this.cotejo,
      this.edad,
      this.cod_grado,
      this.descripcion,
      this.seccion,
      this.anio_matricula,
      this.c_modular,
      this.motivo_no_estudio,
      this.categoria_matricula,
      this.editDate,
      this.flagEdit,
      this.syncDate,
      this.flagSync});

  static StudentApiDao domainToDao() {
    return StudentApiDao(
        georeferenciaId: 44714,
        estadogeoreferencia: 3,
        latitud: "11111111111111111",
        longitud: "2222222222222222",
        precision: "1",
        observacion: "se desplomo",
        codusuario: "30678");
  }

  Student statusSync() {
    syncDate = Helpers.formatDate(Constants.formatDate, DateTime.now());
    flagSync = true;
    return this;
  }

  Student.fromJson(dynamic json) {
    id = int.parse(json['id'].toString());
    id_corte = json['id_corte'].toString();
    ut = json['ut'].toString();
    departamento = json['departamento'].toString();
    provincia = json['provincia'].toString();
    distrito = json['distrito'].toString();
    id_hogar = json['id_hogar'].toString();
    cod_hogar = json['cod_hogar'].toString();
    id_persona = json['id_persona'];
    dni = json['dni'].toString();
    nombre = json['nombre'].toString();
    papellido = json['papellido'].toString();
    sapellido = json['sapellido'].toString();
    fnacimiento = json['fnacimiento'].toString();
    genero = json['genero'].toString();
    cod_estado_mo = json['cod_estado_mo'].toString();
    estado_mo = json['estado_mo'].toString();
    cotejo = json['cotejo'].toString();
    edad = json['edad'].toString();
    cod_grado = json['cod_grado'].toString();
    descripcion = json['descripcion'].toString();
    seccion = json['seccion'].toString();
    anio_matricula = json['anio_matricula'].toString();
    c_modular = json['c_modular'].toString();
    motivo_no_estudio = json['motivo_no_estudio'].toString();
    categoria_matricula = json['categoria_matricula'].toString();
  }

  static List<Student> listFromJson(dynamic json) {
    var list = json as List;
    List<Student> items = list.map((item) => Student.fromJson(item)).toList();
    return items;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "id_corte": id_corte,
      "ut": ut,
      "departamento": departamento,
      "provincia": provincia,
      "distrito": distrito,
      "id_hogar": id_hogar,
      "cod_hogar": cod_hogar,
      "id_persona": id_persona,
      "dni": dni,
      "nombre": nombre,
      "papellido": papellido,
      "sapellido": sapellido,
      "fnacimiento": fnacimiento,
      "genero": genero,
      "cod_estado_mo": cod_estado_mo,
      "estado_mo": estado_mo,
      "cotejo": cotejo,
      "edad": edad,
      "cod_grado": cod_grado,
      "descripcion": descripcion,
      "seccion": seccion,
      "anio_matricula": anio_matricula,
      "c_modular": c_modular,
      "motivo_no_estudio": motivo_no_estudio,
      "categoria_matricula": categoria_matricula,
    };
  }
}
