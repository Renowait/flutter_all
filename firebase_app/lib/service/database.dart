import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static Database instance = Database._();

 Database._();//เป็นการสร้าง คอนสตรกเตอร์แบบไพรเวท

  Future <List> getAllData() async{
    //กำหนดตัวแปรอ้างอิงไปยังข้อมูล
    final reference = FirebaseFirestore.instance.collection('products');
    //กำหนดการคิวรีข้อมูลตาม id ผ่านตัวแปรอ้งอิง
    Query query = reference.orderBy('id');
    //ขอรายการข้อมูลตามเงื่อนไขที่กำหนด ในรูปแบบของ snapshot 
    final snapshots = query.snapshots();
    //
    return snapshots.map(
      (snapshot){
        return snapshot.docs.map(
          (doc){
            if (doc.exists){
              return doc.data();
            }
          }
        );
      }
    ).toList();
  }
}