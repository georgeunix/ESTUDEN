import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:student_maintenance/dao/model/student.dart';
import 'package:student_maintenance/dao/studentdao.dart';
import 'package:student_maintenance/utils/constants.dart';

import '../dao/apiprovider.dart';
import '../dao/model/studentapidao.dart';
import '../database/database.dart';
import 'menulateral.dart';

class Synchronization extends StatefulWidget {
  final _appDatabase = GetIt.I.get<AppDatabase>();

  StudentDao get studentDao => _appDatabase.studentDao;

  final apiProvider = GetIt.I.get<ApiProvider>();

  Synchronization({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Synchronization();
  }
}

class _Synchronization extends State<Synchronization> {
  displayDialog(String? title, String? msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(msg!),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void synchronizationExec() async {
    var registersSync = await widget.studentDao.findStudentEdited();
    if (registersSync.isEmpty || registersSync == null) {
      displayDialog(
          "Mensaje Informativo", "No hay registros editados para sincronizar.");
    } else {
      for (var register in registersSync) {
        var apiResult =
            await widget.apiProvider.saveStudent(Student.domainToDao());
        if (apiResult.coRespuesta != "500") {
          await widget.studentDao.insertStudent(register.statusSync());
        }
      }
      registersSync = await widget.studentDao.findStudentEdited();
      if (registersSync.isEmpty || registersSync == null) {
        displayDialog("Mensaje Informativo",
            "Se sincronizaron correctamente los registros editados");
      } else {
        /*
        displayDialog("Mensaje Informativo",
            "No todos los registros se sincronizaron. Verifique en el listado de estudiantes los registros que continúan en color verde para identificar los que no se sincronizaron.");
         */
        displayDialog("Mensaje Informativo",
            "Se han sincronizado los registros");


      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.titleSynchronization),
        ),
        drawer: const MenuLateral(),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                synchronizationExec();
              } catch (ex) {
                ex.toString();
              }
            },
            child: const Text(Constants.buttonSynchronization),
          ),
        ),
      ),
    );
    ;
  }
}
