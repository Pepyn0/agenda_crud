

final createTable = '''
	CREATE TABLE contact(
	id INT PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
	telefone CHAR(16) NOT NULL,
	url_avatar VARCHAR(300) NOT NULL
	)
''';

final insert = '''
	INSERT INTO contact(nome, telefone, url_avatar)
	VALUES('Pietro','(89) 9 8122-7555','https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png'),
				('Hortência','(11) 9 9562-3356','https://cdn.pixabay.com/photo/2021/01/24/09/28/girl-5944691_960_720.jpg'),
				('Maitê','(11) 9 9632-8578','https://cdn.pixabay.com/photo/2021/01/17/09/11/woman-5924366_960_720.jpg');
''';
