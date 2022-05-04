import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/domain.dart';

class FirebaseAdapter implements FirebaseClient {
  final FirebaseFirestore fireStoreClient;

  FirebaseAdapter({
    required this.fireStoreClient
  });


  @override
  Future<void> save({required String path, required dynamic data}) async {
    fireStoreClient.doc(path).set(data);
  }

  @override
  Future<void> get(String path) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> sigIn() {
    // TODO: implement sigIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}