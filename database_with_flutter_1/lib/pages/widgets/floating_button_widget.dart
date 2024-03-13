import 'package:database_with_flutter_1/bloc/supabase_bloc.dart';
import 'package:database_with_flutter_1/helper/colors.dart';
import 'package:database_with_flutter_1/helper/extintion.dart';
import 'package:database_with_flutter_1/helper/sized.dart';
import 'package:database_with_flutter_1/pages/widgets/button_product_widget.dart';
import 'package:database_with_flutter_1/pages/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButtonWidgets extends StatelessWidget {
  AddButtonWidgets({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    final bloc = context.read<SupabaseBloc>();
    return Builder(builder: (context) {
      return FloatingActionButton(
          backgroundColor: const Color.fromARGB(217, 198, 197, 197),
          tooltip: 'add member',
          elevation: 3,
          shape: CircleBorder(
              eccentricity: 1, side: BorderSide(color: purpler, width: 2)),
          child: const Icon(Icons.add_sharp,
              color: Colors.white,
              size: 55,
              shadows: [
                BoxShadow(
                    blurStyle: BlurStyle.inner,
                    color: Colors.grey,
                    spreadRadius: 30,
                    offset: Offset.infinite)
              ]),
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              barrierColor: Colors.white.withOpacity(0),
              context: context,
              elevation: 10,
              builder: (BuildContext context) {
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
                                "Add member",
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
                                title: 'add member',
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    bloc.add(AddMemberEvent(
                                        name: nameController.text,
                                        gender: genderController.text));
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
              },
            );
          });
    });
  }
}
