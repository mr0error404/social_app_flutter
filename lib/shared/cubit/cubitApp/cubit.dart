import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/postModel.dart';
import 'package:social_app/models/userModel.dart';
import 'package:social_app/modules/chats/chatsScreens.dart';
import 'package:social_app/modules/feeds/feedsScreen.dart';
import 'package:social_app/modules/newPost/newPostScreen.dart';
import 'package:social_app/modules/settings/settingScreen.dart';
import 'package:social_app/modules/users/usersScreen.dart';
import 'package:social_app/shared/components/constant.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  void getUserData() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection("users").doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.formJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    FeedsScreens(),
    ChatsScreens(),
    NewPostSceeen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    "Home",
    "Chats",
    "Post",
    "Users",
    "Settings",
  ];

  void changeBottomNav(int index) {
    if (index == 2)
      emit(
        NewPostState(),
      );
    else {
      currentIndex = index;
      emit(
        ChangeBottomNavState(),
      );
    }
  }

  File? profileImage;
  Future<void> getProfileImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      emit(ProfileImagePickedErrorState());
      print("No image Selected");
    }
  }

  File? coverImage;
  Future<void> getCoverImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(CoverImagePickedSuccessState());
    } else {
      emit(CoverImagePickedErrorState());
      print("No image Selected");
    }
  }

  String profileImageUrl = "";

  void updateProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUpdateLoadingState());
    FirebaseStorage.instance
        .ref() // enter
        .child(
          // create and check file
          "users/${Uri.file(profileImage!.path).pathSegments.last}",
        )
        .putFile(profileImage!) // update File
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        profileImageUrl = value;
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
        // emit(ProfileUploadImageSuccessState());
      }).catchError((error) {
        emit(ProfileUploadImageErrorState());
      });
    }).catchError((error) {
      emit(ProfileUploadImageErrorState());
    });
  }

  String coverImageUrl = "";

  void updateCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(UserUpdateLoadingState());
    FirebaseStorage.instance
        .ref() // enter
        .child(
          // create and check file
          "users/${Uri.file(coverImage!.path).pathSegments.last}",
        )
        .putFile(coverImage!) // update File
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        coverImageUrl = value;
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
        // emit(CoverUploadImageSuccessState());
      }).catchError((error) {
        emit(CoverUploadImageErrorState());
      });
    }).catchError((error) {
      emit(CoverUploadImageErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel!.email,
      image: image ?? userModel!.image,
      uId: userModel!.uId,
      cover: cover ?? userModel!.cover,
      isEmailVerified: false,
      //https://images.pexels.com/photos/7230831/pexels-photo-7230831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(userModel!.uId)
        .update(
          model.toMap(),
        )
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UserUpdateErrorState());
    });
  }

  File? postImage;
  Future<void> getPostImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(PostImagePickedSuccessState());
    } else {
      emit(PostImagePickedErrorState());
      print("No image Selected");
    }
  }

  void removePodtImage() {
    postImage = null;
    emit(RemovePostImageState());
  }

  String postImageUrl = "";
  void uploadPostImage({
    // required String name,
    // required String uid,
    // required String image,
    required String dateTime,
    required String text,
  }) {
    emit(CreatePostLoadingState());
    FirebaseStorage.instance
        .ref()
        .child(
          "posts/${Uri.file(postImage!.path).pathSegments.last}",
        )
        .putFile(postImage!) // update File
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        postImageUrl = value;
        createPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
        // updateUser(
        //   name: name,
        //   cover: value,
        // );
        // emit(CoverUploadImageSuccessState());
      }).catchError((error) {
        print("==================== error");
        print(error.toString());
        emit(CreatePostErrorState());
        print(error.toString());
      });
    }).catchError((error) {
      print("==================== error");
      print(error.toString());
      emit(CreatePostErrorState());
      print(error.toString());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(CreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? "",
      // cover: cover ?? userModel!.cover,
      // isEmailVerified: false,
      // //https://images.pexels.com/photos/7230831/pexels-photo-7230831.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2
    );
    FirebaseFirestore.instance
        .collection("posts")
        .add(
          model.toMap(),
        )
        .then((value) {
      emit(CreatePostSuccessState());
      // getUserData();
    }).catchError((error) {
      print("--------------> Error error");
      print(error.toString());
      emit(CreatePostErrorState());
    });
  }

  //// posts
  List<PostModel> postos = [];
  void getPosts() {
    emit(GetPostsLoadingState());
    FirebaseFirestore.instance.collection("posts").get().then((value) {
      value.docs.forEach((element) {
        postos.add(
          PostModel.formJson(
            element.data(),
          ),
        );
      });
      emit(GetPostsSuccessState());
    }).catchError((error) {
      emit(
        GetPostsErrorState(
          error.toString(),
        ),
      );
    });
  }
}
