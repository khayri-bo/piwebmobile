import 'package:flutter/material.dart';
import 'package:medicinecasier/ApiService.dart';
import 'package:medicinecasier/Medicine.dart';

class MedicineListPage extends StatefulWidget {
  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  late Future<List<Medicine>> _medicinesFuture;

  @override
  void initState() {
    super.initState();
    _medicinesFuture = ApiService.fetchMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des médicaments'),
      ),
      body: FutureBuilder<List<Medicine>>(
        future: _medicinesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur de chargement'));
          } else {
            List<Medicine> medicines = snapshot.data!;
            return ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                Medicine medicine = medicines[index];
                return ListTile(
                  title: Text('Nom: ${medicine.nom}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description: ${medicine.description}'),
                      Text('Date: ${medicine.date}'),
                      Text('Température: ${medicine.temperature}'),
                      Text('Type: ${medicine.type}'),
                      Text('Étage: ${medicine.etage}'), // Afficher l'étage
                      Text('Nom Utilisateur: ${medicine.userName}'), // Affichage du nom de l'utilisateur

                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
