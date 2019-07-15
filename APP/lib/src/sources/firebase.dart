import 'package:SAICCIX/src/mixins/feedModel.dart';
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
    await ref.child('conteudo').once().then((DataSnapshot snapshot) {
      model = RootModel.fromSnapshot(snapshot);
    });
    model.referencia = ref;
    return model;
  }

  Future<List<FeedModel>> getFeedData(DatabaseReference ref) async {
    FeedListModel model;
    ref = await FirebaseDatabase.instance.reference();
    await ref.child('conteudo/feed').once().then((DataSnapshot snapshot) {
      model = FeedListModel.fromSnapshot(snapshot);
    });
    return model.feed;
  }
  
  Future<void> setTokenSmartphone(DatabaseReference ref, String token) async {
    bool temchave = false;
    print('1');
    await ref.child('administracao').child('tokens').child(token).once().then((DataSnapshot snapshot){
      temchave = true;
      print(2);
    });
    if (!temchave)
      await ref.child('administracao').child('tokens').set(jsonEncode({token:token}));
    print(3);
  }
}
