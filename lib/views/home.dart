import 'package:crudapiflutter/controller/userController.dart';
import 'package:crudapiflutter/views/addUser.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUserScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data.data[index].name),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.delete)),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
