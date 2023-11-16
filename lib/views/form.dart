import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:student_maintenance/dao/model/apiresponseIIEE.dart';
import 'package:student_maintenance/dao/model/studentapidao.dart';
import 'package:student_maintenance/utils/constants.dart';
import 'package:student_maintenance/views/menulateral.dart';
import 'package:student_maintenance/utils/helpers.dart';
import 'package:student_maintenance/views/utils/helpersview.dart';

import '../dao/studentdao.dart';
import '../dao/apiprovider.dart';
import '../dao/model/student.dart';
import '../database/database.dart';
import 'list.dart';




class Register extends StatefulWidget {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController fatherLastNameCtrl = TextEditingController();
  TextEditingController motherLastNameCtrl = TextEditingController();
  TextEditingController codigoModular = TextEditingController();

  TextEditingController departamentoform = TextEditingController();
  TextEditingController provinciaform = TextEditingController();
  TextEditingController distritoform = TextEditingController();

  TextEditingController dniCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController degreeCtrl = TextEditingController();
  TextEditingController levelCtrl = TextEditingController();
  TextEditingController nameIIEECtrl = TextEditingController();
  TextEditingController enrollmentDateCtrl = TextEditingController();
  TextEditingController codStudentCtrl = TextEditingController();

  final nameLastNameParamValidateForm = List.filled(3, "", growable: false);
  final dniParamValidateForm = List.filled(3, "", growable: false);
  final ageParamValidateForm = List.filled(3, "", growable: false);
  final degreeParamValidateForm = List.filled(3, "", growable: false);
  final levelParamValidateForm = List.filled(3, "", growable: false);
  final nameIIEEParamValidateForm = List.filled(3, "", growable: false);
  final enrollmentDateParamValidateForm = List.filled(3, "", growable: false);
  final codStudentParamValidateForm = List.filled(3, "", growable: false);
  final codModularValidateForm = List.filled(3, "", growable: false);

  final departamentoValidateForm = List.filled(3, "", growable: false);
  final provinciaValidateForm = List.filled(3, "", growable: false);
  final distritoValidateForm = List.filled(3, "", growable: false);

  final apiProvider = GetIt.I.get<ApiProvider>();

  final _appDatabase = GetIt.I.get<AppDatabase>();





  //final List<DataCell> _cells = [DataCell(Text('')), DataCell(Text('')),];

  StudentDao get studentDao => _appDatabase.studentDao;

  Student student = Student();

  Register(this.student, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Register();
  }
}

class _Register extends State<Register> {

  var inputNombreIIEE, inputcodigo, inputnivel;

  List<DataRow> _rows = [
    DataRow(cells: [
      DataCell(Text('')),
      DataCell(Text('')),
      DataCell(Text('')),
      /*
      DataCell(Text('')),
      DataCell(Text('')),
      DataCell(Text('')),

       */
    ]),
    // Agrega más filas según sea necesario
  ];



  @override
  void initState() {
    if (widget.student.id == null) {
      navigateList();
    }

    widget.nameLastNameParamValidateForm[0] = Constants.patternNameLastName;
    widget.nameLastNameParamValidateForm[1] =
        "Nombre(s) o apellido(s) obligatorios";
    widget.nameLastNameParamValidateForm[2] =
        "Formato incorrecto. [a-z] y [A-Z]";

    widget.dniParamValidateForm[0] = Constants.patternDni;
    widget.dniParamValidateForm[1] = "DNI obligatorios";
    widget.dniParamValidateForm[2] =
        "Formato incorrecto. [0-9] de longitud 8 o 9";

    widget.ageParamValidateForm[0] = Constants.patternAge;
    widget.ageParamValidateForm[1] = "Edad obligatorio";
    widget.ageParamValidateForm[2] =
        "Formato incorrecto. [0-9] de longitud 1 o 2";

    widget.levelParamValidateForm[0] = Constants.patternLevel;
    widget.levelParamValidateForm[1] = "Nivel obligatorio";
    widget.levelParamValidateForm[2] = "Formato incorrecto. [a-z] y [A-Z]";

    widget.nameIIEEParamValidateForm[0] = Constants.patternNameIIEE;
    widget.nameIIEEParamValidateForm[1] = "IIEE obligatorio";
    widget.nameIIEEParamValidateForm[2] = "Formato incorrecto. [a-z] y [A-Z]";

    /*
    widget.enrollmentDateParamValidateForm[0] = Constants.patternEnrollmentDate;
    widget.enrollmentDateParamValidateForm[1] = "Año de Matricula obligatorio";
    widget.enrollmentDateParamValidateForm[2] =
        "Formato incorrecto. [yyyy] o [yyyy]";

     */

    widget.codStudentParamValidateForm[0] = Constants.patternCodStudent;
    widget.codStudentParamValidateForm[1] = "Código de estudiante obligatorio";
    widget.codStudentParamValidateForm[2] = "Dígitos insuficiente";

    widget.codModularValidateForm[0] = Constants.patternCodModularStudent;
    widget.codModularValidateForm[1] = "Código Modular obligatorio";
    widget.codModularValidateForm[2] = "Dígitos insuficientes";

    setValueFormEdit();
    // TODO: implement initState
    super.initState();
  }

  void navigateList() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentsList(List.empty()),
        ));
  }

  void setValueFormEdit() {
    widget.dniCtrl.text = widget.student.dni!;
    widget.nameCtrl.text = widget.student.nombre!;
    widget.fatherLastNameCtrl.text = widget.student.papellido!;
    widget.motherLastNameCtrl.text = widget.student.sapellido!;
    //widget.codigoModular.text = widget.student.cod_estado_mo!;
    widget.codigoModular.text = "";
    //widget.levelCtrl.text = widget.student.descripcion!;
    widget.levelCtrl.text = "";

    widget.departamentoform.text = "";
    widget.provinciaform.text = "";
    widget.distritoform.text = "";


    //widget.enrollmentDateCtrl.text = widget.student.anio_matricula!;
    //widget.codStudentCtrl.text = widget.student.id_persona!;
    widget.codStudentCtrl.text = "";
  }

  void cleanFormFields() {
    widget.student = Student();
    widget.dniCtrl.text = "";
    widget.nameCtrl.text = "";
    widget.fatherLastNameCtrl.text = "";
    widget.motherLastNameCtrl.text = "";
    widget.codigoModular.text = "";
    widget.levelCtrl.text = "";
    widget.enrollmentDateCtrl.text = "";
    widget.codStudentCtrl.text = "";
  }

  save() async {
    if (widget.keyForm.currentState!.validate()) {
      widget.student.dni = widget.dniCtrl.text;
      widget.student.nombre = widget.nameCtrl.text;
      widget.student.papellido = widget.fatherLastNameCtrl.text;
      widget.student.sapellido = widget.motherLastNameCtrl.text;
      widget.student.descripcion = widget.levelCtrl.text;
      widget.student.anio_matricula = widget.enrollmentDateCtrl.text;
      widget.student.id_persona = widget.codStudentCtrl.text;
      widget.student.editDate =
          Helpers.formatDate(Constants.formatDate, DateTime.now());
      widget.student.flagEdit = true;
      widget.keyForm.currentState!.reset();
      await widget.studentDao.insertStudent(widget.student);
      cleanFormFields();
      navigateList();
    }
    else {
      displayDialog("Mensaje Informativo", "Hay campos obligatorios por llenar.");
    }
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

  //API

  Future<List<ApiResponseIIEE>> datosIIEE() async {
    List<ApiResponseIIEE> studenIIEEList = [];
    studenIIEEList = await widget.apiProvider.datos_IIEE();
    if (studenIIEEList.isNotEmpty) {
      print("LA GRILLA FUNCIONA  API");

      for (final rowData in studenIIEEList) {

        inputcodigo = rowData.coModular;
        inputnivel = rowData.nivelModular;
        inputNombreIIEE = rowData.noEscuela;
        print("studenIIEEList: "+ rowData.noEscuela!);
      }
    } else {
      print("LA GRILLA NO FUNCIONA");

      inputcodigo = "5555562341";
      inputnivel = "B3";
      inputNombreIIEE = "colegio fe y alegria";

    }
    return studenIIEEList;
  }

  void rellenarDatos(){
    widget.codigoModular.text = inputcodigo;
    widget.levelCtrl.text = inputnivel;
    widget.nameIIEECtrl.text = inputNombreIIEE;
  }


  void showModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Buscar Colegio'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Aquí puedes colocar tu formulario de consulta
                TextFormField(
                  // Configuraciones del TextFormField
                  decoration: const InputDecoration(labelText: 'Campo de Consulta'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async  {
                    // Lógica de consulta y actualización de la tabla
                    try {
                      final data = await datosIIEE();
                      // Update table rows with retrieved data
                      List<DataRow> rows = [];
                      for (final rowData in data) {
                        rows.add(
                            DataRow(cells: [
                              DataCell(Text(rowData.noEscuela!)),
                              DataCell(Text(rowData.coModular!)),
                              DataCell(Text(rowData.nivelModular!)),
                              /*
                              DataCell(Text(rowData.coDepartamento!)),
                              DataCell(Text(rowData.coProvincia!)),
                              DataCell(Text(rowData.coDistrito!)),

                               */

                        ]));
                      }
                      setState(() {
                        _rows = rows;
                        Navigator.of(context).pop();
                        showModal();
                      });
                    } catch (ex) {
                      ex.toString();
                    }
                    //Navigator.of(context).pop(); // Cierra el diálogo
                  },
                  child: const Text('Consultar'),
                ),
                const SizedBox(height: 16.0),
                // Aquí puedes colocar tu tabla para mostrar resultados

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
                DataTable(
                  columns: const [
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Cod Modular')),
                    DataColumn(label: Text('Nivel')),
                    /*
                    DataColumn(label: Text('Departamento')),
                    DataColumn(label: Text('Provincia')),
                    DataColumn(label: Text('Distrito')),

                     */

                  ],
                  rows: _rows,
                ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                rellenarDatos();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  /*
  ).then((val){
      Navigator.pop(context);
      print("CERRANDO ");
    });
   */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.titleEditStudent),
        ),
        drawer: const MenuLateral(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(60.0),
            child: Form(
              key: widget.keyForm,
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
            Icons.person,
            TextFormField(
              controller: widget.dniCtrl,
              decoration: const InputDecoration(
                labelText: 'DNI',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 8,
              readOnly: true,
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.dniParamValidateForm);
              },
            )),
        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombres',
              ),
              readOnly: true,
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.nameLastNameParamValidateForm);
              },
            )),
        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.fatherLastNameCtrl,
              decoration: const InputDecoration(
                labelText: 'Apellido Paterno',
              ),
              readOnly: true,
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.nameLastNameParamValidateForm);
              },
            )),
        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.motherLastNameCtrl,
              decoration: const InputDecoration(
                labelText: 'Apellido Materno',
              ),
              readOnly: true,
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.nameLastNameParamValidateForm);
              },
            )),
        /*
        HelpersView.formItemsDesign(
            Icons.location_city,
            TextFormField(
              controller: widget.departamentoform,
              decoration: const InputDecoration(
                labelText: 'Departamento',
              ),
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.departamentoValidateForm);
              },
            )),
        HelpersView.formItemsDesign(
            Icons.location_city,
            TextFormField(
              controller: widget.provinciaform,
              decoration: const InputDecoration(
                labelText: 'Provincia',
              ),
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.provinciaValidateForm);
              },
            )),
        HelpersView.formItemsDesign(
            Icons.location_city,
            TextFormField(
              controller: widget.distritoform,
              decoration: const InputDecoration(
                labelText: 'Distrito',
              ),
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.distritoValidateForm);
              },
            )),

         */

        HelpersView.formItemsDesign(
          Icons.person,
          TextFormField(
            controller: widget.nameIIEECtrl,
            decoration: const InputDecoration(
              labelText: 'Nombre IIEE',
            ),
            validator: (value) {
              return HelpersView.validateField(
                  value!, widget.nameIIEEParamValidateForm);
            },
            onTap: () {
              showModal();
            },
          ),
        ),

        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.codigoModular,
              decoration: const InputDecoration(
                labelText: 'Código Modular',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.codModularValidateForm);
              },
            )),

        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.levelCtrl,
              decoration: const InputDecoration(
                labelText: 'Nivel',
              ),
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.levelParamValidateForm);
              },
            )),

        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              readOnly: true,
              controller: widget.enrollmentDateCtrl,
              decoration: const InputDecoration(
                labelText: 'Fecha de Matrícula',
              ),
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.enrollmentDateParamValidateForm);
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023, 03, 01),
                  lastDate: DateTime(2023, 12, 31),
                );

                if (pickedDate != null) {
                  widget.enrollmentDateCtrl.text =
                      Helpers.formatDate('dd MM yyyy', pickedDate);
                }
              },
            )),
        HelpersView.formItemsDesign(
            Icons.person,
            TextFormField(
              controller: widget.codStudentCtrl,
              decoration: const InputDecoration(
                labelText: 'Código Estudiante',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 14,
              validator: (value) {
                return HelpersView.validateField(
                    value!, widget.codStudentParamValidateForm);
              },
            )),
        GestureDetector(
            onTap: () async {
              await save();
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
              child: const Text("Guardar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ))
      ],
    );
  }
}
