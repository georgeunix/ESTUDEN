
class ApiResponseIIEE {
  String? coDepartamento;
  String? coProvincia;
  String? coDistrito;
  String? noEscuela;
  String? nivelModular;
  String? coModular;

  ApiResponseIIEE.fromJson(dynamic json) {
    coDepartamento = json['coDepartamento'];
    coProvincia = json['coProvincia'];
    coDistrito = json['coDistrito'];
    noEscuela = json['noEscuela'];
    nivelModular = json['nivelModular'];
    coModular = json['coModular'];
  }

  ApiResponseIIEE({this.coDepartamento, this.coProvincia, this.coDistrito, this.noEscuela, this.nivelModular, this.coModular});
}
