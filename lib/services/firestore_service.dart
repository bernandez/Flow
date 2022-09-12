import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot>> getFlowData(

    //TODO: properly implement data getting
      String location) async {
    QuerySnapshot snapshot = await _firestore.collection("bambili").get();

    List<QueryDocumentSnapshot> documents = snapshot.docs;

    return documents;
  }

  Stream<QuerySnapshot> getFlowDataStream(
     String location) {

        
    //TODO: properly implement data stream getting
   Stream<QuerySnapshot> stream = _firestore.collection(location).snapshots();
   return stream;
    
  }

  void likeSourceLocation(String location, String docId) async{
    //TODO: implement like functionality
  
    //get current number of likes

  DocumentSnapshot docs = await  _firestore.collection(location).doc(docId).get();
    
    Map<String, dynamic> addLike = {"likes": 1} ;
}
  


}
