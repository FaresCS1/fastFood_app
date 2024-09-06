// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../core/colors/appColors.dart';
// import '../../../core/dimensions/myDimensions.dart';
//
// Widget numberOfItemAction(){
//   return   Row(
//     children: [
//       IconButton(
//           onPressed: () {
//             WidgetsBinding.instance
//                 .addPostFrameCallback((_) {
//               cartProvider
//                   .moreItem(cartProvider.myCart[index]);
//             });
//           },
//           icon: Icon(
//             color: AppColors.lightRedColor,
//             Icons.add_circle_outlined,
//             size: dimensionWidth(0.07),
//           )),
//       Text(
//         item["numOfItem"].toString(),
//         style: TextStyle(
//             color: AppColors.brownColor,
//             fontSize: dimensionFontSize(18)),
//       ),
//       item["numOfItem"] == 1
//           ? const SizedBox(width: 10)
//           : IconButton(
//           onPressed: () {
//             WidgetsBinding.instance
//                 .addPostFrameCallback((_) {
//               cartProvider
//                   .lessItem(cartProvider.myCart[index]);
//               // cartProvider
//               //     .TotalBill();
//             });
//           },
//           icon: Icon(
//             color: AppColors.lightRedColor,
//             Icons.do_not_disturb_on,
//             size: dimensionWidth(0.07),
//           ))
//     ],
//   )
// }
