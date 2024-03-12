import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subabase/bloc/member_bloc.dart';
import 'package:subabase/model/members.dart';

TextEditingController nameController = TextEditingController();
TextEditingController genderController = TextEditingController();

class listTileWidget extends StatelessWidget {
  const listTileWidget({super.key,required this.member});
  final Member member;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.white10),
          borderRadius: BorderRadius.circular(16),
        ),
        leading: CircleAvatar(
          backgroundColor: const Color(0xff6ae792),
          child: Text(
            member!.id.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              member!.name,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(
              member!.gender,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            IconButton(onPressed: () {
               showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Edit members info'),
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
                        textStyle: TextStyle(color: Colors.black)),
                    onPressed: () {
                     context.read<MemberBloc>().add(UpdateMemberEvent(name: nameController.text, gender: genderController.text,member.id ));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ),
          );
            }, icon: Icon(Icons.edit))
          ],
        ),
        trailing: IconButton(
            onPressed: () {
              context.read<MemberBloc>().add(DeleteMemberEvent(member: member));
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            )),
        tileColor: const Color.fromARGB(255, 241, 239, 239),
      ),
    );
  }
}
