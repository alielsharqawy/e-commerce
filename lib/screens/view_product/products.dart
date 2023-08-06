import 'package:app/data_cubit/cubit/product_cubit/product.dart';
import 'package:app/data_cubit/states/product_state/product_state.dart';
import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..GetProduct(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) => buildItem(
              context.read<ProductCubit>().products[index],
            ),
            itemCount: context.read<ProductCubit>().products.length,
          ));
        },
      ),
    );
  }

  Widget buildItem(ProductModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black54,
          ),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.network(
                  "${model.image}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${model.name}   Price: ${model.price} ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

            ],
          ),
        ),
      );
}
