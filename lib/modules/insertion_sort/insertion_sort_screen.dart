import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insertion_sort/modules/insertion_sort/cubit/cubit.dart';
import 'package:insertion_sort/modules/insertion_sort/cubit/states.dart';

import 'package:insertion_sort/shared/components/components.dart';

class InsertionSortScreen extends StatefulWidget {
  const InsertionSortScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InsertionSortScreenState createState() => _InsertionSortScreenState();
}

class _InsertionSortScreenState extends State<InsertionSortScreen> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InsertionSortCubit(InitialState()),
      child: BlocConsumer<InsertionSortCubit, InsertionSortState>(
        listener: (context, state) {},
        // ignore: avoid_types_as_parameter_names
        builder: (context, State) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Insertion Sort',
              ),
            ),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller1,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller2,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller3,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller4,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller5,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller6,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller7,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: defaultFormField(
                                controller:
                                    InsertionSortCubit.get(context).controller8,
                                type: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "You Must enter the list";
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  if (InsertionSortCubit.get(context).unsortedList.isNotEmpty)
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                          shrinkWrap: false,
                          itemBuilder: (context, index) => listStages(
                              InsertionSortCubit.get(context).all[index],
                              InsertionSortCubit.get(context).keys[index]),
                          separatorBuilder: (context, index) {
                            // ignore: prefer_const_constructors
                            return SizedBox();
                          },
                          itemCount:
                              InsertionSortCubit.get(context).all.length),
                    ),
                  // const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: defaultButton(
                        function: () {
                          InsertionSortCubit.get(context).all = [];
                          InsertionSortCubit.get(context)
                              .sortedinsertionresult();
                        },
                        text: "Apply"),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: defaultButton(
                        function: () {
                          InsertionSortCubit.get(context).clearall();
                        },
                        text: "Clear"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listStages(text, key) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          elevation: 5,
          shadowColor: Colors.blue,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  text.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Key = ${key}",
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
          ),
        ));
  }
}
