class Medicine {
  late int id;
  late String nom;
  late String description;
  late DateTime date;
  late int temperature;
  late String type;
  late String etage; // Ajouter un champ pour l'étage
  late String userName; // Ajout de l'attribut pour le nom de l'utilisateur

  Medicine({
    required this.id,
    required this.nom,
    required this.description,
    required this.date,
    required this.temperature,
    required this.type,
    required this.etage, // Ajouter l'étage dans le constructeur
    required this.userName, // Ajout de l'attribut pour le nom de l'utilisateur

  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: int.parse(json['idMed']),
      nom: json['nomMed'],
      description: json['descmed'],
      date: DateTime.parse(json['dateEx']),
      temperature: int.parse(json['tempMin']),
      type: json['typeMed'],
      etage: json['nometage'], // Assumer que 'nometage' contient le nom de l'étage
      userName: json['username'], // Récupération du nom de l'utilisateur depuis JSON

    );
  }
}
