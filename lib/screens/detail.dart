import 'package:flutter/material.dart';
import 'package:frontend/services/api.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});

  @override
  State<AddDetailScreen> createState() => _DeatailScreenState();
}

class _DeatailScreenState extends State<AddDetailScreen> {
  TextEditingController n = TextEditingController();
   TextEditingController pno = TextEditingController();
    TextEditingController age = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Deatils",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 400,
              child: Card(
                elevation: 40,
                color: Color.fromARGB(255, 246, 199, 238),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text("Enter Details",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: Color.fromARGB(255, 186, 100, 128)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.10,10,50,0),
                      child: TextFormField(
                        controller: n,
                        decoration:  const InputDecoration(
                          label: Text("Enter name", style: TextStyle(color:Color.fromARGB(255, 155, 48, 101)),),
                          
                        ),
                      ),
                    ),
                    Padding(
                      padding:  const EdgeInsets.fromLTRB(50.10,10,50,0),
                      child: TextFormField(
                        controller: pno,
                        decoration: const InputDecoration(
                          label: Text("Enter phonr number", style: TextStyle(color:Color.fromARGB(255, 155, 48, 101))),
                           
                        ),
                      ),
                    ),
                    Padding(
                      padding:  const EdgeInsets.fromLTRB(50.10,10,50,0),
                      child: TextFormField(
                        controller: age,
                        decoration:  const InputDecoration(
                          label: Text("Enter your Age", style: TextStyle(color:Color.fromARGB(255, 155, 48, 101))), 
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextButton(onPressed: (){
                        var data = {
                          "pname": n.text,
                          "pphone": pno.text,
                          "pAge" : age.text
                        };
                        Api.addPerson(data);
                      },
                       child: const Text("Submit", style: TextStyle(color:Colors.purple ),)
                       ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}