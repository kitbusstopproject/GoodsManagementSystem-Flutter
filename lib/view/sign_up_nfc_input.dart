import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodsmanagementsystem/firebase/getFireStore.dart';
import 'package:goodsmanagementsystem/view/sign_up_nfc.dart';

// ignore: must_be_immutable
class SignUpNfcInput extends StatefulWidget {
  SignUpNfcInput({Key? key}) : super(key: key);

  @override
  State<SignUpNfcInput> createState() => _SignUpNfcInputState();
}

class _SignUpNfcInputState extends State<SignUpNfcInput> {
  var goodsIdController = TextEditingController();
  var goodsNameController = TextEditingController();
  static var goodsId = "";
  static var goodsName = "";
  String isSelectedItem = "";

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
                  controller: goodsIdController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: '物品ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: goodsNameController,
                  decoration: const InputDecoration(
                    labelText: '物品名',
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
                  onChanged: (String? value) {
                    setState(() {
                      isSelectedItem = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                FilledButton(
                    onPressed: () {
                      goodsId = goodsIdController.text;
                      goodsName = goodsNameController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpNfc(
                                  goodsId: goodsId,
                                  goodsName: goodsName,
                                )),
                      );
                    },
                    child: const Text('情報登録')),
              ],
            )));
  }
}
