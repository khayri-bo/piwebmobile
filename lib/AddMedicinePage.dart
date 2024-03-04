import 'package:flutter/material.dart';
import 'package:medicinecasier/ApiService.dart';

class AddMedicinePage extends StatefulWidget {
  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomController;
  late TextEditingController _descriptionController;
  late TextEditingController _dateController;
  late TextEditingController _temperatureController;
  String _selectedType = ''; // Valeur initiale unique pour le type
  String _selectedEtage = ''; // Valeur initiale unique pour l'étage
  String _selectedUserName = ''; // Valeur initiale unique pour le nom d'utilisateur
  List<String> _types = [];
  List<String> _etages = [];
  List<String> _userNames = [];

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController();
    _descriptionController = TextEditingController();
    _dateController = TextEditingController();
    _temperatureController = TextEditingController();
    _fetchDropdownData();
  }

  Future<void> _fetchDropdownData() async {
    _types = await ApiService.fetchMedicineTypes();
    _etages = await ApiService.fetchEtages();
    _userNames = await ApiService.fetchUserNames();

    // Assurez-vous que les listes ne sont pas vides avant d'initialiser les valeurs sélectionnées
    if (_types.isNotEmpty) {
      _selectedType = _types[0];
    }
    if (_etages.isNotEmpty) {
      _selectedEtage = _etages[0];
    }
    if (_userNames.isNotEmpty) {
      _selectedUserName = _userNames[0];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: 'Nom Medicament'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du médicament.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la date.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _temperatureController,
                decoration: InputDecoration(labelText: 'Température'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la température.';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedType = newValue!;
                  });
                },
                items: _types.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Type de médicament'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner un type de médicament.';
                  }
                  return null;
                },
              ),

              DropdownButtonFormField<String>(
                value: _selectedEtage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedEtage = newValue!;
                  });
                },
                items: _etages.map((String etage) {
                  return DropdownMenuItem<String>(
                    value: etage,
                    child: Text(etage),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Étage'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner un étage.';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedUserName,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUserName = newValue!;
                  });
                },
                items: _userNames.map((String userName) {
                  return DropdownMenuItem<String>(
                    value: userName,
                    child: Text(userName),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Nom Utilisateur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner un nom d\'utilisateur.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final medicineData = {
                      'nomMed': _nomController.text,
                      'descMed': _descriptionController.text,
                      'dateMed': _dateController.text,
                      'temperature': _temperatureController.text,
                      'type': _selectedType,
                      'idEtage': _selectedEtage,
                      'idUser': _selectedUserName,
                    };
                    ApiService.addMedicine(medicineData).then((response) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(response),
                        ),
                      );
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Échec de l\'ajout du médicament.'),
                        ),
                      );
                    });
                  }
                },
                child: Text('Ajouter'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _temperatureController.dispose();
    super.dispose();
  }
}
