import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final String content;
  final String userId;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['name'] != null),
        assert(map['content'] != null),
        assert(map['userId'] != null),
        name = map['name'],
        content = map['content'],
        userId = map['userId'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$content:$userId>";
}
