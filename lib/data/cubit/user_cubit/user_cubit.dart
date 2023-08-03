import 'package:app/data/states/user_states/user_state.dart';
import 'package:app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitState());

  static UserCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
  }) {
    emit(UserLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(email: email, uId: value.user!.uid);
      print("$email}");
      print("$password");
      emit(UserSuccesState());
    }).catchError((error) {
      emit(UserErrState());
    });
  }

  void userCreate({
    required String email,
    required String uId,
  }) {
    UserModel model = UserModel(
      email: email,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(UserSuccesState());
    }).catchError((error) {
      emit(UserErrState());
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(UserLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(UserLoginSuccessState(value.user!.uid));
      print("$email}");
      print("$password");
    }).catchError((error) {
      emit(UserErrState());
    });
  }
}
