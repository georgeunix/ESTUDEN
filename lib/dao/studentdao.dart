import 'package:floor/floor.dart';
import 'package:student_maintenance/dao/model/student.dart';

@dao
abstract class StudentDao {
  @Query('SELECT * FROM Student LIMIT :perPage OFFSET :offset')
  Future<List<Student>> findStudent(int offset, int perPage);

  @Query('SELECT * FROM Student WHERE flagEdit = true AND flagSync = false')
  Future<List<Student>> findStudentEdited();

  @Query(
      "SELECT * FROM Student WHERE UPPER(departamento) = :depart AND UPPER(papellido)= :lastName AND dni= :dni")
  Future<List<Student>> findStudentByNameAndLastNameAndDni(
      String depart, String lastName, String dni);

  @Query(
      "SELECT * FROM Student WHERE UPPER(departamento) = :depart AND UPPER(papellido)= :lastName")
  Future<List<Student>> findStudentByNameAndLastName(
      String depart, String lastName);

  @Query(
      "SELECT * FROM Student WHERE UPPER(departamento) = :depart AND dni= :dni")
  Future<List<Student>> findStudentByDepartAndDni(
      String depart, String dni);

  @Query(
      "SELECT * FROM Student WHERE UPPER(papellido)= :lastName AND dni= :dni")
  Future<List<Student>> findStudentByLastNameAndDni(
      String lastName, String dni);

  @Query(
      "SELECT * FROM Student WHERE dni = :dni")
  Future<List<Student>> findStudentByDni(
      String dni);

  @Query(
      "SELECT * FROM Student WHERE UPPER(departamento) = :depart")
  Future<List<Student>> findStudentByDepart(
      String depart);

  @Query(
      "SELECT * FROM Student WHERE UPPER(papellido)= :lastName")
  Future<List<Student>> findStudentByLastName(
      String lastName);

  @Query('SELECT COUNT(*) FROM Student')
  Future<int?> totalStudent();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertStudent(Student student);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertStudents(List<Student> students);
}
