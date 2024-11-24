// import 'package:mongo_dart/mongo_dart.dart' as mmonge;
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
// import 'package:algolia/algolia.dart';
// import '../database/connection.dart';
import '../usecases/hive_utils.dart';
import 'dart:io';


@module
abstract class RegisterModule {

  @preResolve
  Future<HiveUtils> get hiveUtils => HiveUtils.init();

  @preResolve
  Future<Directory> get directory => getApplicationDocumentsDirectory();

  // @preResolve
  // Future<mmonge.Db> get mongodb => dbConnection();

  // @singleton
  // Algolia get algolia => const Algolia.init(
  //   apiKey: 'b51fe2bc242a0c7e9d6ba0ce6d03b082',
  //   applicationId: 'XG03L3VNPM',
  // );

  @lazySingleton
  http.Client get httpClient => http.Client();

}
