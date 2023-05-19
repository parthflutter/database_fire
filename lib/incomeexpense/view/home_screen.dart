import 'package:database_fire/incomeexpense/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}
class _Home_screenState extends State<Home_screen> {
  Home_controller controller = Get.put(Home_controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.toNamed('/incomescreen');
        //   },
        //   child: Icon(
        //     Icons.add,
        //     color: Colors.black,
        //   ),
        // ),
        appBar: AppBar(
          title: Text("Khata Book"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.all(10),
              height: 130,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow.shade100,
                border: Border.all(color: Colors.yellow.shade700,width: 2),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Text("Total Income/Expense",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    SizedBox(height: 10),
                    Icon(Icons.currency_rupee),
                    Text('${controller.totalbalance}.00'),
                  ],
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 80,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade100,
                    border: Border.all(color: Colors.green,width: 2),
                  ),
                  child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                            "Income",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(Icons.currency_rupee),
                          Text('${controller.totalincome}.00'),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 80,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade100,
                    border: Border.all(color: Colors.red,width: 2),
                  ),
                  child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                    "Expense",
                    style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                    ),
                  ),
                          SizedBox(height: 10),
                          Icon(Icons.currency_rupee),
                          Text('${controller.totalexpense}.00'),
                        ],
                      )),
                ),
              ),
            ],
           ),

Spacer(),
          Stack(
            children: [
              navigationBar(),
              InkWell(
                onTap: () {
                  Get.toNamed('/incomescreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30,left: 150),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black),
                      shape: BoxShape.circle,
                      color:  Colors.white,
                    ),
                    child: Icon(Icons.add,color: Colors.black,size: 18),
                   ),
                ),
              ),
            ],
          ),
      ],
          ),
      ),
    );
  }
  Widget navigationBar()
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border:Border.all(width: 2,color: Colors.black)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
               Icon(
                Icons.home,
                color: Colors.black,
                size: 18,
              ),
            InkWell(
              onTap: () {
                Get.toNamed('/Transaction');
              },
              child: Icon(
                Icons.monetization_on_outlined,
                color: Colors.black,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
  }
