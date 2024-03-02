import 'package:flutter/material.dart';

class ErrorSnackBar extends StatelessWidget {
  const ErrorSnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              SizedBox(
                width: 50,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Error",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "element cant not definde.Try take an other picture",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Image.asset(
            "assets/icons/bubbel.png",
            height: 90,
            width: 60,
          ),
          bottom: -5,
        ),
      ],
    );
  }
}
