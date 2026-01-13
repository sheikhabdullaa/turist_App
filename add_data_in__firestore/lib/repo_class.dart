import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class authrepo {
  Future addemplydetail(Map<String, dynamic> employinfomapp, String id) async {
    await FirebaseFirestore.instance
        .collection('employ')
        .doc(id)
        .set(employinfomapp);
  }
}
 