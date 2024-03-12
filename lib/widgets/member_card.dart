// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan2/bloc/member_bloc.dart';
import 'package:ramadan2/model/member_table.dart';

class MemberCard extends StatelessWidget {
  MemberCard({super.key, required this.member, this.edit});
  final Member member;
  Function()? edit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 7, spreadRadius: 2)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("${member.id}"),
            ),
            Text(member.name),
            Text(member.gender),
            IconButton(
                onPressed: () {
                  BlocProvider.of<MemberBloc>(context)
                      .add(DeleteRowEvent(member.id));
                },
                icon: const Icon(Icons.remove)),
            IconButton(
                onPressed:edit,
                icon: const Icon(Icons.edit)),
          ],
        ),
      ),
    );
  }
}
