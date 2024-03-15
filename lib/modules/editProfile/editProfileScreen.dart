// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubitApp/cubit.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';
import 'package:social_app/shared/style/colors.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userModel = AppCubit.get(context).userModel;
    var profileImage = AppCubit.get(context).profileImage;
    var coverImage = AppCubit.get(context).coverImage;

    nameController.text = userModel!.name ?? "";
    bioController.text = userModel!.bio ?? "";
    phoneController.text = userModel!.phone ?? "";

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Edit Profile",
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconBroken.Arrow___Left_2,
              ),
            ),
            actions: [
              defaultTextButton(
                function: () {
                  AppCubit.get(context).updateUser(
                    name: nameController.text,
                    phone: phoneController.text,
                    bio: bioController.text,
                  );
                  // AppCubit.get(context).updateProfileImage();
                },
                text: "UpDate",
              ),
              const SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is UserUpdateLoadingState)
                    LinearProgressIndicator(),
                  if (state is UserUpdateLoadingState)
                    SizedBox(
                      height: 10.0,
                    ),
                  Container(
                    height: 210.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 170.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      4.0,
                                    ),
                                    topRight: Radius.circular(
                                      4.0,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: coverImage == null
                                        ? NetworkImage(
                                            "${userModel!.cover}",
                                          )
                                        : FileImage(coverImage)
                                            as ImageProvider<Object>,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  AppCubit.get(context).getCoverImage();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 65.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: profileImage == null
                                    ? NetworkImage(
                                        "${userModel.image}",
                                      )
                                    : FileImage(profileImage)
                                        as ImageProvider<Object>,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                AppCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  if (AppCubit.get(context).coverImage != null ||
                      AppCubit.get(context).profileImage != null)
                    Row(
                      children: [
                        if (AppCubit.get(context).profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                  uperCase: false,
                                  text: "UpLoad Profile Image",
                                  width: double.infinity,
                                  back: defaultColor,
                                  function: () {
                                    AppCubit.get(context).updateProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  },
                                ),
                                if (state is UserUpdateLoadingState)
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is UserUpdateLoadingState)
                                  LinearProgressIndicator(),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: 10.0,
                        ),
                        if (AppCubit.get(context).coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                defaultButton(
                                  uperCase: false,
                                  text: "UpLoad Cover Image",
                                  width: double.infinity,
                                  back: defaultColor,
                                  function: () {
                                    AppCubit.get(context).updateCoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  },
                                ),
                                if (state is UserUpdateLoadingState)
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                if (state is UserUpdateLoadingState)
                                  LinearProgressIndicator(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    textEditingController: nameController,
                    prefix: IconBroken.User,
                    type: TextInputType.name,
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Name must not be empty";
                      }
                      return null;
                    },
                    label: "Name",
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    textEditingController: bioController,
                    prefix: IconBroken.Info_Circle,
                    type: TextInputType.text,
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Bio must not be Bio";
                      }
                      return null;
                    },
                    label: "Bio",
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    textEditingController: phoneController,
                    prefix: IconBroken.Call,
                    type: TextInputType.number,
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return "Phone must not be empty";
                      }
                      return null;
                    },
                    label: "Phone",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
