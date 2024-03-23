import 'package:flutter/material.dart';
import 'package:frontend/models/person.dart';
import 'package:frontend/services/api.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      body:  FutureBuilder<List<Person>>(
        future: Api.getPersons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            List<Person> persons = snapshot.data!;
            return ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person_rounded, size: 36,),
                  title: Text(persons[index].name, style: TextStyle(color: Colors.black, fontSize: 24),),
                  subtitle: Text("Phone: ${persons[index].phone}, Age: ${persons[index].age}", style: TextStyle(color: Colors.black, fontSize: 16),),
                );
              },
            );
          }
        },
      ),
    );
  }
}
