// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StudentDao? _studentDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Student` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `id_corte` TEXT, `ut` TEXT, `departamento` TEXT, `provincia` TEXT, `distrito` TEXT, `id_hogar` TEXT, `cod_hogar` TEXT, `id_persona` TEXT, `dni` TEXT, `nombre` TEXT, `papellido` TEXT, `sapellido` TEXT, `fnacimiento` TEXT, `genero` TEXT, `cod_estado_mo` TEXT, `estado_mo` TEXT, `cotejo` TEXT, `edad` TEXT, `cod_grado` TEXT, `descripcion` TEXT, `seccion` TEXT, `anio_matricula` TEXT, `c_modular` TEXT, `motivo_no_estudio` TEXT, `categoria_matricula` TEXT, `editDate` TEXT, `flagEdit` INTEGER, `syncDate` TEXT, `flagSync` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StudentDao get studentDao {
    return _studentDaoInstance ??= _$StudentDao(database, changeListener);
  }
}

class _$StudentDao extends StudentDao {
  _$StudentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _studentInsertionAdapter = InsertionAdapter(
            database,
            'Student',
            (Student item) => <String, Object?>{
                  'id': item.id,
                  'id_corte': item.id_corte,
                  'ut': item.ut,
                  'departamento': item.departamento,
                  'provincia': item.provincia,
                  'distrito': item.distrito,
                  'id_hogar': item.id_hogar,
                  'cod_hogar': item.cod_hogar,
                  'id_persona': item.id_persona,
                  'dni': item.dni,
                  'nombre': item.nombre,
                  'papellido': item.papellido,
                  'sapellido': item.sapellido,
                  'fnacimiento': item.fnacimiento,
                  'genero': item.genero,
                  'cod_estado_mo': item.cod_estado_mo,
                  'estado_mo': item.estado_mo,
                  'cotejo': item.cotejo,
                  'edad': item.edad,
                  'cod_grado': item.cod_grado,
                  'descripcion': item.descripcion,
                  'seccion': item.seccion,
                  'anio_matricula': item.anio_matricula,
                  'c_modular': item.c_modular,
                  'motivo_no_estudio': item.motivo_no_estudio,
                  'categoria_matricula': item.categoria_matricula,
                  'editDate': item.editDate,
                  'flagEdit':
                      item.flagEdit == null ? null : (item.flagEdit! ? 1 : 0),
                  'syncDate': item.syncDate,
                  'flagSync':
                      item.flagSync == null ? null : (item.flagSync! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Student> _studentInsertionAdapter;

  @override
  Future<List<Student>> findStudent(
    int offset,
    int perPage,
  ) async {
    return _queryAdapter.queryList('SELECT * FROM Student LIMIT ?2 OFFSET ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            id_corte: row['id_corte'] as String?,
            ut: row['ut'] as String?,
            departamento: row['departamento'] as String?,
            provincia: row['provincia'] as String?,
            distrito: row['distrito'] as String?,
            id_hogar: row['id_hogar'] as String?,
            cod_hogar: row['cod_hogar'] as String?,
            id_persona: row['id_persona'] as String?,
            dni: row['dni'] as String?,
            nombre: row['nombre'] as String?,
            papellido: row['papellido'] as String?,
            sapellido: row['sapellido'] as String?,
            fnacimiento: row['fnacimiento'] as String?,
            genero: row['genero'] as String?,
            cod_estado_mo: row['cod_estado_mo'] as String?,
            estado_mo: row['estado_mo'] as String?,
            cotejo: row['cotejo'] as String?,
            edad: row['edad'] as String?,
            cod_grado: row['cod_grado'] as String?,
            descripcion: row['descripcion'] as String?,
            seccion: row['seccion'] as String?,
            anio_matricula: row['anio_matricula'] as String?,
            c_modular: row['c_modular'] as String?,
            motivo_no_estudio: row['motivo_no_estudio'] as String?,
            categoria_matricula: row['categoria_matricula'] as String?,
            editDate: row['editDate'] as String?,
            flagEdit:
                row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0,
            syncDate: row['syncDate'] as String?,
            flagSync:
                row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [offset, perPage]);
  }

  @override
  Future<List<Student>> findStudentEdited() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE flagEdit = true AND flagSync = false',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            id_corte: row['id_corte'] as String?,
            ut: row['ut'] as String?,
            departamento: row['departamento'] as String?,
            provincia: row['provincia'] as String?,
            distrito: row['distrito'] as String?,
            id_hogar: row['id_hogar'] as String?,
            cod_hogar: row['cod_hogar'] as String?,
            id_persona: row['id_persona'] as String?,
            dni: row['dni'] as String?,
            nombre: row['nombre'] as String?,
            papellido: row['papellido'] as String?,
            sapellido: row['sapellido'] as String?,
            fnacimiento: row['fnacimiento'] as String?,
            genero: row['genero'] as String?,
            cod_estado_mo: row['cod_estado_mo'] as String?,
            estado_mo: row['estado_mo'] as String?,
            cotejo: row['cotejo'] as String?,
            edad: row['edad'] as String?,
            cod_grado: row['cod_grado'] as String?,
            descripcion: row['descripcion'] as String?,
            seccion: row['seccion'] as String?,
            anio_matricula: row['anio_matricula'] as String?,
            c_modular: row['c_modular'] as String?,
            motivo_no_estudio: row['motivo_no_estudio'] as String?,
            categoria_matricula: row['categoria_matricula'] as String?,
            editDate: row['editDate'] as String?,
            flagEdit:
                row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0,
            syncDate: row['syncDate'] as String?,
            flagSync: row['flagSync'] == null
                ? null
                : (row['flagSync'] as int) != 0));
  }

  @override
  Future<List<Student>> findStudentByNameAndLastNameAndDni(
    String depart,
    String lastName,
    String dni,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE UPPER(departamento) = ?1 AND UPPER(papellido)= ?2 AND dni= ?3',
        mapper: (Map<String, Object?> row) => Student(id: row['id'] as int?, id_corte: row['id_corte'] as String?, ut: row['ut'] as String?, departamento: row['departamento'] as String?, provincia: row['provincia'] as String?, distrito: row['distrito'] as String?, id_hogar: row['id_hogar'] as String?, cod_hogar: row['cod_hogar'] as String?, id_persona: row['id_persona'] as String?, dni: row['dni'] as String?, nombre: row['nombre'] as String?, papellido: row['papellido'] as String?, sapellido: row['sapellido'] as String?, fnacimiento: row['fnacimiento'] as String?, genero: row['genero'] as String?, cod_estado_mo: row['cod_estado_mo'] as String?, estado_mo: row['estado_mo'] as String?, cotejo: row['cotejo'] as String?, edad: row['edad'] as String?, cod_grado: row['cod_grado'] as String?, descripcion: row['descripcion'] as String?, seccion: row['seccion'] as String?, anio_matricula: row['anio_matricula'] as String?, c_modular: row['c_modular'] as String?, motivo_no_estudio: row['motivo_no_estudio'] as String?, categoria_matricula: row['categoria_matricula'] as String?, editDate: row['editDate'] as String?, flagEdit: row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0, syncDate: row['syncDate'] as String?, flagSync: row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [depart, lastName, dni]);
  }

  @override
  Future<List<Student>> findStudentByNameAndLastName(
    String depart,
    String lastName,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE UPPER(departamento) = ?1 AND UPPER(papellido)= ?2',
        mapper: (Map<String, Object?> row) => Student(id: row['id'] as int?, id_corte: row['id_corte'] as String?, ut: row['ut'] as String?, departamento: row['departamento'] as String?, provincia: row['provincia'] as String?, distrito: row['distrito'] as String?, id_hogar: row['id_hogar'] as String?, cod_hogar: row['cod_hogar'] as String?, id_persona: row['id_persona'] as String?, dni: row['dni'] as String?, nombre: row['nombre'] as String?, papellido: row['papellido'] as String?, sapellido: row['sapellido'] as String?, fnacimiento: row['fnacimiento'] as String?, genero: row['genero'] as String?, cod_estado_mo: row['cod_estado_mo'] as String?, estado_mo: row['estado_mo'] as String?, cotejo: row['cotejo'] as String?, edad: row['edad'] as String?, cod_grado: row['cod_grado'] as String?, descripcion: row['descripcion'] as String?, seccion: row['seccion'] as String?, anio_matricula: row['anio_matricula'] as String?, c_modular: row['c_modular'] as String?, motivo_no_estudio: row['motivo_no_estudio'] as String?, categoria_matricula: row['categoria_matricula'] as String?, editDate: row['editDate'] as String?, flagEdit: row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0, syncDate: row['syncDate'] as String?, flagSync: row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [depart, lastName]);
  }

  @override
  Future<List<Student>> findStudentByDepartAndDni(
    String depart,
    String dni,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE UPPER(departamento) = ?1 AND dni= ?2',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            id_corte: row['id_corte'] as String?,
            ut: row['ut'] as String?,
            departamento: row['departamento'] as String?,
            provincia: row['provincia'] as String?,
            distrito: row['distrito'] as String?,
            id_hogar: row['id_hogar'] as String?,
            cod_hogar: row['cod_hogar'] as String?,
            id_persona: row['id_persona'] as String?,
            dni: row['dni'] as String?,
            nombre: row['nombre'] as String?,
            papellido: row['papellido'] as String?,
            sapellido: row['sapellido'] as String?,
            fnacimiento: row['fnacimiento'] as String?,
            genero: row['genero'] as String?,
            cod_estado_mo: row['cod_estado_mo'] as String?,
            estado_mo: row['estado_mo'] as String?,
            cotejo: row['cotejo'] as String?,
            edad: row['edad'] as String?,
            cod_grado: row['cod_grado'] as String?,
            descripcion: row['descripcion'] as String?,
            seccion: row['seccion'] as String?,
            anio_matricula: row['anio_matricula'] as String?,
            c_modular: row['c_modular'] as String?,
            motivo_no_estudio: row['motivo_no_estudio'] as String?,
            categoria_matricula: row['categoria_matricula'] as String?,
            editDate: row['editDate'] as String?,
            flagEdit:
                row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0,
            syncDate: row['syncDate'] as String?,
            flagSync:
                row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [depart, dni]);
  }

  @override
  Future<List<Student>> findStudentByLastNameAndDni(
    String lastName,
    String dni,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE UPPER(papellido)= ?1 AND dni= ?2',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            id_corte: row['id_corte'] as String?,
            ut: row['ut'] as String?,
            departamento: row['departamento'] as String?,
            provincia: row['provincia'] as String?,
            distrito: row['distrito'] as String?,
            id_hogar: row['id_hogar'] as String?,
            cod_hogar: row['cod_hogar'] as String?,
            id_persona: row['id_persona'] as String?,
            dni: row['dni'] as String?,
            nombre: row['nombre'] as String?,
            papellido: row['papellido'] as String?,
            sapellido: row['sapellido'] as String?,
            fnacimiento: row['fnacimiento'] as String?,
            genero: row['genero'] as String?,
            cod_estado_mo: row['cod_estado_mo'] as String?,
            estado_mo: row['estado_mo'] as String?,
            cotejo: row['cotejo'] as String?,
            edad: row['edad'] as String?,
            cod_grado: row['cod_grado'] as String?,
            descripcion: row['descripcion'] as String?,
            seccion: row['seccion'] as String?,
            anio_matricula: row['anio_matricula'] as String?,
            c_modular: row['c_modular'] as String?,
            motivo_no_estudio: row['motivo_no_estudio'] as String?,
            categoria_matricula: row['categoria_matricula'] as String?,
            editDate: row['editDate'] as String?,
            flagEdit:
                row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0,
            syncDate: row['syncDate'] as String?,
            flagSync:
                row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [lastName, dni]);
  }

  @override
  Future<List<Student>> findStudentByDni(String dni) async {
    return _queryAdapter.queryList('SELECT * FROM Student WHERE dni = ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            id_corte: row['id_corte'] as String?,
            ut: row['ut'] as String?,
            departamento: row['departamento'] as String?,
            provincia: row['provincia'] as String?,
            distrito: row['distrito'] as String?,
            id_hogar: row['id_hogar'] as String?,
            cod_hogar: row['cod_hogar'] as String?,
            id_persona: row['id_persona'] as String?,
            dni: row['dni'] as String?,
            nombre: row['nombre'] as String?,
            papellido: row['papellido'] as String?,
            sapellido: row['sapellido'] as String?,
            fnacimiento: row['fnacimiento'] as String?,
            genero: row['genero'] as String?,
            cod_estado_mo: row['cod_estado_mo'] as String?,
            estado_mo: row['estado_mo'] as String?,
            cotejo: row['cotejo'] as String?,
            edad: row['edad'] as String?,
            cod_grado: row['cod_grado'] as String?,
            descripcion: row['descripcion'] as String?,
            seccion: row['seccion'] as String?,
            anio_matricula: row['anio_matricula'] as String?,
            c_modular: row['c_modular'] as String?,
            motivo_no_estudio: row['motivo_no_estudio'] as String?,
            categoria_matricula: row['categoria_matricula'] as String?,
            editDate: row['editDate'] as String?,
            flagEdit:
                row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0,
            syncDate: row['syncDate'] as String?,
            flagSync:
                row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [dni]);
  }

  @override
  Future<List<Student>> findStudentByDepart(String depart) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE UPPER(departamento) = ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            id_corte: row['id_corte'] as String?,
            ut: row['ut'] as String?,
            departamento: row['departamento'] as String?,
            provincia: row['provincia'] as String?,
            distrito: row['distrito'] as String?,
            id_hogar: row['id_hogar'] as String?,
            cod_hogar: row['cod_hogar'] as String?,
            id_persona: row['id_persona'] as String?,
            dni: row['dni'] as String?,
            nombre: row['nombre'] as String?,
            papellido: row['papellido'] as String?,
            sapellido: row['sapellido'] as String?,
            fnacimiento: row['fnacimiento'] as String?,
            genero: row['genero'] as String?,
            cod_estado_mo: row['cod_estado_mo'] as String?,
            estado_mo: row['estado_mo'] as String?,
            cotejo: row['cotejo'] as String?,
            edad: row['edad'] as String?,
            cod_grado: row['cod_grado'] as String?,
            descripcion: row['descripcion'] as String?,
            seccion: row['seccion'] as String?,
            anio_matricula: row['anio_matricula'] as String?,
            c_modular: row['c_modular'] as String?,
            motivo_no_estudio: row['motivo_no_estudio'] as String?,
            categoria_matricula: row['categoria_matricula'] as String?,
            editDate: row['editDate'] as String?,
            flagEdit:
                row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0,
            syncDate: row['syncDate'] as String?,
            flagSync:
                row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [depart]);
  }

  @override
  Future<List<Student>> findStudentByLastName(String lastName) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Student WHERE UPPER(papellido)= ?1',
        mapper: (Map<String, Object?> row) => Student(
            id: row['id'] as int?,
            id_corte: row['id_corte'] as String?,
            ut: row['ut'] as String?,
            departamento: row['departamento'] as String?,
            provincia: row['provincia'] as String?,
            distrito: row['distrito'] as String?,
            id_hogar: row['id_hogar'] as String?,
            cod_hogar: row['cod_hogar'] as String?,
            id_persona: row['id_persona'] as String?,
            dni: row['dni'] as String?,
            nombre: row['nombre'] as String?,
            papellido: row['papellido'] as String?,
            sapellido: row['sapellido'] as String?,
            fnacimiento: row['fnacimiento'] as String?,
            genero: row['genero'] as String?,
            cod_estado_mo: row['cod_estado_mo'] as String?,
            estado_mo: row['estado_mo'] as String?,
            cotejo: row['cotejo'] as String?,
            edad: row['edad'] as String?,
            cod_grado: row['cod_grado'] as String?,
            descripcion: row['descripcion'] as String?,
            seccion: row['seccion'] as String?,
            anio_matricula: row['anio_matricula'] as String?,
            c_modular: row['c_modular'] as String?,
            motivo_no_estudio: row['motivo_no_estudio'] as String?,
            categoria_matricula: row['categoria_matricula'] as String?,
            editDate: row['editDate'] as String?,
            flagEdit:
                row['flagEdit'] == null ? null : (row['flagEdit'] as int) != 0,
            syncDate: row['syncDate'] as String?,
            flagSync:
                row['flagSync'] == null ? null : (row['flagSync'] as int) != 0),
        arguments: [lastName]);
  }

  @override
  Future<int?> totalStudent() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM Student',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<void> insertStudent(Student student) async {
    await _studentInsertionAdapter.insert(student, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertStudents(List<Student> students) async {
    await _studentInsertionAdapter.insertList(
        students, OnConflictStrategy.replace);
  }
}
