import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_connet_with_flutter/bloc/member_bloc.dart';
import 'package:supabase_connet_with_flutter/mobels/member_model.dart';
import 'package:supabase_connet_with_flutter/widget/member_card.dart';
import 'package:supabase_connet_with_flutter/widget/member_form.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MemberBloc>();

    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),)),
        
        centerTitle: true,
        title: Text("List of Flutter Class Member", style: TextStyle(color: Colors.red.shade300, fontSize: 22, fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: BlocBuilder<MemberBloc, MemberState>(
                    builder: (context, state) {
                      if(state is LoadingState){
                        return Center(child: CircularProgressIndicator(color: Colors.red.shade300),);
                      }
                      if (state is DisplayInfoState) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.classMember.length,
                            itemBuilder: (context, index) {
                              return MemberCard(
                                  member: state.classMember[index]);
                            });
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 30,
                right: 30,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return MemberForm(
                            hintText1: "Enter Your Name",
                            labelText1: "Name",
                            hintText2: "Enter Your gender" ,
                            labelText2: "Gender",
                            bottomText: "Add New Member",
                            onTapFunc: (){
                             bloc.add(AddMemberDataEvent(name: nameController.text, gender: genderController.text));
                            //  add(AddMemberDataEvent(
                            //  name: nameController.text, gender: genderController.text));
                        }
                          );
                           });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromARGB(255, 193, 80, 80),
                    ),
                    child: const Icon(Icons.add, size: 50, color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
