
class ApiResponseTest {
  String? coRespuesta;
  String? coMensaje;
  String? deMensaje;

  ApiResponseTest.fromJson(dynamic json) {
    coRespuesta = json['coRespuesta'];
    coMensaje = json['coMensaje'];
    deMensaje = json['deMensaje'];
  }

  ApiResponseTest({this.coRespuesta, this.coMensaje, this.deMensaje});
}
