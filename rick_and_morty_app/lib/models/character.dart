//tratando os dados da api

class Character {
  final int id;
  final String name;
  final String status;
  final String image;

  Character({ //a chave faz com que os parametros sejam nao posicionais
    required this.id,
    required this.name,
    required this.status,
    required this.image
  });

  factory Character.fromJson(Map<String, dynamic> json){
    return Character(id: json['id'], 
    name: json['name'], 
    status: json['status'], 
    image: json['image'],
    );
  }

}