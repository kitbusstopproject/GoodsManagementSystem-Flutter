import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LendingNfc extends StatefulWidget {
  const LendingNfc({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LendingNfcState createState() => _LendingNfcState();
}

class _LendingNfcState extends State<LendingNfc> {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  List<DocumentSnapshot> categoryList = [];

  @override
  void initState() {
    super.initState();
    _tagRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("貸出"),
      ),
      body: const Center(child: Text("貸出画面")),

      // body: Column(
      //     children: await category.map((document) {
      //   return ListTile(
      //     title: Text('${document['category']}'),

      //   );
      // }).toList()),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      Fluttertoast.showToast(msg: tag.data.toString());
    });
  }

  // Future<Map<String, dynamic>> getCategory() async {
  //   // Future<QueryDocumentSnapshot<Map<String, dynamic>>> getCategory() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   var category = await db.collection("category").get();

  //   for (var doc in category.docs) {
  //     debugPrint("${doc.id} => ${doc.data()}");
  //   }
  //   return category.docs[0].data();
  // }
}
