import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import '../mixins/rootModel.dart';

//request por HTTP
class FirebaseJson {
  Future<RootModel> getData() async {
    Response response = await get('https://saicix.firebaseio.com/.json');
    RootModel model = RootModel.fromJson(json.decode(response.body));
    return model;
  }
}

//request por API
class FirebaseDatabaseSnapshot {
  Future<RootModel> getData() async {
    DatabaseReference ref;
    RootModel model;
    ref = await FirebaseDatabase.instance.reference();
    await ref.once().then((DataSnapshot snapshot) {
      model = RootModel.fromSnapshot(snapshot);
    });
    ref = ref;
    return model;
  }
}
