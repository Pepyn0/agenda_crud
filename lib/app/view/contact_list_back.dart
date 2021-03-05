
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contact_service.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

//flutter packages pub run build_runner watch

abstract class _ContactListBack with Store{
	var _service = GetIt.I.get<ContactService>();
	//lista de contatos
	@observable
	Future<List<Contact>> list;

	//método para atualizar a lista de contatos
	@action
	void refreshList([dynamic value]){
		list = _service.find();
	}

	_ContactListBack(){
		refreshList();// Atuslizar a lista quando o método for construido
	}

	//método para chamar o form salvar/alterar
	void goToForm(BuildContext context, [Contact contact]) {
		Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);
	}

	//excluir
	void remove(int id){
		_service.remove(id);
		refreshList();
	}
}
