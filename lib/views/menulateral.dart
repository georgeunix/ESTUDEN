import 'package:flutter/material.dart';
import 'package:student_maintenance/dao/model/student.dart';
import 'package:student_maintenance/views/form.dart';
import 'package:student_maintenance/views/list.dart';
import 'package:student_maintenance/views/search.dart';
import 'package:student_maintenance/views/synchronization.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuLateral();
  }
}

class _MenuLateral extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Edición de Alumnos",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: 'RobotoMono'),
            ),
            accountEmail: Text(
              "",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
            decoration: BoxDecoration(color: Color.fromRGBO(0, 51, 150, 210)),
          ),
          /*Ink(
            color: Colors.indigo,
            child:*/
          ListTile(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentsList(List.empty()),
                  ));
            },
            hoverColor: Colors.blueAccent,
            tileColor: const Color.fromRGBO(0, 51, 150, 210),
            title: const Text("Listar Alumnos",
                style: TextStyle(fontSize: 18, color: Colors.grey)),
          ),
          ListTile(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchStudent(),
                  ));
            },
            hoverColor: Colors.blueAccent,
            tileColor: const Color.fromRGBO(0, 51, 150, 210),
            title: const Text("Buscador estudiantes",
                style: TextStyle(fontSize: 18, color: Colors.grey)),
          ),
          ListTile(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Synchronization(),
                  ));
            },
            hoverColor: Colors.blueAccent,
            tileColor: const Color.fromRGBO(0, 51, 150, 210),
            title: const Text("Sincronizar",
                style: TextStyle(fontSize: 18, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
