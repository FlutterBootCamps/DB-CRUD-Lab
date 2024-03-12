import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supbase_lab/bloc/member_bloc.dart';
import 'package:supbase_lab/model/member_model.dart';

class EditContainerWidget extends StatelessWidget {
  const EditContainerWidget({
    Key? key,
    required this.controllerName,
    required this.controllerGender,
    this.member,
    this.isEdit = false,
  }) : super(key: key);

  final TextEditingController controllerName;
  final TextEditingController controllerGender;
  final Member? member;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: controllerName,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter Name',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controllerGender,
            decoration: InputDecoration(
              labelText: 'Gender',
              hintText: 'Enter Gender',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: const Icon(Icons.swap_vert),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (isEdit) {
                context.read<MemberBloc>().add(EditMemberEvent(
                      id: member!.id,
                      gendar: controllerGender.text,
                      name: controllerName.text,
                    ));
              } else {
                context.read<MemberBloc>().add(AddMemberEvent(
                      gendar: controllerGender.text,
                      name: controllerName.text,
                    ));
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isEdit ? Colors.blue : Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                isEdit ? 'Edit' : 'Add',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
