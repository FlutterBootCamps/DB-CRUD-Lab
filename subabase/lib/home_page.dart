import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subabase/bloc/member_bloc.dart';
import 'package:subabase/widgets/list_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<MemberBloc>().add(FetchDataEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Members List",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff6ae792),
      ),
      body: SafeArea(child: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is DisplayState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: state.listData.length,
                itemBuilder: ((context, index) {
                  return listTileWidget(
                    member: state.listData[index],
                  );
                }),
              ),
            );
          } else {
            return const Center(child: Text("error"));
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6ae792),
        mini: true,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add members'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Name:'),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Gender:'),
                  TextField(
                    controller: genderController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Gender',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6ae792),
                      textStyle: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      String name = nameController.text;
                      String gender = genderController.text;

                      if (name.isNotEmpty && gender.isNotEmpty) {
                        BlocProvider.of<MemberBloc>(context).add(AddMemberEvent(
                          name: name,
                          gender: gender,
                        ));
                        nameController.clear();
                        genderController.clear();
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter both name and gender.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: const Text('ADD Members', style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
