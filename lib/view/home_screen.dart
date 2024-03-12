import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan2/bloc/member_bloc.dart';
import 'package:ramadan2/widgets/member_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController gendercontroller = TextEditingController();
    return Container(
     
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.white,Colors.lightBlue,Colors.black ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,

        )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: IconButton(
          onPressed: () {
            showModalBottomSheet<void>(
             
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: namecontroller,
                          decoration: const InputDecoration(hintText: "name"),
                        ),
                        TextField(
                          controller: gendercontroller,
                          decoration: const InputDecoration(hintText: "gender"),
                        ),
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () {
                            BlocProvider.of<MemberBloc>(context).add(
                                InsertRowEvent(
                                    namecontroller.text, gendercontroller.text));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.add,color: Colors.white,),
        ),
        body: Center(
          child: BlocBuilder<MemberBloc, MemberState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DisplayInfoState) {
                return ListView.builder(
                  itemCount: state.classMember.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MemberCard(
                      member: state.classMember[index],
                      edit: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextField(
                                      controller: namecontroller,
                                      decoration:
                                          const InputDecoration(hintText: "name",),
                                    ),
                                    TextField(
                                      controller: gendercontroller,
                                      decoration: 
                                          const InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                                            hintText: "gender"),
                                    ),
                                    ElevatedButton(
                                        child: const Text('Close BottomSheet'),
                                        onPressed: () {
                                          BlocProvider.of<MemberBloc>(context)
                                              .add(EditRowEvent(
                                                  gender: gendercontroller.text,
                                                  name: namecontroller.text,
                                                  id: state
                                                      .classMember[index].id));
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              } else {
                return const Text("data");
              }
            },
          ),
        ),
        
      ),
    );
  }
}
