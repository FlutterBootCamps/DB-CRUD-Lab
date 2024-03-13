import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase__lab/bloc/member_bloc.dart';
import 'package:supabase__lab/models/member_model.dart';
import 'package:supabase__lab/widgets/member_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text(
          "Member List",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                TextEditingController nameController = TextEditingController();
                TextEditingController genderController =
                    TextEditingController();

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Add member",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(hintText: "Name"),
                      ),
                      TextField(
                          controller: genderController,
                          decoration:
                              const InputDecoration(hintText: "Gender")),
                      ElevatedButton(
                          onPressed: () {
                            Member newMember = Member(
                              name: nameController.text,
                              gender: genderController.text,
                            );
                            BlocProvider.of<MemberBloc>(context)
                                .add(addMemberEvent(newMember));
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Add Member Successfuly"),
                            ));
                          },
                          child: const Text("ADD"))
                    ],
                  ),
                );
              });
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.blue[100],
      body: SafeArea(child: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is DisplayInfoState) {
            return ListView.builder(
              itemCount: state.classMembers.length,
              itemBuilder: (context, index) {
                return MemberCard(
                  member: state.classMembers[index],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
