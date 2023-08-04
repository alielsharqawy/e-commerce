import 'package:app/data_cubit/states/product_state/product_state.dart';
import 'package:app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitState());

  static ProductModel get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void GetProduct() {
    emit(ProductInitState());
    FirebaseFirestore.instance
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      products = [];
      querySnapshot.docs.forEach((doc) {
        ProductModel product = ProductModel.fromFirestore(doc);
        products.add(product);
      });
      print("${products.length}");
      emit(ProductSuccessState());
    });
  }
}
