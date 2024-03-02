import 'package:flutter/material.dart';
import '../../Models/Plant.dart';


Widget searchItem(Plant plant){
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: plant.image_path,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(plant.image_path),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(35)
                ),
              )
              ),
            SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plant.name,overflow: TextOverflow.clip,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
              ],
            )
          ],
        ),
      ),
    ),
  );
}