// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:padel/core/injection/register_firebase.dart' as _i559;
import 'package:padel/core/injection/register_module.dart' as _i630;
import 'package:padel/core/usecases/hive_utils.dart' as _i313;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final registerFirebase = _$RegisterFirebase();
    await gh.factoryAsync<_i313.HiveUtils>(
      () => registerModule.hiveUtils,
      preResolve: true,
    );
    await gh.factoryAsync<_i497.Directory>(
      () => registerModule.directory,
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerFirebase.auth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerFirebase.firestore);
    gh.lazySingleton<_i519.Client>(() => registerModule.httpClient);
    return this;
  }
}

class _$RegisterModule extends _i630.RegisterModule {}

class _$RegisterFirebase extends _i559.RegisterFirebase {}
