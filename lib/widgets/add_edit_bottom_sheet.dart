import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week7_day3/bloc/data_bloc.dart';
import 'package:flutter_week7_day3/helpers/extension/screen_helper.dart';
import 'package:flutter_week7_day3/models/member_model.dart';
import 'package:flutter_week7_day3/utils/colors.dart';
import 'package:flutter_week7_day3/widgets/text_field_iconed.dart';

class AddEditBottomSheet extends StatelessWidget {
  const AddEditBottomSheet({
    super.key,
    required this.nameController,
    required this.genderController,
    this.isEdit = false, this.member,
  });

  final TextEditingController nameController;
  final TextEditingController genderController;
  final Member? member;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: context.getHeight(context) * .5,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFieldIconed(
              nameController: nameController,
              icon: const Icon(
                Icons.person,
                color: blackColor,
              ),
              hintText: "Enter your name",
              labelText: "Name"),
          TextFieldIconed(
              nameController: genderController,
              icon: const Icon(
                Icons.swap_calls,
                color: blackColor,
              ),
              hintText: "Enter your gender (Male, Female)",
              labelText: "Gender"),
          ElevatedButton(
            onPressed: () {
              if (isEdit!) {
                context.read<DataBloc>().add(EditMemberEvent(gender: genderController.text, member: member!, name: nameController.text));
                context.read<DataBloc>().add(GetMemberDataEvent());
                Navigator.pop(context);
              } else {
                context.read<DataBloc>().add(AddMemberEvent(
                    gender: genderController.text, name: nameController.text));
                context.read<DataBloc>().add(GetMemberDataEvent());
                Navigator.pop(context);
              }
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(blackColor)),
            child: Text(
              (isEdit!) ? "Edit" :"Add",
              style: const TextStyle(
                  color: whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
