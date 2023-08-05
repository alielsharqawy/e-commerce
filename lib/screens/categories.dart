import 'package:app/data_cubit/cubit/category_cubit/category.dart';
import 'package:app/data_cubit/states/category_state/category_state.dart';
import 'package:app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..GetCategory(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(
              body: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) => buildItem(
              context.read<CategoryCubit>().categories[index],
            ),
            itemCount: context.read<CategoryCubit>().categories.length,
          ));
        },
      ),
    );
  }

  Widget buildItem(CategoriesModel model) => Padding(
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
                    BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                    ),
                child: Image.network(
                  "${model.image}",
                  fit: BoxFit.cover,
                ),
              ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     "${model.name}",
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 25,
                     ),
                   ),
                 ),

            ],
          ),
        ),
      );
}
