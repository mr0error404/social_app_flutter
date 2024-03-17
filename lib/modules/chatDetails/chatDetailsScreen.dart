import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                buildMessage(),
                buildMyMessage(),
                const Spacer(),
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
          ),
        );
      },
    );
  }

  Widget buildMessage() => Align(
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
            "Hello World !",
          ),
        ),
      );

  Widget buildMyMessage() => Align(
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
            "Hi, How are you ?",
          ),
        ),
      );
}
