import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memberlab/bloc/member_bloc.dart';
import 'package:memberlab/widgets/container_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MemberBloc>();
    bloc.add(fetchEvent());
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is DisplayState) {
            return ListView.builder(
                itemCount: state.memberlist.length,
                itemBuilder: (context, index) {
                  return 
                        ContainerMember(
                          members: state.memberlist[index],
                        );
                      
                });
          }
          return const Center(child: Text("loading"));
        },
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: 
          ((context){
            return  Column(children: [
              SimpleDialog(
title: const Text('add member name'),
contentPadding: const EdgeInsets.symmetric(horizontal: 8),
children: [
  TextFormField(
    //send the member value 
    onFieldSubmitted: (value)async {
     await Supabase.instance.client
    .from('member')
    .insert({'name':value});
           } ),
],
            ),
            SimpleDialog(
title: const Text('add member gender'),
contentPadding: const EdgeInsets.symmetric(horizontal: 8),
children: [
  TextFormField(
    //send the member value 
    onFieldSubmitted: (gender)async {
     await Supabase.instance.client
    .from('member')
    .insert({'gender':gender});
           } ),
],
            ),
            ]);
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
