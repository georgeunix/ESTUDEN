import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:student_maintenance/views/search.dart';

import '../database/database.dart';
import '../utils/constants.dart';
//Queda en desuso
class UploadFile extends StatefulWidget {

  final _appDatabase = GetIt.I.get<AppDatabase>();

  GlobalKey<FormState> keyForm = GlobalKey();
  String? filePath = '';

  UploadFile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UploadFile();
  }

}

class _UploadFile extends State<UploadFile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.titleUploadFile),
        ),
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
        GestureDetector(
            onTap: () async {
              String? filePath = await _pickFile();
              if (filePath != null) {
                _readFile(filePath);
              }
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
              child: const Text("Subir Archivo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ))
      ],
    );
  }

  Future<String?> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        widget.filePath = result.files.single.path!;
      });

      return widget.filePath;
    }

    return null;
  }

  Future<void> _readFile(String filePath) async {
    try {
      File file = File(filePath);
      String dataLoaded = await file.readAsString();
      if(dataLoaded.isNotEmpty && dataLoaded!=null) {
        //await widget._appDatabase.loadInitialData(dataLoaded);
        navigateList();
      }
    } catch (e) {
      displayDialog("Mensaje Informativo", "Algo salió mal al cargar los datos del archivo.");
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

  void navigateList() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchStudent(),
        ));
  }
}