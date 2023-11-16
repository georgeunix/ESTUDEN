import 'package:animated_infinite_scroll_pagination/animated_infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';
import 'package:student_maintenance/viewmodels/student_viewmodels.dart';
import 'package:student_maintenance/views/studentwidget.dart';
import 'package:student_maintenance/views/utils/helpersview.dart';

import '../dao/model/student.dart';
import '../utils/constants.dart';
import 'menulateral.dart';

class StudentsList extends StatefulWidget {
  List<Student> students = List.empty(growable: true);

  StudentsList(this.students, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentsList();
  }
}

class _StudentsList extends State<StudentsList> {
  var viewModel;
  String title = "Listar Alumnos";
  int page = 1;

  @override
  void initState() {
    viewModel = StudentViewModel(widget.students);
    // TODO: implement initState
    super.initState();
    viewModel
      ..listen()
      ..getPaginationList();
  }

  @override
  void dispose() {
    viewModel.dispose();
    page = 10;
    super.dispose();
  }

  Widget headerTable() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          HelpersView.headerColumn("CODIGO DE ESTUDIANTE"),
          HelpersView.headerColumn("NOMBRES"),
          HelpersView.headerColumn("DNI"),
          HelpersView.headerColumn("UBIGEO"), //UBIGEO Y PONER PRIMERO
          HelpersView.headerColumn("EDITADO"),
          //HelpersView.headerColumn("SINCRONIZADO"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.titleListStudent),
        ),
        drawer: const MenuLateral(),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: AnimatedInfiniteScrollView<Student>(
              viewModel: viewModel,
              itemBuilder: (context, index, item) => StudentWidget(item, index),
              refreshIndicator: true,
              topWidget: headerTable(),
            )),
      ),
    );
  }
}
