import 'package:flutter/material.dart';
import 'package:student_maintenance/dao/model/student.dart';
import 'package:student_maintenance/views/form.dart';
import 'package:student_maintenance/views/utils/helpersview.dart';

class StudentWidget extends StatefulWidget {
  final Student student;
  int index;

  StudentWidget(this.student, this.index, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentWidget();
  }
}

class _StudentWidget extends State<StudentWidget> {

  void navigateList() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(widget.student),
        ));
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5.0),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              if(widget.student.flagEdit!) {
                displayDialog("Mensaje Informativo", "El registro del estudiante ${widget.student.nombre} ${widget.student.papellido} ${widget.student.sapellido} que has seleccionado ha sido editado anteriormente.");
              } else {
                navigateList();
              }
            },
            child: Row(
              children: <Widget>[
                HelpersView.column(widget.student.id_persona.toString(), widget.student.flagEdit, widget.student.flagSync),
                HelpersView.column(
                    "${widget.student.nombre} "
                        " ${widget.student.papellido} "
                        " ${widget.student.sapellido}",
                    widget.student.flagEdit, widget.student.flagSync),
                HelpersView.column(widget.student.dni, widget.student.flagEdit, widget.student.flagSync),
                HelpersView.column(widget.student.departamento, widget.student.flagEdit, widget.student.flagSync),
                HelpersView.column(widget.student.editDate.toString(), widget.student.flagEdit, widget.student.flagSync),
                //HelpersView.column(widget.student.syncDate.toString(), widget.student.flagEdit, widget.student.flagSync),
              ],
            ),
          ),
        ),
    );
  }
}
