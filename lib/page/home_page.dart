import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connect_suba_and_fluttter/bloc/member_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController gender = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("list name and gender"),
      ),
      floatingActionButton: IconButton(
          color: Colors.indigo,
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.blueGrey.shade300,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "name"),
                              controller: name),
                          TextField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "gender"),
                              controller: gender),
                          ElevatedButton(
                            child: const Text('add'),
                            onPressed: () {
                              if ((gender.text.toLowerCase() == 'male' ||
                                      gender.text.toLowerCase() == 'female') &&
                                  name.text.isNotEmpty) {
                                BlocProvider.of<MemberBloc>(context)
                                    .add(addMember(name.text, gender.text));

                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'success',
                                    message: 'success add new data to database',
                                    contentType: ContentType.success,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentMaterialBanner()
                                  ..showSnackBar(snackBar);
                                name.clear();
                                gender.clear();
                                Navigator.pop(context);
                              } else {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'failure',
                                    message:
                                        'failure to add new data to database',
                                    contentType: ContentType.success,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentMaterialBanner()
                                  ..showSnackBar(snackBar);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is MemberShow) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: ListView.builder(
                itemCount: state.listMember.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              index % 2 == 0
                                  ? "image/duck-2-svgrepo-com.svg"
                                  : "image/duck-3-svgrepo-com.svg",
                              color: Colors.black,
                              height: 20,
                              width: 20),
                          Text("id : ${state.listMember[index].id}  "),
                          Text("name : ${state.listMember[index].name}  "),
                          Text("gender : ${state.listMember[index].gender}  "),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<MemberBloc>(context).add(
                                        deleteMember(
                                            state.listMember[index].id));
                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      content: AwesomeSnackbarContent(
                                        title: 'success',
                                        message:
                                            'success delete data from database',
                                        contentType: ContentType.success,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentMaterialBanner()
                                      ..showSnackBar(snackBar);
                                  },
                                  icon: const Icon(Icons.delete)),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 200,
                                          color: Colors.blueGrey.shade300,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  TextField(
                                                      decoration: const InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          hintText: "new name"),
                                                      controller: name),
                                                  TextField(
                                                      decoration: const InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          hintText:
                                                              "new gender"),
                                                      controller: gender),
                                                  ElevatedButton(
                                                    child: const Text('edit'),
                                                    onPressed: () {
                                                      if (gender.text
                                                              .isNotEmpty ||
                                                          name.text
                                                              .isNotEmpty) {
                                                        if (gender.text
                                                                    .toLowerCase() ==
                                                                'male' ||
                                                            gender.text
                                                                    .toLowerCase() ==
                                                                'female') {
                                                          BlocProvider.of<
                                                                      MemberBloc>(
                                                                  context)
                                                              .add(updateMember(
                                                                  state
                                                                      .listMember[
                                                                          index]
                                                                      .id,
                                                                  name.text,
                                                                  gender.text));
                                                          final snackBar =
                                                              SnackBar(
                                                            elevation: 0,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            content:
                                                                AwesomeSnackbarContent(
                                                              title: 'success',
                                                              message:
                                                                  'success edit data from database',
                                                              contentType:
                                                                  ContentType
                                                                      .success,
                                                            ),
                                                          );
                                                          ScaffoldMessenger.of(
                                                              context)
                                                            ..hideCurrentMaterialBanner()
                                                            ..showSnackBar(
                                                                snackBar);
                                                          name.clear();
                                                          gender.clear();
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      } else {
                                                        final snackBar =
                                                            SnackBar(
                                                          elevation: 0,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          content:
                                                              AwesomeSnackbarContent(
                                                            title: 'failure',
                                                            message:
                                                                'failure to edit data from database',
                                                            contentType:
                                                                ContentType
                                                                    .failure,
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                            context)
                                                          ..hideCurrentMaterialBanner()
                                                          ..showSnackBar(
                                                              snackBar);
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.edit))
                            ],
                          )
                        ]),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
