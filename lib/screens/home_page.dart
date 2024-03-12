import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week7_day3/bloc/data_bloc.dart';
import 'package:flutter_week7_day3/helpers/extension/screen_helper.dart';
import 'package:flutter_week7_day3/utils/colors.dart';
import 'package:flutter_week7_day3/widgets/add_edit_bottom_sheet.dart';
import 'package:flutter_week7_day3/widgets/member_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DataBloc>().add(GetMemberDataEvent());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<DataBloc, DataState>(
          listener: (context, state) {
            if (state is DataErrorState) {
              context.showErrorSnackBar(context, state.msg);
            } else if (state is DatabaseModifiedState) {
              context.showSuccessSnackBar(context, state.msg);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: whiteColor,
              ));
            } else if (state is DataRecivedState) {
              return ListView.builder(
                itemCount: state.memberList.length,
                itemBuilder: (context, index) {
                  return MemberBar(member: state.memberList[index]);
                },
              );
            } else {
              return const Center(
                child: Text("No Data Found",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              );
            }
          },
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {
          TextEditingController nameController = TextEditingController();
          TextEditingController genderController = TextEditingController();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddEditBottomSheet(
                  nameController: nameController,
                  genderController: genderController);
            },
          );
        },
        color: whiteColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: blackColor,
          size: 45,
        ),
      ),
    );
  }
}

