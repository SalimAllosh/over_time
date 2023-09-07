import 'package:get_it/get_it.dart';
import 'package:over_time/Core/Database/database.dart';
import 'package:over_time/Features/Authentication/blocs/bio_auth_cubit.dart';
import 'package:over_time/Features/InstituteDash/DataLayer/DataSrc/local_database.dart';
import 'package:over_time/Features/InstituteDash/DataLayer/Repositories/session_repository.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/Repositories/session_repository.dart';
import 'package:over_time/Features/InstituteDash/DomainLayer/UseCases/Session/get_all_sessions.dart';

final sl = GetIt.instance;

Future<void> dependincyInit() async {
  //blocs
  sl.registerFactory(() => BioAuthCubit());

  //usecase

  sl.registerLazySingleton(
      () => GetAllSessionsUsecase(sessionRepository: sl()));

  //repo
  sl.registerLazySingleton<SessionRepository>(
      () => SessionRepositoryDL(localDatabase: sl()));

  //local
  sl.registerLazySingleton(() => LocalDatabase(database: sl()));

  //.............

  sl.registerLazySingleton(() => DatabaseHelper.instance);
}
