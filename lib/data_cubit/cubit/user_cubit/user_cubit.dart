import 'package:app/data_cubit/states/user_states/user_state.dart';
import 'package:app/models/user_model.dart';
import 'package:app/widget/cach_helper.dart';
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
      userCreate(email: email, uId: value.user!.uid, password: password);
      print("$email}");
      print("$password");
      emit(UserSuccesState());
    }).catchError((error) {
      emit(UserErrState());
    });
  }

  void userCreate(
      {required String email, required String uId, required String password}) {
    UserModel model = UserModel(email: email, password: password, uId: uId);

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

  userLogin({
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

  bool isdark = false;

  void changemode({bool? shared}) {
    if (shared != null) {
      isdark = shared;
      emit(changemodestate());
    } else {
      isdark = !isdark;
      sharedhelper.putbool(key: 'isDark', value: isdark).then((value) {
        emit(changemodestate());
      });
    }
  }

  UserModel? userModel;
  String? uId;
  void getUserData() {
    emit(UserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromJason(value.data()!);
      emit(UserSuccesState());
    });
  }
bool isPassword = true;
  void visibility() {
    isPassword = !isPassword;
    emit(changepass());
  }
}
