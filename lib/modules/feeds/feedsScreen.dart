import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/postModel.dart';
import 'package:social_app/shared/cubit/cubitApp/cubit.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';
import 'package:social_app/shared/style/colors.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class FeedsScreens extends StatelessWidget {
  const FeedsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          // condition: AppCubit.get(context).posts.length > 0,
          condition: true,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10.0,
                  // margin: EdgeInsets.zero,
                  margin: EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image.network(
                        "https://img.freepik.com/free-photo/adorable-cheerful-woman-has-gentle-smile-recalls-heartwarming-situation-life-keeps-hands-chin-has-interesting-intrigued-gaze-aside_273609-39273.jpg?t=st=1710262587~exp=1710266187~hmac=7d53913fb064127de7a129e3580f134a83c6317fed70cbd1656672261dd09d88&w=2000",
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Communicate with friends ",
                          // style: Theme.of(context).textTheme.titleMedium,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Card(
                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                //   elevation: 10.0,
                //   margin: EdgeInsets.symmetric(
                //     horizontal: 8.0,
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.all(10.0),
                //     child: Column(
                //       children: [
                //         Row(
                //           children: [
                //             const CircleAvatar(
                //               radius: 25.0,
                //               backgroundImage: NetworkImage(
                //                 "https://media.istockphoto.com/id/1484481140/photo/happy-smiling-young-woman-using-mobile-phone-with-credit-card-for-shopping-and-payment-online.jpg?s=2048x2048&w=is&k=20&c=3CoRtkl73z9UDV6rKoVArCGQsSmyizYXrWz2d_53MfI=",
                //               ),
                //             ),
                //             const SizedBox(
                //               width: 15.0,
                //             ),
                //             Expanded(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   const Row(
                //                     children: [
                //                       Text(
                //                         "Mr.Error404",
                //                         style: TextStyle(
                //                           height: 1.4,
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         width: 5.0,
                //                       ),
                //                       Icon(
                //                         Icons.check_circle,
                //                         color: Colors.blue,
                //                         size: 16.0,
                //                       ),
                //                     ],
                //                   ),
                //                   Text(
                //                     "January 21, 2024 at 11:00 PM ",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodySmall
                //                         ?.copyWith(
                //                           height: 1.4,
                //                         ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             const SizedBox(
                //               width: 15.0,
                //             ),
                //             IconButton(
                //               onPressed: () {},
                //               icon: const Icon(
                //                 Icons.more_horiz,
                //                 size: 22.0,
                //               ),
                //             ),
                //           ],
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(
                //             vertical: 15.0,
                //           ),
                //           child: Container(
                //             width: double.infinity,
                //             height: 1.0,
                //             color: Colors.grey[400],
                //           ),
                //         ),
                //         const Text(
                //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(
                //             vertical: 10.0,
                //           ),
                //           child: Container(
                //             width: double.infinity,
                //             child: Wrap(
                //               children: [
                //                 Padding(
                //                   padding: EdgeInsetsDirectional.only(
                //                     end: 6.0,
                //                   ),
                //                   child: Container(
                //                     height: 18.0,
                //                     child: MaterialButton(
                //                       padding: EdgeInsets.zero,
                //                       minWidth: 1.0,
                //                       onPressed: () {},
                //                       child: Text(
                //                         "#software",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .bodySmall!
                //                             .copyWith(
                //                               color: defaultColor,
                //                             ),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsetsDirectional.only(
                //                     end: 6.0,
                //                   ),
                //                   child: Container(
                //                     height: 18.0,
                //                     child: MaterialButton(
                //                       padding: EdgeInsets.zero,
                //                       minWidth: 1.0,
                //                       onPressed: () {},
                //                       child: Text(
                //                         "#software",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .bodySmall!
                //                             .copyWith(
                //                               color: defaultColor,
                //                             ),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //         Container(
                //           height: 200.0,
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(
                //               5.0,
                //             ),
                //             image: const DecorationImage(
                //               image: NetworkImage(
                //                 "https://img.freepik.com/free-photo/portrait-pretty-redhead-girl-smiling_176420-9245.jpg?w=2000",
                //                 // "https://img.freepik.com/free-photo/adorable-cheerful-woman-has-gentle-smile-recalls-heartwarming-situation-life-keeps-hands-chin-has-interesting-intrigued-gaze-aside_273609-39273.jpg?t=st=1710262587~exp=1710266187~hmac=7d53913fb064127de7a129e3580f134a83c6317fed70cbd1656672261dd09d88&w=2000",
                //               ),
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           child: InkWell(
                //             child: Row(
                //               children: [
                //                 Row(
                //                   children: [
                //                     Icon(
                //                       IconBroken.Heart,
                //                       size: 18.0,
                //                       color: Colors.red.shade300,
                //                     ),
                //                     SizedBox(
                //                       width: 5.0,
                //                     ),
                //                     Text(
                //                       "120",
                //                       style: Theme.of(context).textTheme.bodySmall,
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItem(
                      AppCubit.get(context).postos[index], context),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                  itemCount: 10,
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildPostItem(PostModel model, context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          // shrinkWrap: true,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                    "${model.image}",
                    // "https://cdn.pixabay.com/photo/2017/06/24/02/56/art-2436545_1280.jpg",
                    // "https://media.istockphoto.com/id/1484481140/photo/happy-smiling-young-woman-using-mobile-phone-with-credit-card-for-shopping-and-payment-online.jpg?s=2048x2048&w=is&k=20&c=3CoRtkl73z9UDV6rKoVArCGQsSmyizYXrWz2d_53MfI=",
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${model.name}",
                            style: TextStyle(
                              height: 1.4,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 16.0,
                          ),
                        ],
                      ),
                      Text(
                        "${model.dateTime}",
                        // "January 21, 2024 at 11:00 PM ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 22.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[400],
              ),
            ),
            Text(
              "${model.text}",
              // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        end: 6.0,
                      ),
                      child: Container(
                        height: 18.0,
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 1.0,
                          onPressed: () {},
                          child: Text(
                            "#software",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: defaultColor,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.only(
                    //     end: 6.0,
                    //   ),
                    //   child: Container(
                    //     height: 18.0,
                    //     child: MaterialButton(
                    //       padding: EdgeInsets.zero,
                    //       minWidth: 1.0,
                    //       onPressed: () {},
                    //       child: Text(
                    //         "#software",
                    //         style:
                    //             Theme.of(context).textTheme.bodySmall!.copyWith(
                    //                   color: defaultColor,
                    //                 ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            if (model.postImage != "")
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://img.freepik.com/free-photo/portrait-pretty-redhead-girl-smiling_176420-9245.jpg?w=2000",
                      // "https://img.freepik.com/free-photo/adorable-cheerful-woman-has-gentle-smile-recalls-heartwarming-situation-life-keeps-hands-chin-has-interesting-intrigued-gaze-aside_273609-39273.jpg?t=st=1710262587~exp=1710266187~hmac=7d53913fb064127de7a129e3580f134a83c6317fed70cbd1656672261dd09d88&w=2000",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              size: 18.0,
                              color: Colors.red.shade300,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "120",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              IconBroken.Chat,
                              size: 18.0,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "120 comment",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[400],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 18.0,
                          backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/06/24/02/56/art-2436545_1280.jpg",
                            // "https://media.istockphoto.com/id/1484481140/photo/happy-smiling-young-woman-using-mobile-phone-with-credit-card-for-shopping-and-payment-online.jpg?s=2048x2048&w=is&k=20&c=3CoRtkl73z9UDV6rKoVArCGQsSmyizYXrWz2d_53MfI=",
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "write a comment ... ",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    height: 1.4,
                                  ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        IconBroken.Heart,
                        size: 18.0,
                        color: Colors.red.shade300,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Like",
                        // style:
                        // Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
