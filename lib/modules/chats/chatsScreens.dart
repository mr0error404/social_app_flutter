import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/userModel.dart';
import 'package:social_app/modules/chatDetails/chatDetailsScreen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cubit/cubitApp/cubit.dart';
import 'package:social_app/shared/cubit/cubitApp/states.dart';
import 'package:social_app/shared/style/colors.dart';

class ChatsScreens extends StatelessWidget {
  const ChatsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).users.length > 0,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: AppCubit.get(context).users.length,
            itemBuilder: (context, index) =>
                buildChatItem(AppCubit.get(context).users[index], context),
          ),
        );
      },
    );
  }

  Widget buildChatItem(UserModel model, context) => InkWell(
        onTap: () {
          navigateTo(context, ChatDetailsScreen(model));
        },
        child: Container(
          color: Color(0xFFBD00),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
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
                Text(
                  "${model.name}",
                  // "0000",
                  style: TextStyle(
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
