import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService{
	var _dao = GetIt.I.get<ContactDAO>();
	// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
	void save(Contact contact){
		validateName(contact.nome);
		validatePhone(contact.telefone);
		_dao.save(contact);
	}

	void remove(int id){
	_dao.remove(id);
	}

	Future<List<Contact>> find(){
		return _dao.find();
	}
	// nome → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50 
	void validateName(String name){
		var min = 3; 
		var max = 50; 

		if(name == null){
			throw new DomainLayerException('O nome é obrigatório.');
		}else if(name.length < min){
			throw new DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
		}else if(name.length > max){
			throw new DomainLayerException('O nome deve possuir no máximo $max caracteres.');
		}
	}

	// telefone → seja obrigatório e tenha o formato (99) 9 9999-9999 
	void validatePhone(String phone){
		var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
		if(phone == null){
			throw new DomainLayerException('O telefone é obrigatório.');
		}else if(!format.hasMatch(phone)){
			throw new DomainLayerException('Formato inválido. O formato deve ser (99) 9 9999-9999.');
		}
	}
}