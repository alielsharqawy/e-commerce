import 'package:app/data_cubit/states/product_state/product_state.dart';
import 'package:app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<ProductState> {
  CategoryCubit() : super(ProductInitState());

  static ProductModel get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void GetCategory() {
    emit(ProductInitState());
    FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      products = [];
      querySnapshot.docs.forEach((doc) {
        ProductModel category = ProductModel.fromFirestore(doc);
        products.add(category);
      });
      print("${products.length}");
      emit(ProductSuccessState());
    });
  }
}
