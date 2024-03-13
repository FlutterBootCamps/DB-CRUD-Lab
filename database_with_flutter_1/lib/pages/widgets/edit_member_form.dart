import 'package:database_with_flutter_1/bloc/supabase_bloc.dart';
import 'package:database_with_flutter_1/helper/extintion.dart';
import 'package:database_with_flutter_1/helper/sized.dart';
import 'package:database_with_flutter_1/model/member_model.dart';
import 'package:database_with_flutter_1/pages/widgets/button_product_widget.dart';
import 'package:database_with_flutter_1/pages/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBottom extends StatelessWidget {
  EditBottom({super.key, required this.member});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MemberModel member;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    nameController.text = member.name;
    genderController.text = member.gender;
    final bloc = context.read<SupabaseBloc>();
    return Container(
      height: context.getHeight() * 0.68,
      width: context.getWidth(),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(5, 5),
                spreadRadius: 10,
                blurRadius: 20,
                blurStyle: BlurStyle.normal)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Edit member",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 59, 6, 69),
                        fontWeight: FontWeight.bold),
                  ),
                  gapH30,
                  gapH30,
                  TextfieldMember(
                    hintText: "name:",
                    textController: nameController,
                  ),
                  gapH10,
                  TextfieldMember(
                    hintText: "gender:",
                    textController: genderController,
                  ),
                  gapH30,
                  gapH20,
                  ButtonCreateWidget(
                    title: 'save changes',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        bloc.add(EditMemberEvent(
                            name: nameController.text,
                            gender: genderController.text,
                            id: member.id));
                        nameController.clear();
                        genderController.clear();
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ))
        ],
      ),
    );
  }
}
