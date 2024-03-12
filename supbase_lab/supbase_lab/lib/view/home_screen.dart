import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supbase_lab/bloc/member_bloc.dart';

import '../widgets/edit_container_widget.dart';
import '../widgets/member_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerGender = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<MemberBloc, MemberState>(
            listener: (context, state) {
              if (state is SuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.msg,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.msg,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DisplayDataState) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.members.length,
                  itemBuilder: (context, index) {
                    return MemberWidget(
                      member: state.members[index],
                      delete: () {
                        context.read<MemberBloc>().add(
                            DeleteMemberEvent(id: state.members[index].id));
                      },
                      edit: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return EditContainerWidget(
                                controllerName: controllerName,
                                controllerGender: controllerGender,
                                member: state.members[index],
                                isEdit: true,
                              );
                            });
                      },
                    );
                  },
                );
              }
              return const Center(
                child: Text("no data"),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return EditContainerWidget(
                controllerName: controllerName,
                controllerGender: controllerGender,
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        tooltip: 'Edit Member Information',
        elevation: 4,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
