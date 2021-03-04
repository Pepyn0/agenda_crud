import 'package:agenda_crud/app/data/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

void setupInjection() {
	GetIt getIt = GetIt.I;


	getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
}
