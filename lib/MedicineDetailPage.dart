import 'package:flutter/material.dart';
import 'package:medicinecasier/Medicine.dart';

class MedicineDetailPage extends StatelessWidget {
  final Medicine medicine;

  MedicineDetailPage({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du médicament'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom: ${medicine.nom}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Description: ${medicine.description}'),
            SizedBox(height: 10),
            Text('Date d\'expiration: ${medicine.date.toString()}'),
            SizedBox(height: 10),
            Text('Température: ${medicine.temperature}'),
            SizedBox(height: 10),
            Text('Type: ${medicine.type}'),
          ],
        ),
      ),
    );
  }
}
