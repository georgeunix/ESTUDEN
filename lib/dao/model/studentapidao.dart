class StudentApiDao {

  int? georeferenciaId;
  int? estadogeoreferencia;
  String? latitud;
  String? longitud;
  String? precision;
  String? observacion;
  String? codusuario;

  StudentApiDao({this.georeferenciaId, this.estadogeoreferencia, this.latitud,
    this.longitud, this.precision, this.observacion,
    this.codusuario});

  Map<String, dynamic> toMap() {
    return {
      "georeferenciaId": georeferenciaId!,
      "estadogeoreferencia": estadogeoreferencia!,
      "latitud": latitud,
      "longitud": longitud,
      "precision": precision,
      "observacion": observacion,
      "codusuario": codusuario,
    };
  }
}
