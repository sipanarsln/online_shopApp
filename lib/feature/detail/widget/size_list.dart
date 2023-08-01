import 'package:flutter/material.dart';
import 'package:online_shop/product/constants/color_constants.dart';

class SizeList extends StatefulWidget {
  const SizeList({super.key});

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['S', 'M', 'L'];

  var currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentSelected = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: currentSelected == index
                  ? ColorConstants.primaryColor
                  : ColorConstants.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(0.1), width: 2),
            ),
            child: Text(
              sizeList[index],
              style: TextStyle(
                color: currentSelected == index
                    ? ColorConstants.white
                    : ColorConstants.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, context) => const SizedBox(width: 10),
        itemCount: sizeList.length,
      ),
    );
  }
}


// Padding(
          //   padding: context.padding.low,
          //   child: Row(
          //     children: [
          //       Container(
          //         height: 50,
          //         width: 50,
          //         decoration: BoxDecoration(
          //           color: Colors.amber,
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //         child: const Center(
          //           child: Text(
          //             'S',
          //             style: TextStyle(fontSize: 20),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: context.padding.onlyLeftLow,
          //         child: InkWell(
          //           onTap: () {},
          //           child: Container(
          //             height: 50,
          //             width: 50,
          //             decoration: BoxDecoration(
          //               color: Colors.amber,
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             child: const Center(
          //                 child: Text(
          //               'M',
          //               style: TextStyle(fontSize: 20),
          //             )),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: context.padding.onlyLeftLow,
          //         child: Container(
          //           height: 50,
          //           width: 50,
          //           decoration: BoxDecoration(
          //             color: Colors.amber,
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Center(
          //               child: Text(
          //             'L',
          //             style: TextStyle(fontSize: 20),
          //           )),
          //         ),
          //       ),
          //     ],
          //   ),
          // )