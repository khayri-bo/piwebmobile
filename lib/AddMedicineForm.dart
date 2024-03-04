import 'package:flutter/material.dart';

class AddMedicineForm extends StatefulWidget {
  @override
  _AddMedicineFormState createState() => _AddMedicineFormState();
}

class _AddMedicineFormState extends State<AddMedicineForm> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _dateController;
  late TextEditingController _temperatureController;
  late TextEditingController _typeController;
  late TextEditingController _etageController;
  late TextEditingController _userNameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _dateController = TextEditingController();
    _temperatureController = TextEditingController();
    _typeController = TextEditingController();
    _etageController = TextEditingController();
    _userNameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _temperatureController.dispose();
    _typeController.dispose();
    _etageController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Envoyer les données au backend et traiter la réponse ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un médicament'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nom du médicament'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              TextFormField(
                controller: _temperatureController,
                decoration: InputDecoration(labelText: 'Température'),
              ),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type'),
              ),
              TextFormField(
                controller: _etageController,
                decoration: InputDecoration(labelText: 'Étage'),
              ),
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
