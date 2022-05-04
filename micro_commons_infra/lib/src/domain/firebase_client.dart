abstract class FirebaseClient {
  Future<void> sigIn();
  Future<void> signOut();
  Future<void> get(String path);
  Future<void> save({required String path, required dynamic data});
}