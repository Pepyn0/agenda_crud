import 'package:agenda_crud/app/domain/entities/contact.dart';

abstract class ContactDAO {

	void save(Contact contact);

	void remove(int id);

	Future<List<Contact>> find();
}