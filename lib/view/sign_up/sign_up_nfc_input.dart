import 'package:flutter/material.dart';
import 'package:goodsmanagementsystem/firebase/create_firestore.dart';
import 'package:goodsmanagementsystem/firebase/get_firestore.dart';
import 'package:goodsmanagementsystem/view/sign_up/sign_up_nfc.dart';

// ignore: must_be_immutable
class SignUpNfcInput extends StatefulWidget {
  const SignUpNfcInput({Key? key}) : super(key: key);

  @override
  State<SignUpNfcInput> createState() => _SignUpNfcInputState();
}

class _SignUpNfcInputState extends State<SignUpNfcInput> {
  var goodsIdController = TextEditingController();
  var goodsNameController = TextEditingController();
  var makerNameController = TextEditingController();
  var modelNumberController = TextEditingController();
  var supplierController = TextEditingController();

  static var goodsName = "";
  static var makerName = "";
  static var modelNumber = "";
  static var supplier = "";

  String isSelectedItem = GetFireStore.categories.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("物品登録"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: goodsNameController,
                  decoration: const InputDecoration(
                    labelText: '物品名',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: makerNameController,
                  decoration: const InputDecoration(
                    labelText: 'メーカー',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: modelNumberController,
                  decoration: const InputDecoration(
                    labelText: '型番',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: supplierController,
                  decoration: const InputDecoration(
                    labelText: '購入元',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButton(
                  items: GetFireStore.categories
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: isSelectedItem,
                  onChanged: (String? value) {
                    setState(() {
                      isSelectedItem = value!;
                      debugPrint(isSelectedItem);
                    });
                  },
                ),
                const SizedBox(height: 20),
                FilledButton(
                    onPressed: () async {
                      goodsName = goodsNameController.text;
                      makerName = makerNameController.text;
                      modelNumber = modelNumberController.text;
                      supplier = supplierController.text;
                      await CreateFireStore.addItem(isSelectedItem, goodsName, makerName, modelNumber,
                          supplier);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpNfc(
                                  goodsId: CreateFireStore.itemId,
                                  goodsName: goodsName,
                                  makerName: makerName,
                                  modelNumber: modelNumber,
                                  supplier: supplier,
                                  category: isSelectedItem,
                                )),
                      );
                    },
                    child: const Text('情報登録')),
              ],
            )));
  }
}
