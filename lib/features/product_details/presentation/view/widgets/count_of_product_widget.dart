import 'package:flutter/material.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/core/utils/styles.dart';

class CountOfProdutWidget extends StatefulWidget {
   final double width; // Assuming you want to pass width as a parameter

  const CountOfProdutWidget({super.key, required this.width});
  

  @override
  State<CountOfProdutWidget> createState() => _CountOfProdutWidgetState();
}

class _CountOfProdutWidgetState extends State<CountOfProdutWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:widget.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors().ofWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors().orange,
            child: IconButton(
              onPressed: () {
                count++;
                setState(() {});
              },
              icon: Icon(Icons.add, color: AppColors().white),
            ),
          ),
          Text("$count", style: AppStyles.textStyle18),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors().orange,
            child: IconButton(
              onPressed: () {
                if (count > 0) {
                  count--;
                  setState(() {});
                }
              },
              icon: Icon(Icons.remove, color: AppColors().white),
            ),
          ),
        ],
      ),
    );
  }
} 