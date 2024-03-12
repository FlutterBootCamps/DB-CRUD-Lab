import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_connet_with_flutter/bloc/member_bloc.dart';
import 'package:supabase_connet_with_flutter/mobels/member_model.dart';
import 'package:supabase_connet_with_flutter/widget/edit_member_form.dart';
import 'package:supabase_connet_with_flutter/widget/member_form.dart';

class MemberCard extends StatelessWidget {
  MemberCard({super.key, required this.member});

  final Member member;

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MemberBloc>();
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              '${member.id}',
            ),
            const SizedBox(width: 12),
            Text(member.name),
            const SizedBox(width: 12),
          ]),
          Row(
            children: [
              Text(member.gender),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  bloc.add(DeleteMemberDataEvent(member: member));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Delete Successfully"),
                    ),
                  );
                },
                icon: const Icon(Icons.cancel),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return EditMemberForm(
                          member: member,
                          hintText1: member.name,
                          labelText1: "Name",
                          hintText2: member.gender,
                          labelText2: "Gender",
                          bottomText: "Update Member",
                        );
                      });
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
        ],
      ),
    );
  }
}
