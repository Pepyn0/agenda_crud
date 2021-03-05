import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/my_app.dart';
import 'package:agenda_crud/app/view/contact_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {

	final _backend = ContactListBack();

	CircleAvatar circleAvatar(String url){
		try {
			return CircleAvatar(
				backgroundImage: NetworkImage(url),
			);
		} catch (e) {
			return CircleAvatar(
				child: Icon(Icons.person),
			);
		}
	}

	IconButton editButton(Function onPressed){
		return IconButton(
			icon: Icon(Icons.edit),
			onPressed: onPressed,
		);
	}

	IconButton removeButton(BuildContext context, Function remove) {
		return IconButton(
			icon: Icon(Icons.delete),
			onPressed: () {
				showDialog(
					context: context,
					builder: (context) => AlertDialog(
						title: Text('Excluir'),
						content: Text('Confirmar a Exclusão?'),
						actions: [
							FlatButton(
								child: Text('Não'),
								onPressed: () {
									Navigator.of(context).pop();
								},
							),
							FlatButton(
								child: Text('Sim'),
								onPressed: remove,
							)
						],
					)
				);
			},
		);
	}


	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Lista de Contatos'),
				actions: [
					IconButton(
						icon: Icon(Icons.add),
						onPressed: () {
							Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
						}
					),
				],
			),
			body: Observer(
				builder: (context) {
					return FutureBuilder(
						future: _backend.list,
						builder: (context, futuro) {
							if (!futuro.hasData) {
								return CircularProgressIndicator();
							} else {
								List<Contact> lista = futuro.data;
								return ListView.builder(
									itemCount: lista.length,
									itemBuilder: (context, i) {
										var contato = lista[i];
										return ListTile(
											leading: circleAvatar(contato.urlAvatar),
											title: Text(contato.nome),
											subtitle: Text(contato.telefone),
											trailing: Container(
												width: 100,
												child: Row(
													children: [
														editButton(() {
															_backend.goToForm(context, contato);
														}),
														removeButton(context, () {
															_backend.remove(contato.id);
															Navigator.of(context).pop();
														}),
													],
												),
											),
										);
									},
								);
							}
						}
					);
				}
			)
		);
	}
}
