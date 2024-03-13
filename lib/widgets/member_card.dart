import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase__lab/bloc/member_bloc.dart';
import 'package:supabase__lab/models/member_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MemberCard extends StatelessWidget {
  MemberCard({super.key, required this.member});
  final supabase = Supabase.instance.client; //supabase

  Member member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('${member.id}'),
              const SizedBox(
                width: 10,
              ),
              Text(member.name),
              const SizedBox(
                width: 10,
              ),
              Text(member.gender),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<MemberBloc>(context)
                        .add(deleteDataEvent(member));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Delete Member Successfuly"),
                    ));
                  },
                  icon: const Icon(Icons.delete)),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          TextEditingController nameController =
                              TextEditingController(text: member.name);
                          TextEditingController genderController =
                              TextEditingController(text: member.gender);

                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Edit member",
                                  style: TextStyle(fontSize: 20),
                                ),
                                TextField(
                                  controller: nameController,
                                  decoration:
                                      const InputDecoration(hintText: "Name"),
                                ),
                                TextField(
                                    controller: genderController,
                                    decoration: const InputDecoration(
                                        hintText: "Gender")),
                                ElevatedButton(
                                    onPressed: () {
                                      member.name = nameController.text;
                                      member.gender = genderController.text;
                                      BlocProvider.of<MemberBloc>(context)
                                          .add(editMemberEvent(member));
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text("Edit Member Successfuly"),
                                      ));
                                    },
                                    child: const Text("EDIT"))
                              ],
                            ),
                          );
                        });
                  },
                  icon: const Icon(Icons.edit))
            ],
          )
        ],
      ),
    );
  }
}
