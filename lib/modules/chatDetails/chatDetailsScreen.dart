import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/messageModel.dart';
import 'package:social_app/models/userModel.dart';
import 'package:social_app/shared/cubit/cubitApp/cubit.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen(this.userModel, {super.key});
  UserModel userModel;
  var message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppCubit.get(context).getMessages(receiveId: "${userModel.uId}");
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        "${userModel.image}",
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "${userModel.name}",
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: AppCubit.get(context).messages.length > 0,
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, Index) {
                              var message =
                                  AppCubit.get(context).messages[Index];
                              if (AppCubit.get(context).userModel!.uId ==
                                  message.senderId)
                                return buildMyMessage(message);
                              return buildMessage(message);
                            },
                            separatorBuilder: (context, Index) => SizedBox(
                              height: 15.0,
                            ),
                            itemCount: AppCubit.get(context).messages.length,
                          ),
                        ),
                        // const Spacer(),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber[500] ?? Colors.black,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: message,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "type your message here ... ",
                                  ),
                                ),
                              ),
                              Container(
                                height: 40.0,
                                // color: Colors.amber[500],
                                child: MaterialButton(
                                  minWidth: 1.0,
                                  onPressed: () {
                                    AppCubit.get(context).sendMessage(
                                      receiveId: "${userModel.uId}",
                                      dateTime: DateTime.now().toString(),
                                      text: message.text,
                                    );
                                    message.text = "";
                                  },
                                  child: Icon(
                                    IconBroken.Send,
                                    size: 22.0,
                                    color: Colors.amber[500],
                                    // color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(
                  10.0,
                ),
                topStart: Radius.circular(
                  10.0,
                ),
                topEnd: Radius.circular(
                  10.0,
                ),
              )),
          child: Text(
            // "Hello World !",
            "${model!.text}",
          ),
        ),
      );

  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
              color: Colors.amber[400],
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(
                  10.0,
                ),
                topStart: Radius.circular(
                  10.0,
                ),
                topEnd: Radius.circular(
                  10.0,
                ),
              )),
          child: Text(
            // "Hi, How are you ?",
            "${model!.text}",
          ),
        ),
      );
}
