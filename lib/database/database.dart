import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:student_maintenance/dao/model/student.dart';
import 'package:student_maintenance/dao/studentdao.dart';
import 'package:student_maintenance/utils/cypher.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Student])
abstract class AppDatabase extends FloorDatabase {
  StudentDao get studentDao;
  Future<void> loadInitialData() async {
    int? totalLimitStudent = await studentDao.totalStudent();
    if(totalLimitStudent == 0) {
      final dataLoaded = await Cypher.decryptFile();
      var lines = dataLoaded.split("\n").toList();
      List<Student> students = List.empty(growable: true);
      try {
        for (var line in lines) {
          var arrayStudent = line.split(",");
          if(arrayStudent.length == 25) {
            var student = Student();
            student.id_corte = arrayStudent[0];
            student.ut = arrayStudent[1];
            student.departamento = arrayStudent[2];
            student.provincia = arrayStudent[3];
            student.distrito = arrayStudent[4];
            student.id_hogar = arrayStudent[5];
            student.cod_hogar = arrayStudent[6];
            student.id_persona = arrayStudent[7];
            student.dni = arrayStudent[8];
            student.nombre = arrayStudent[9];
            student.papellido = arrayStudent[10];
            student.sapellido = arrayStudent[11];
            student.fnacimiento = arrayStudent[12];
            student.genero = arrayStudent[13];
            student.cod_estado_mo = arrayStudent[14];
            student.estado_mo = arrayStudent[15];
            student.cotejo = arrayStudent[16];
            student.edad = arrayStudent[17];
            student.cod_grado = arrayStudent[18];
            student.descripcion = arrayStudent[19];
            student.seccion = arrayStudent[20];
            student.anio_matricula = arrayStudent[21];
            student.c_modular = arrayStudent[22];
            student.motivo_no_estudio = arrayStudent[23];
            student.categoria_matricula = arrayStudent[24];
            student.editDate = "0/0/0";
            student.flagEdit = false;
            student.syncDate = "0/0/0";
            student.flagSync = false;
            students.add(student);
          }
        }
        await studentDao.insertStudents(students);
      } catch (e) {
        print('Ocurrió un error al leer el archivo: $e');
      }
    }
  }
}