import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            "Deal of Day",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Image.network(
          "https://plus.unsplash.com/premium_photo-1681666713680-fb39c13070f3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29tcHV0ZXJ8ZW58MHx8MHx8fDA%3D",
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            "\$100",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          alignment: Alignment.topLeft,
          child: const Text("asmare",
              maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNvbXB1dGVyfGVufDB8fDB8fHww",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNvbXB1dGVyfGVufDB8fDB8fHww",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNvbXB1dGVyfGVufDB8fDB8fHww",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNvbXB1dGVyfGVufDB8fDB8fHww",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding:const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child:  Text(
            "See all deals",
            style: TextStyle(
              color: Colors.cyan[800]
            ),
            ),
        ),
      ],
    );
  }
}
