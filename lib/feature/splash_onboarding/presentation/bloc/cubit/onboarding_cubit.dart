import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:clicktwaek/feature/plans/presentation/pages/plans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../home/presentration/pages/home.dart';
import '../../../../minning/presentation/pages/minning.dart';
import '../../../../withdraw/presentation/pages/witdraw.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  List<YoutubeVideo> videos = [];
  User? user;
  int bottonnavSelectedIndex = 0;

  final screens = [
    const HomePage(),
    const Plans(),
    const Minning(),
    const Withdraw(),
  ];
  delaySplash() async {
    emit(OnboardingLoadingState());
    await Future.delayed(const Duration(seconds: 8));
    emit(OnboardingLoadedState());
  }

  checkUserSigin() {
    emit(OnboardingLoadingState());
    if (user == null) {
      log('null');
      emit(const OnboardingError(error: 'error'));
    } else {
      log('valid');
      emit(OnboardingSigin());
    }
  }

  void changebottomnavindex({required int index}) {
    emit(OnboardingLoadingState());
    bottonnavSelectedIndex = index;
    emit(OnboardingLoadedState());
  }

  googleSignIn() {
    emit(OnboardingLoadingState());
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      auth.signInWithProvider(googleAuthProvider);
    } catch (error) {
      emit(const OnboardingError(error: 'error'));
      log(error.toString());
    }
  }

  addUserInfo() {
    log(user!.email.toString());
    firestore.collection('users').doc(user!.uid).set(<String, dynamic>{
      'email': user!.email,
      'avatar': user!.photoURL,
    });
  }

  Future getvideo() async {
    emit(OnboardingLoadingState());
    await FirebaseFirestore.instance
        .collection('youtubeVideos')
        .get()
        .then((snapshot) async {
      if (snapshot.docs.isNotEmpty) {
        for (var co in snapshot.docs) {
          videos.add(YoutubeVideo.fromJson(co.data()));
          log(videos.first.url.toString());
          log(co.data().toString());
        }
      }
    });
    emit(OnboardingLoadedState());
  }
}

checkvideocode() {}

class YoutubeVideo {
  String? code;
  String? url;
  YoutubeVideo({this.code, this.url});
  YoutubeVideo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    url = json['videourl'];
  }
}
