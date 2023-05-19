import 'package:database_fire/transcation/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Transaction_screen extends StatefulWidget {
  const Transaction_screen({Key? key}) : super(key: key);

  @override
  State<Transaction_screen> createState() => _Transaction_screenState();
}

class _Transaction_screenState extends State<Transaction_screen> {
  TransactionController controller=Get.put(TransactionController());
  TextEditingController txtcate =TextEditingController();
  TextEditingController txtAmount =TextEditingController();
  TextEditingController txtNotes =TextEditingController();
  TextEditingController txtPaytypes =TextEditingController();
   TextEditingController txtdate =TextEditingController(text: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController txttime =TextEditingController(text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  TextEditingController txtstatus =TextEditingController();
  @override
  void initState() {
    super.initState();
   controller.readtransaction();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
        title: Text("Tansaction Screen"),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Get.defaultDialog(
            title: 'Filter',
            content: Column(
              children: [
                TextButton(onPressed: () {
                  controller.readtransaction();
                  Get.back();
                }, child: Text("All",style: TextStyle(color: Colors.black),),),
                TextButton(onPressed: () {
                 controller.filtertransaction(0);
                 Get.back();
                }, child: Text("Income",style: TextStyle(color: Colors.black)),),
                TextButton(onPressed: () {
                  controller.filtertransaction(1);
                  Get.back();
                }, child: Text("Expense",style: TextStyle(color: Colors.black)),),
                TextButton(onPressed: () {
                  controller.readdesc();
                  Get.back();
                }, child: Text("Desending",style: TextStyle(color: Colors.black)),),
                TextButton(onPressed: () {
                  controller.readcategory();
                  Get.back();
                }, child: Text("Ascending",style: TextStyle(color: Colors.black)),),

              ],
            ),
          );

        },icon: Icon(Icons.filter_alt),)

      ),
      body: Obx(() =>
          Column(
            children: [
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) =>
                    Container(
                      height: 80,
                      width: 330,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.Transactionlist[index]['status'] ==
                              0 ? Colors.green.shade100 : Colors.red.shade100),
                      child:
                      ListTile(
                        leading: Text("${controller
                            .Transactionlist[index]['category']}"),
                        title: Text("${controller
                            .Transactionlist[index]['paytypes']}"),
                        subtitle: Text("${controller
                            .Transactionlist[index]['amount']}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: () {
                              // var id = controller.Transactionlist[index]['id'];
                              txtcate = TextEditingController(
                                  text: '${controller
                                      .Transactionlist[index]['category']}');
                              txtAmount = TextEditingController(
                                  text: '${controller
                                      .Transactionlist[index]['amount']}');
                              txtNotes = TextEditingController(
                                  text: '${controller
                                      .Transactionlist[index]['notes']}');
                              txtPaytypes = TextEditingController(
                                  text: '${controller
                                      .Transactionlist[index]['paytypes']}');
                              txtdate = TextEditingController(
                                  text: '${controller
                                      .Transactionlist[index]['date']}');
                              txttime = TextEditingController(
                                  text: '${controller
                                      .Transactionlist[index]['time']}');
                              txtstatus = TextEditingController(
                                  text: '${controller
                                      .Transactionlist[index]['status']}');
                              Get.defaultDialog(
                                content: SingleChildScrollView(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: txtcate,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ("Category"),
                                              fillColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          TextField(
                                            controller: txtAmount,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ("Amount"),
                                              fillColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          TextField(
                                            controller: txtNotes,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ("Notes"),
                                              fillColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          TextField(
                                            controller: txtPaytypes,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ("Paytypes"),
                                              fillColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          TextField(
                                            controller: txtdate,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ("Date"),
                                              fillColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          TextField(
                                            controller: txttime,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: ("Time"),
                                              fillColor: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          SingleChildScrollView(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceAround,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextButton(onPressed: () {
                                                  int id = controller
                                                      .Transactionlist[index]['id'];
                                                  String category = txtcate.text;
                                                  String amount = txtAmount.text;
                                                  String notes = txtNotes.text;
                                                  String paytypes = txtPaytypes
                                                      .text;
                                                  String date = txtdate.text;
                                                  String time = txttime.text;
                                                  String status = "0";
                                                  controller.updatetranscation(
                                                      id,
                                                      category,
                                                      amount,
                                                      notes,
                                                      paytypes,
                                                      date,
                                                      time,
                                                      status);
                                                  controller.readtransaction();
                                                  Get.back();
                                                }, child: Text("Income",style: TextStyle(color: Colors.green),)),
                                                SizedBox(height: 50),
                                                TextButton(onPressed: (){
                                                  int id = controller
                                                      .Transactionlist[index]['id'];
                                                  String category = txtcate.text;
                                                  String amount = txtAmount.text;
                                                  String notes = txtNotes.text;
                                                  String paytypes = txtPaytypes
                                                      .text;
                                                  String date = txtdate.text;
                                                  String time = txttime.text;
                                                  String status = "1";
                                                  controller.updatetranscation(
                                                      id,
                                                      category,
                                                      amount,
                                                      notes,
                                                      paytypes,
                                                      date,
                                                      time,
                                                      status);
                                                  controller.readtransaction();
                                                  Get.back();
                                                }, child: Text("Expense",style: TextStyle(color: Colors.red),)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              ],
                                  ),
                                ),
                              );
                            },
                            ),
                            IconButton(icon: Icon(Icons.delete), onPressed: () {
                              var id = controller.Transactionlist[index]['id'];
                              controller.deletetranscation(id);
                              controller.readtransaction();
                            },),
                          ],
                        ),
                      ),
                    ),
                  itemCount: controller.Transactionlist.length,
                ),
              ),
            ],
          ),
      ),
    ),
    );
  }
  }
List filterList = [
  'Expense',
  'Income',
  'View all',
  'Decending',
  'Acending',
];
