import 'package:app/data_cubit/states/category_state/category_state.dart';
import 'package:app/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitState());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<CategoriesModel> categories = [];

  void GetCategory() {
    emit(CategoryLoadingState());
    FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      categories = [];
      querySnapshot.docs.forEach((doc) {
        CategoriesModel category = CategoriesModel.fromFirestore(doc);
        categories.add(category);
      });
      print("${categories.length}");
      emit(CategorySuccessState());
    });
  }
}
