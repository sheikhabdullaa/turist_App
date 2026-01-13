import 'package:add_data_in__firestore/repo_class.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class EmplyScreen extends StatefulWidget {
  const EmplyScreen({super.key});

  @override
  State<EmplyScreen> createState() => _EmplyScreenState();
}

class _EmplyScreenState extends State<EmplyScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Employ',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Form',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
              ),
            ),
            Text(
              'Age',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: TextFormField(
                  controller: agecontroller,
                  decoration: InputDecoration(hintText: 'Age'),
                ),
              ),
            ),
            Text(
              'Location',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: TextFormField(
                  controller: locationcontroller,
                  decoration: InputDecoration(hintText: 'Loctation'),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> employinfomapp = {
                  'age': agecontroller.text,
                  'name': namecontroller.text,
                  'location': locationcontroller.text,
                  'id': id,
                };
                await authrepo().addemplydetail(employinfomapp, id).then((
                  value,
                ) {
                  Fluttertoast.showToast(
                    msg: "Detail uploaded successsfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                });
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
