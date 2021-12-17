import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:flutter_application_1/domain/controller/Firestorecontroller.dart';
import 'package:flutter_application_1/domain/controller/textcontroller.dart';
import 'package:flutter_application_1/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final FirebaseController firebaseController = Get.find();
  final AuthController authController = Get.find();
  @override
  void initState() {
    firebaseController.suscribeUpdates();
    super.initState();
  }

  @override
  void dispose() {
    firebaseController.unsuscribeUpdates();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => ListView.builder(
              itemCount: firebaseController.entries.length,
              padding: EdgeInsets.only(top: 20.0),
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(context, firebaseController.entries[index]);
              }),
        ),
        backgroundColor: Colors.grey.shade900,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
          onPressed: () {
            addBaby(context);
          },
        ));
  }

  Widget _buildItem(BuildContext context, Record record) {
    return Padding(
      key: ValueKey(record.name),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Card(
          color: Colors.grey[800],
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle, size: 40,color: Colors.grey[400],),
              title: Text(record.name, style: TextStyle(color: Colors.grey[300]),),
              subtitle: Text(record.content,  style: TextStyle(color: Colors.grey[200])),
            )
          ],
          
        )),
      ),
    );
  }

  Future<void> addBaby(BuildContext context) async {
    getName(context).then((value) {
      firebaseController.addEntry(authController.userEmail(),value);
    });
  }

  Future<String> getName(BuildContext context) async {
    String? result = await prompt(
      context,
      title: Text('Adding a post'),
      initialValue: '',
      textOK: Text('Ok'),
      textCancel: Text('Cancel'),
      hintText: 'comment',
      minLines: 1,
      autoFocus: true,
      obscureText: false,
      textCapitalization: TextCapitalization.words,
    );
    if (result != null) {
      return Future.value(result);
    }
    return Future.error('cancel');
  }
}
