import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:student_maintenance/dao/model/apiresponseIIEE.dart';
import 'package:student_maintenance/dao/model/apiresponsetest.dart';
import 'package:http/http.dart';

import 'model/studentapidao.dart';

class ApiProvider {
  // final baseUrl = "http://192.168.125.199";
  final baseUrl = "https://app.juntos.gob.pe";
  final client = GetIt.I.get<Client>();

  Future<ApiResponseTest> saveStudent(StudentApiDao studentDao) async {
    try {
      print("iniciando saveStudent...");
      Uri uri = Uri.parse(
          "$baseUrl/WS_GEOREFERENCIA/api/Coordenada/ActualizarCoordenada");
      final response = await client.post(
        uri,
        body: json.encode(studentDao.toMap()),
        headers: {'Content-Type': 'application/json'},
      );
      print("response saveStudent...${response.body}");
      if (response.statusCode == 200) {
        return ApiResponseTest.fromJson(json.decode(response.body));
      } else {
        ApiResponseTest responseFail = ApiResponseTest();
        responseFail.coRespuesta = "500";
        responseFail.coMensaje = "0001";
        responseFail.coMensaje = "Actualizacion fallida";
        return responseFail;
      }
    } catch (e) {
      ApiResponseTest responseFail = ApiResponseTest();
      responseFail.coRespuesta = "500";
      responseFail.coMensaje = "0001";
      responseFail.coMensaje = "Actualizacion fallida";
      return responseFail;
    }
  }



  Future<List<ApiResponseIIEE>> datos_IIEE() async {
    List<ApiResponseIIEE> studenIIEEList = [];
    try {
      print("Trayendo datos IIEE...");
      Uri uri = Uri.parse(
          "https://codigomodular.free.beeceptor.com/busqueda");
      final response = await client.get(
        uri,
        //body: json.encode(studentDao.toMap()),
        headers: {'Content-Type': 'application/json'},
      );
      print("response datos_IIEE...${response.body}");
      print("response ver...${response.statusCode}");
      if (response.statusCode == 200) {
        print("ENTRO 1");

        final decodedResponse = json.decode(response.body);

        for (final rowData in decodedResponse) {

          studenIIEEList.add(ApiResponseIIEE.fromJson(rowData));

        }
        return studenIIEEList;

      } else {

        final decodedResponse = json.decode(response.body);

        List<ApiResponseIIEE> studenIIEEList = [];
        studenIIEEList.add(ApiResponseIIEE(
          coDepartamento: "15",
          coProvincia: "01",
          coDistrito: "21",
          noEscuela: "colegio alegria",
          nivelModular: "B2",
          coModular: "2123456234",
        ));

        studenIIEEList.add(ApiResponseIIEE(
          coDepartamento: "16",
          coProvincia: "02",
          coDistrito: "22",
          noEscuela: "colegio fe y alegria  ",
          nivelModular: "B1",
          coModular: "123456234120",
        ));

        return studenIIEEList;
      }
    } catch (e) {
      print(e.toString());
      List<ApiResponseIIEE> studenIIEEList = [];
      studenIIEEList.add(ApiResponseIIEE(
        coDepartamento: "15",
        coProvincia: "01",
        coDistrito: "21",
        noEscuela: "colegio alegria",
        nivelModular: "B2",
        coModular: "2123456234",
      ));

      studenIIEEList.add(ApiResponseIIEE(
        coDepartamento: "16",
        coProvincia: "02",
        coDistrito: "22",
        noEscuela: "colegio fe y alegria  ",
        nivelModular: "B1",
        coModular: "123456234120",
      ));

      return studenIIEEList;
    }
  }

}
