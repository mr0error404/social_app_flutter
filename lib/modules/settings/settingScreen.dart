import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/editProfile/editProfileScreen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubitApp/cubit.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      // Listener: (context , state ){},
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 210.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
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
                            image: NetworkImage(
                              "${userModel!.cover}",
                              // "https://cdn.pixabay.com/photo/2017/06/24/02/56/art-2436545_1280.jpg",
                              // "https://img.freepik.com/free-photo/portrait-pretty-redhead-girl-smiling_176420-9245.jpg?w=2000",
                              // "https://img.freepik.com/free-photo/adorable-cheerful-woman-has-gentle-smile-recalls-heartwarming-situation-life-keeps-hands-chin-has-interesting-intrigued-gaze-aside_273609-39273.jpg?t=st=1710262587~exp=1710266187~hmac=7d53913fb064127de7a129e3580f134a83c6317fed70cbd1656672261dd09d88&w=2000",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                          "${userModel!.image}",
                          // "https://img.freepik.com/free-photo/portrait-pretty-redhead-girl-smiling_176420-9245.jpg?w=2000",
                          // "https://cdn.pixabay.com/photo/2017/06/24/02/56/art-2436545_1280.jpg",
                          // "https://media.istockphoto.com/id/1484481140/photo/happy-smiling-young-woman-using-mobile-phone-with-credit-card-for-shopping-and-payment-online.jpg?s=2048x2048&w=is&k=20&c=3CoRtkl73z9UDV6rKoVArCGQsSmyizYXrWz2d_53MfI=",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "${userModel!.name}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "${userModel!.bio}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "100",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              "Posts",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "256",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              "Photos",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "12.5 K ",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              "Followers",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              "69",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              "Followings",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Add Photo",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    // child: defaultButton(
                    //   text: "Edit Profile",
                    //   width: double.infinity,
                    //   back: defaultColor,
                    //   function: () {},
                    // ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      navigateTo(
                        context,
                        EditProfileScreen(),
                      );
                    },
                    child: Icon(
                      IconBroken.Edit,
                      size: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
