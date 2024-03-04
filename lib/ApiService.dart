import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medicinecasier/Medicine.dart';

class ApiService {
  static const String baseURL = 'http://192.168.1.54/api_casier/';

  static Future<List<Medicine>> fetchMedicines() async {
    final response = await http.get(Uri.parse('$baseURL/get_medicaments.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Medicine> medicines = data.map((item) => Medicine.fromJson(item)).toList();
      return medicines;
    } else {
      throw Exception('Failed to load medicines');
    }
  }

  static Future<String> addMedicine(Map<String, dynamic> medicineData) async {
    final response = await http.post(
      Uri.parse('$baseURL/add_medicament.php'),
      body: medicineData,
    );

    if (response.statusCode == 200) {
      return "Médicament ajouté avec succès.";
    } else {
      throw Exception('Échec de l\'ajout du médicament.');
    }
  }


  static Future<List<String>> fetchMedicineTypes() async {
    final response = await http.get(Uri.parse('$baseURL/get_medicine_types.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<String> types = List<String>.from(data); // Convertir la liste dynamique en liste de chaînes de caractères
      return types;
    } else {
      throw Exception('Failed to load medicine types');
    }
  }


  static Future<List<String>> fetchEtages() async {
    final response = await http.get(Uri.parse('$baseURL/get_etages.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<String> etages = data.map((item) => item.toString()).toList();
      return etages;
    } else {
      throw Exception('Failed to load etages');
    }
  }

  static Future<List<String>> fetchUserNames() async {
    final response =
    await http.get(Uri.parse('$baseURL/get_user_names.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<String> userNames = data.map((item) => item.toString()).toList();
      return userNames;
    } else {
      throw Exception('Failed to load user names');
    }
  }


}