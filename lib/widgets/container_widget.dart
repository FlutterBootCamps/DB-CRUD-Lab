import 'package:flutter/material.dart';
import 'package:memberlab/model/member_model.dart';

// ignore: must_be_immutable
class ContainerMember extends StatelessWidget {
  ContainerMember({super.key, required this.members});
  Member members;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 50,
        width: 420,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.blue[50]),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('${members.id}'),
          const SizedBox(
            width: 40,
          ),
          Text(members.names),
          const SizedBox(
            width: 40,
          ),
          Text(members.gender),
          const SizedBox(
            width: 40,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ]),
      ),
    );
  }
}
