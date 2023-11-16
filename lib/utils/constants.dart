class Constants {
  static const String formatDate = "dd/MM/yyyy";
  static const String path = 'assets/data.txt';
  static const String titleEditStudent = 'Editar estudiantes';
  static const String titleListStudent = 'Listado de estudiantes';
  static const String titleSearchStudent = 'Buscador estudiantes';
  static const String titleUploadFile = 'Configuración estudiantes';
  static const String titleSynchronization = 'Sincronizar estudiantes';
  static const String buttonSynchronization = 'Sincronizar';
  static const String patternNameLastName = r'(^[a-zñA-ZÑ ]*$)';
  static const String patternDepart = r'(^[a-zA-Z ]*$)';
  static const String patternDni = r'(^[0-9]{8,9}$)';
  static const String patternAge = r'(^[0-9]{1,2}$)';
  static const String patternDegree = r'(^[0-9]{1,2}$)';
  static const String patternLevel = r'(^[a-zA-Z ]*$)';
  static const String patternNameIIEE = r'(^[a-zñA-ZÑ ]*$)';
  static const String patternEnrollmentDate = r'(^2\d{3}$)';
  //static const String patternCodStudent = r'(^[0-9]{1,15}$)';
  static const String patternCodStudent = r'(^[0-9]{14,15}$)';
  static const String patternCodModularStudent = r'(^[0-9]{7,12}$)';

  static const List<String> departments = [
    "<Seleccionar>",
    "Amazonas",
    "Ancash",
    "Apurimac",
    "Arequipa",
    "Ayacucho",
    "Cajamarca",
    "Callao",
    "Cusco",
    "Huancavelica",
    "Huanuco",
    "Ica",
    "Junín",
    "La Libertad",
    "Lambayeque",
    "Lima",
    "Loreto",
    "Madre de Dios",
    "Moquegua",
    "Pasco",
    "Piura",
    "Puno",
    "San Martín",
    "Tacna",
    "Tumbes"
  ];
}
