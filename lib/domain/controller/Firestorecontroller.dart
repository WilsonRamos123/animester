import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class FirebaseController extends GetxController {
  var _records = <Record>[].obs;
  final CollectionReference post =
      FirebaseFirestore.instance.collection('post');
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('post').snapshots();
  late StreamSubscription<Object?> streamSubscription;

  suscribeUpdates() async {
    logInfo('suscribeLocationUpdates');
    streamSubscription = _usersStream.listen((event) {
      logInfo('Got new item from fireStore');
      _records.clear();
      event.docs.forEach((element) {
        _records.add(Record.fromSnapshot(element));
      });
      print('Got ${_records.length}');
    });
  }

  unsuscribeUpdates() {
    streamSubscription.cancel();
  }

  List<Record> get entries => _records;

  addEntry(name, content) {
    post
        .add({'name': name, 'content': content, 'userId':name+"00"})
        .then((value) => print("post added"))
        .catchError((onError) => print("Failed to add post $onError"));
  }

  updateEntry(Record record) {
    record.reference.update({'content': record.content + '1'});
  }

  deleteEntry(Record record) {
    record.reference.delete();
  }
  
}
