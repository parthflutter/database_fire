import 'package:database_fire/transcation/controller/transaction_controller.dart';
import 'package:database_fire/ulitis/dbhelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class incomescreen extends StatefulWidget {
  const incomescreen({Key? key}) : super(key: key);

  @override
  State<incomescreen> createState() => _incomescreenState();
}

class _incomescreenState extends State<incomescreen> {
  TransactionController transactioncontroller =
      Get.put(TransactionController());
  TextEditingController txtcate = TextEditingController();
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtnotes = TextEditingController();
  TextEditingController txtpaytypes = TextEditingController();
  TextEditingController txtdate = TextEditingController(
      text:
          "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}");
  TextEditingController txttime = TextEditingController(
      text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  TextEditingController txtstatus = TextEditingController();

  @override
  void initState() {
    Dbhepler.dbhepler.checkDB();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ADD INCOME/EXPENSE"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Obx(
                      () => DropdownButtonFormField(
                        items: transactioncontroller.iCategory
                            .map(
                              (element) => DropdownMenuItem(
                                child: Text(element),
                                value: element,
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          transactioncontroller.selectedCategory.value = value!;
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                        ),
                        value: transactioncontroller.selectedCategory.value,
                      ),
                    ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                TextField(
                  controller: txtamount,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    hintText: ("Amount"),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtnotes,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    hintText: ("Notes"),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Obx(
                            () => DropdownButtonFormField(
                          items: transactioncontroller.ipaytype
                              .map(
                                (element) => DropdownMenuItem(
                              child: Text(element),
                              value: element,
                            ),
                          ).toList(),
                          onChanged: (value) {
                            transactioncontroller.selectedpaytype.value = value!;
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                          value: transactioncontroller.selectedpaytype.value,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtdate,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          transactioncontroller.current.value =
                              await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                                builder: (context, child) => Theme(data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Colors.black,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.black,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: Colors.black, // button text color
                                    ),
                                  ),
                                ), child: child!),
                          );
                          txtdate = TextEditingController(
                              text:
                                  "${transactioncontroller.current.value!.day}/${transactioncontroller.current.value!.month}/${transactioncontroller.current.value!.year}");
                          setState(() {});
                        },
                        icon: Icon(Icons.calendar_month),
                      ),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      hintText: ("Date"),
                      fillColor: Colors.black),
                ),
                // Obx(() => Text(
                //     "${transactioncontroller.current.value.year}/${transactioncontroller.current.value.month}/${transactioncontroller.current.value.day}")),
                SizedBox(height: 10),
                TextField(
                  controller: txttime,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(
                                    hour: DateTime.now().hour,
                                    minute: DateTime.now().minute));
                          },
                          icon: Icon(Icons.access_time_rounded)),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(),
                      hintText: ("Time"),
                      fillColor: Colors.black),
                ),
                // Obx(() => Text(
                //     "${transactioncontroller.current.value.hour}/${transactioncontroller.current.value.minute}")),
                // SizedBox(height: 10),
                // TextField(
                //   controller: txtstatus,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     label: Text("STATUS"),
                //   ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var a=transactioncontroller.selectedCategory.value;
                          var p=transactioncontroller.selectedpaytype.value;
                          Dbhepler.dbhepler.insertData(
                              category: a,
                              amount: txtamount.text,
                              status: '0',
                              notes: txtnotes.text,
                              date: txtdate.text,
                              time: txttime.text,
                              paytypes: p);
                          // print(Dbhepler.dbhepler.database);
                          int i = 0;
                          for (i = 0;
                              i < transactioncontroller.Transactionlist.length;
                              i++) {
                            int status = int.parse(transactioncontroller
                                .Transactionlist[i]['status']);
                            if (status == 1) {
                              int amount = int.parse(transactioncontroller
                                  .Transactionlist[i]['amount']);
                              transactioncontroller.total.value =
                                  transactioncontroller.total.value + amount;
                              transactioncontroller.income.value =
                                  transactioncontroller.income.value + amount;
                            }
                          }
                          print(
                              '${transactioncontroller.total.value}==============================');
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text('Income',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          var a = transactioncontroller.selectedCategory.value;
                          var p=transactioncontroller.selectedpaytype.value;
                          Dbhepler.dbhepler.insertData(
                              category: a,
                              amount: txtamount.text,
                              status: '1',
                              notes: txtnotes.text,
                              date: txtdate.text,
                              time: txttime.text,
                              paytypes: p);
                          // print(Dbhepler.dbhepler.database);
                          int i = 1;
                          for (i = 1;
                              i < transactioncontroller.Transactionlist.length;
                              i++) {
                            int status = int.parse(transactioncontroller
                                .Transactionlist[i]['status']);
                            if (status == 1) {
                              int amount = int.parse(transactioncontroller
                                  .Transactionlist[i]['amount']);
                              transactioncontroller.total.value =
                                  transactioncontroller.total.value - amount;
                              transactioncontroller.expense.value =
                                  transactioncontroller.expense.value + amount;
                            }
                          }
                          Get.back();
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text('Expense',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
