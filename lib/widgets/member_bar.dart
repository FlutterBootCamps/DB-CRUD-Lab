import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week7_day3/bloc/data_bloc.dart';
import 'package:flutter_week7_day3/helpers/extension/screen_helper.dart';
import 'package:flutter_week7_day3/models/member_model.dart';
import 'package:flutter_week7_day3/utils/colors.dart';
import 'package:flutter_week7_day3/widgets/add_edit_bottom_sheet.dart';

class MemberBar extends StatelessWidget {
  const MemberBar({
    super.key,
    required this.member,
  });

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      width: context.getWidth(context),
      height: 60,
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  member.id.toString(),
                  style: const TextStyle(color: blackColor, fontSize: 18),
                ),
                Text(member.name,
                    style: const TextStyle(color: blackColor, fontSize: 18)),
                // Text(member.gender,
                //     style: const TextStyle(color: blackColor, fontSize: 18)),
                (member.gender.toLowerCase() == 'male') ? const Icon(Icons.male_rounded, color: maleColor,) : const Icon(Icons.female_rounded, color: femaleColor,) 
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                context.read<DataBloc>().add(DeleteMemberEvent(member: member));
                context.read<DataBloc>().add(GetMemberDataEvent());
              },
              icon: const Icon(
                Icons.remove_circle,
                color: blackColor,
              )),
          IconButton(
              onPressed: () {
                TextEditingController nameController = TextEditingController();
                TextEditingController genderController =
                    TextEditingController();
                nameController.text = member.name;
                genderController.text = member.gender;
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return AddEditBottomSheet(
                        nameController: nameController,
                        genderController: genderController,
                        isEdit: true,
                        member: member,);
                  },
                );
              },
              icon: const Icon(
                Icons.edit,
                color: blackColor,
              )),
        ],
      ),
    );
  }
}
