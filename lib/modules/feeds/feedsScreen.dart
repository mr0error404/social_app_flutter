import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedsScreens extends StatelessWidget {
  const FeedsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Hello "),
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
        const Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10.0,
            margin: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/id/1484481140/photo/happy-smiling-young-woman-using-mobile-phone-with-credit-card-for-shopping-and-payment-online.jpg?s=2048x2048&w=is&k=20&c=3CoRtkl73z9UDV6rKoVArCGQsSmyizYXrWz2d_53MfI=",
                      ),
                    )
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
