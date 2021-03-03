import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
	final lista = [
		{'nome': 'Pietro', 'telefone': '(89) 9 8122-7555', 'avatar': 'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png'},
		{'nome': 'Amanda', 'telefone': '(89) 9 8107-2723', 'avatar': 'https://cdn.pixabay.com/photo/2021/02/15/08/17/woman-6016988_960_720.jpg'},
		{'nome': 'Maria', 'telefone': '(89) 9 8133-4567', 'avatar': 'https://cdn.pixabay.com/photo/2021/02/06/09/25/woman-5987609_960_720.jpg'},
	];

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
			body: ListView.builder(
				itemCount: lista.length,
				itemBuilder: (context, i) {
					var contato = lista[i];
					var avatar = CircleAvatar(
						backgroundImage: NetworkImage(contato['avatar']),
					);
					return ListTile(
						leading: avatar,
						title: Text(contato['nome']),
						subtitle: Text(contato['telefone']),
						trailing: Container(
							width: 100,
							child: Row(
								children: [
									IconButton(icon: Icon(Icons.edit), onPressed: null),
									IconButton(icon: Icon(Icons.delete), onPressed: null),
								],
								),
						),
						);
				},
			),
		);
	}
}