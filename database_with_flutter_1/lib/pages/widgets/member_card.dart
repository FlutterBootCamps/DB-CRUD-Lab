import 'package:database_with_flutter_1/bloc/supabase_bloc.dart';
import 'package:database_with_flutter_1/model/member_model.dart';
import 'package:database_with_flutter_1/pages/widgets/edit_member_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.member});
  final MemberModel member;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SupabaseBloc>();
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color.fromARGB(145, 199, 180, 203)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${member.id} -"),
              const SizedBox(
                width: 10,
              ),
              Text(member.name),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  bloc.add(DeleteMemberEvent(id: member.id));
                },
                child: const Icon(
                  Icons.delete_rounded,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    barrierColor: Colors.white.withOpacity(0),
                    isScrollControlled: false,
                    elevation: 10,
                    context: context,
                    builder: (BuildContext context) {
                      return EditBottom(
                        member: member,
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
