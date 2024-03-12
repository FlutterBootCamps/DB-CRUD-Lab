import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_connet_with_flutter/bloc/member_bloc.dart';
import 'package:supabase_connet_with_flutter/mobels/member_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditMemberForm extends StatelessWidget {
  EditMemberForm({
    super.key,
    required this.member,
    required this.hintText1,
    required this.labelText1,
    required this.hintText2,
    required this.labelText2,
    required this.bottomText,
  });

  final Member member;
  final String hintText1;
  final String labelText1;
  final String hintText2;
  final String labelText2;
  final String bottomText;

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String name;
    String gender;
    final bloc = context.read<MemberBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
      child: Column(children: [
        TextField(
          style: TextStyle(color: Colors.red.shade300),
          controller: nameController,
          decoration: InputDecoration(
            hintText: hintText1, // "Enter Your name",
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
            labelText: labelText1, // "Name",
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
            prefixIcon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            border: InputBorder.none,
          ),
        ),
        TextField(
          style: TextStyle(color: Colors.red.shade300),
          controller: genderController,
          decoration: InputDecoration(
            hintText: hintText2, // "Enter Your gender",
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
            labelText: labelText2, //  "Gender",
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
            prefixIcon: const Icon(
              Icons.person_2,
              color: Colors.black,
            ),
            border: InputBorder.none,
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            if (nameController.text.isNotEmpty &&
                genderController.text.isNotEmpty) {
              if (genderController.text.toLowerCase() == 'female' ||
                  genderController.text.toLowerCase() == 'male') {
                name = nameController.text;
                gender = genderController.text;

                bloc.add(UpdateMemberDataEvent(
                    name: name, gender: gender, id: member.id));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Update Successfully"),
                  ),
                );
              } else {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Ensure to write gender correctly"),
                  ),
                );
              }
            } else if (nameController.text.isNotEmpty &&
                genderController.text.isEmpty) {
              name = nameController.text;
              gender = member.gender;

              bloc.add(UpdateMemberDataEvent(
                  name: name, gender: gender, id: member.id));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Update Successfully"),
                ),
              );
            } else if (nameController.text.isEmpty &&
                genderController.text.isNotEmpty) {
              if (genderController.text.toLowerCase() == 'female' ||
                  genderController.text.toLowerCase() == 'male') {
                name = member.name;
                gender = genderController.text;

                bloc.add(UpdateMemberDataEvent(
                    name: name, gender: gender, id: member.id));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Update Successfully"),
                  ),
                );
              }
             else {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Ensure to write gender correctly"),
                ),
              );
            }}
          },
          child: Text(
            bottomText,
            style: TextStyle(color: Colors.red.shade200, fontSize: 22),
          ),
        )
      ]),
    );
  }
}
