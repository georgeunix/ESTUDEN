import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:student_maintenance/dao/model/student.dart';
import 'package:student_maintenance/utils/constants.dart';
import 'package:student_maintenance/views/utils/helpersview.dart';

import '../dao/studentdao.dart';
import '../database/database.dart';
import 'list.dart';

class SearchStudent extends StatefulWidget {
  GlobalKey<FormState> keyFormSearch = GlobalKey();
  TextEditingController dniCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController departCtrl = TextEditingController();

  final dniParamValidateForm = List.filled(3, "", growable: false);

  final _appDatabase = GetIt.I.get<AppDatabase>();

  StudentDao get studentDao => _appDatabase.studentDao;

  SearchStudent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchStudent();
  }
}

class _SearchStudent extends State<SearchStudent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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

  void navigateList(List<Student> students) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentsList(students),
        ));
  }

  void validNotFoundStudent(List<Student> students) {
    if(students.isEmpty || students == null) {
      displayDialog("Mensaje Informativo", "No se encontraron registros con el criterio de búsqueda ingresada.");
    } else {
      navigateList(students);
    }
  }

  execSearchByLasNameAndDepartAndDni() async {
    try {
      var totalStudents = await widget.studentDao.totalStudent();
      if(totalStudents == 0) {
        displayDialog("Mensaje Informativo", "Aún no se cargan los datos. Espere unos momentos e intente de nuevo.");
      }
      else {
        final students = await widget.studentDao.findStudentByNameAndLastNameAndDni(widget.departCtrl.text.toUpperCase().trim(),
            widget.lastNameCtrl.text.toUpperCase().trim(), widget.dniCtrl.text.toUpperCase().trim());
        validNotFoundStudent(students);
      }
    } catch(e) {
      displayDialog("Mensaje de Error", "Algo salió mal al consultar los datos.");
    }
  }

  execSearchByLasNameAndDepart() async {
    try {
      var totalStudents = await widget.studentDao.totalStudent();
      if(totalStudents == 0) {
        displayDialog("Mensaje Informativo", "Aún no se cargan los datos. Espere unos momentos e intente de nuevo.");
      }
      else {
        final students = await widget.studentDao.findStudentByNameAndLastName(widget.departCtrl.text.toUpperCase().trim(),
            widget.lastNameCtrl.text.toUpperCase().trim());
        validNotFoundStudent(students);
      }
    } catch(e) {
      displayDialog("Mensaje de Error", "Algo salió mal al consultar los datos.");
    }
  }

  execSearchByDepartAndDni() async {
    try {
      var totalStudents = await widget.studentDao.totalStudent();
      if(totalStudents == 0) {
        displayDialog("Mensaje Informativo", "Aún no se cargan los datos. Espere unos momentos e intente de nuevo.");
      }
      else {
        final students = await widget.studentDao.findStudentByDepartAndDni(widget.departCtrl.text.toUpperCase().trim(),
            widget.dniCtrl.text.toUpperCase().trim());
        validNotFoundStudent(students);
      }
    } catch(e) {
      displayDialog("Mensaje de Error", "Algo salió mal al consultar los datos.");
    }
  }

  execSearchByLasNameAndDni() async {
    try {
      var totalStudents = await widget.studentDao.totalStudent();
      if(totalStudents == 0) {
        displayDialog("Mensaje Informativo", "Aún no se cargan los datos. Espere unos momentos e intente de nuevo.");
      }
      else {
        final students = await widget.studentDao.findStudentByLastNameAndDni(widget.lastNameCtrl.text.toUpperCase().trim(),
            widget.dniCtrl.text.toUpperCase().trim());
        validNotFoundStudent(students);
      }
    } catch(e) {
      displayDialog("Mensaje de Error", "Algo salió mal al consultar los datos.");
    }
  }

  execSearchByDni() async {
    try {
      var totalStudents = await widget.studentDao.totalStudent();
      if(totalStudents == 0) {
        displayDialog("Mensaje Informativo", "Aún no se cargan los datos. Espere unos momentos e intente de nuevo.");
      }
      else {
        final students = await widget.studentDao.findStudentByDni(widget.dniCtrl.text.toUpperCase().trim());
        validNotFoundStudent(students);
      }
    } catch(e) {
      displayDialog("Mensaje de Error", "Algo salió mal al consultar los datos.");
    }
  }

  execSearchByDepart() async {
    try {
      var totalStudents = await widget.studentDao.totalStudent();
      if(totalStudents == 0) {
        displayDialog("Mensaje Informativo", "Aún no se cargan los datos. Espere unos momentos e intente de nuevo.");
      }
      else {
        final students = await widget.studentDao.findStudentByDepart(widget.departCtrl.text.toUpperCase().trim());
        validNotFoundStudent(students);
      }
    } catch(e) {
      displayDialog("Mensaje de Error", "Algo salió mal al consultar los datos.");
    }
  }

  execSearchByLastName() async {
    try {
      var totalStudents = await widget.studentDao.totalStudent();
      if(totalStudents == 0) {
        displayDialog("Mensaje Informativo", "Aún no se cargan los datos. Espere unos momentos e intente de nuevo.");
      }
      else {
        final students = await widget.studentDao.findStudentByLastName(widget.lastNameCtrl.text.toUpperCase().trim());
        validNotFoundStudent(students);
      }
    } catch(e) {
      displayDialog("Mensaje de Error", "Algo salió mal al consultar los datos.");
    }
  }

  search() async {
    displayDialog("Mensaje Informativo", "Sea paciente. Esta cargando los datos a listar...");
    if(widget.departCtrl.text.isNotEmpty && widget.dniCtrl.text.isNotEmpty && widget.lastNameCtrl.text.isNotEmpty) {
      execSearchByLasNameAndDepartAndDni();
    }
    else if(widget.departCtrl.text.isNotEmpty && widget.lastNameCtrl.text.isNotEmpty) {
      execSearchByLasNameAndDepart();
    }
    else if(widget.departCtrl.text.isNotEmpty && widget.dniCtrl.text.isNotEmpty) {
      execSearchByDepartAndDni();
    }
    else if(widget.lastNameCtrl.text.isNotEmpty && widget.dniCtrl.text.isNotEmpty) {
      execSearchByLasNameAndDni();
    }
    else if(widget.dniCtrl.text.isNotEmpty) {
      execSearchByDni();
    }
    else if(widget.departCtrl.text.isNotEmpty) {
      execSearchByDepart();
    }
    else if(widget.lastNameCtrl.text.isNotEmpty) {
      execSearchByLastName();
    }
    else {
      displayDialog("Mensaje Informativo", "Ingrese algún criterio de búsqueda.");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.titleSearchStudent),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(60.0),
            child: Form(
              key: widget.keyFormSearch,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }



  Widget formUI() {
    return Column(
      children: <Widget>[
        HelpersView.formItemsDesign(
          Icons.add_business_sharp,
            DropdownButtonFormField(
              items: Constants.departments.map((dep){

                return DropdownMenuItem(
                  value: dep,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      dep,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                //widget.departCtrl.text = value!;
                value! == "<Seleccionar>" ? widget.departCtrl.text = ""! : widget.departCtrl.text = value!;
              },
              isDense: true,
              isExpanded: true,
            ),
        ),
        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.dniCtrl,
              decoration: const InputDecoration(
                labelText: 'DNI',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 8,
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.dniParamValidateForm);
              },
            )),
        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.lastNameCtrl,
              decoration: const InputDecoration(
                labelText: 'Apellido Paterno',
              ),
            )),
        GestureDetector(
            onTap: () async {
              search();
            },
            child: Container(
              margin: const EdgeInsets.all(30.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: const LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: const Text("Consultar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ))
      ],
    );
  }
}
