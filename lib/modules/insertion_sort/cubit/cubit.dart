import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insertion_sort/modules/insertion_sort/cubit/states.dart';

class InsertionSortCubit extends Cubit<InsertionSortState> {
  InsertionSortCubit(super.initialState);

  List<String> unsortedlistcharacters = [];
  List<String> all = [];
  List<String> keys = [];
  int? key;
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();
  var controller5 = TextEditingController();
  var controller6 = TextEditingController();
  var controller7 = TextEditingController();
  var controller8 = TextEditingController();
  List<int> unsortedList = [];
  static InsertionSortCubit get(context) => BlocProvider.of(context);
  void sortedinsertionresult() {
    unsortedList = [
      int.parse(controller1.text),
      int.parse(controller2.text),
      int.parse(controller3.text),
      int.parse(controller4.text),
      int.parse(controller5.text),
      int.parse(controller6.text),
      int.parse(controller7.text),
      int.parse(controller8.text),
    ];

    for (int j = 1; j < unsortedList.length; j++) {
      key = unsortedList[j];

      int i = j - 1;

      while (i >= 0 && unsortedList[i] > key!) {
        unsortedList[i + 1] = unsortedList[i];
        i = i - 1;
        unsortedList[i + 1] = key!;
        all.add(unsortedList.toString());
        keys.add(key.toString());
      }
    }

    emit(InsertionSortSuccessState());
  }

  void clearall() {
    all.clear();
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
    controller6.clear();
    controller7.clear();
    controller8.clear();
    keys.clear();
    emit(ClearState());
  }
}
