import 'package:dr_project/addPatientInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Patients List", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.grey,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => addPatientInfo()));
          print("pressed!");
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28)
        ),
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.add, size: 30, color: Colors.white,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 670,
              child: Card(
                child: ListView.separated(itemBuilder: (context, index){
                  return ListTile(
                    //leading: Text('$index'),
                    title: Text("Patient Name"),
                    subtitle: Text(' ', style: TextStyle(fontSize: 25),),
                    trailing: Container(
                      width: 50,
                      height: 65,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.message, ),
                              SizedBox(width: 2),
                              Icon(Icons.phone),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                  itemCount: 25,
                  separatorBuilder: (context, Index){
                  return Divider(height: 34, thickness: 2,);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
