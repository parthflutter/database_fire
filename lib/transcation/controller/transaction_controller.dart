import 'package:database_fire/ulitis/dbhelper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  RxString? dropDropDown;
  RxList<Map> Transactionlist = <Map>[].obs;
  RxInt total = 0.obs;
  RxInt income = 0.obs;
  RxInt expense = 0.obs;

  Future<void> readtransaction() async {
    Transactionlist.value = await Dbhepler.dbhepler.readData();
  }

  Future<void> filtertransaction(int statuscode) async {
    Transactionlist.value =
        await Dbhepler.dbhepler.Filterdata(statuscode: statuscode);
  }
  Future<void> readcategory() async {
   Transactionlist.value=await Dbhepler.dbhepler.ascendingfilter();
  }
  Future<void> readdesc() async {
    Transactionlist.value=await Dbhepler.dbhepler.descfilter();
  }

  Future<void> deletetranscation(int id) async {
    Transactionlist.value = await Dbhepler.dbhepler.deletedata(id: id);
    readtransaction();
  }

  Future<void> updatetranscation(
      int id,
      String category,
      String amount,
      String notes,
      String paytypes,
      String date,
      String time,
      String status) async {
    Transactionlist.value = await Dbhepler.dbhepler.upadtedata(
        id: id,
        category: category,
        amount: amount,
        notes: notes,
        paytypes: paytypes,
        date: date,
        time: time,
        status: status);
    readtransaction();
  }

  RxList<Map> totalIncomeList = <Map>[].obs;
  RxList<Map> totalExpanseList = <Map>[].obs;

  Future<void> totalIncome()
  async {
    totalIncomeList.value = await Dbhepler.dbhepler.totalIncome();
    print("${totalIncomeList[0]['SUM(amount)']}-------------income-------------------------");


  }

  //total expanse method
  Future<void> totalExpanse()
  async {

    totalExpanseList.value = await Dbhepler.dbhepler.totalExpanse();
    print("${totalExpanseList[0]['SUM(amount)']}------------------expanse--------------------");
    int income = totalIncomeList[0]['SUM(amount)'];
  }


  Rx<DateTime?> current = DateTime.now().obs;

  RxList<String> iCategory = <String>[
    "Salary",
    "Food",
    "Study",
    "Health",
    "Insurance",
    "Other"
  ].obs;
  var selectedCategory = "Other".obs;

  RxList<String> ipaytype = <String>[
    "Online",
    "Cash",
  ].obs;
  var selectedpaytype = "Online".obs;
}
