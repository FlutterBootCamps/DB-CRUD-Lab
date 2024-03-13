import 'package:database_with_flutter_1/bloc/supabase_bloc.dart';
import 'package:database_with_flutter_1/pages/widgets/floating_button_widget.dart';
import 'package:database_with_flutter_1/pages/widgets/member_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text("members"),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Column(
          children: [
            BlocBuilder<SupabaseBloc, SupabaseState>(
              builder: (context, state) {
                if (state is DisplayState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.members.length,
                    itemBuilder: (context, index) {
                      return MemberCard(
                        member: state.members[index],
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
        floatingActionButton: AddButtonWidgets());
  }
}
