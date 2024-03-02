import 'package:flutter/material.dart';

class SuccessSnakBar extends StatelessWidget {
  const SuccessSnakBar({
    super.key,
    required this.predictionLabel,
    required this.predictionConfidence,
  });

  final String predictionLabel;
  final String predictionConfidence;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 88, 198, 92), borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              SizedBox(width: 50,),
              SizedBox(width: 5,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$predictionLabel",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "this image represent $predictionConfidence% $predictionLabel",
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
          child: Image.asset("assets/icons/greenbubble.png",height: 90,width: 70,),
          bottom: 0,
          ),

      ],
    );
  }
}
