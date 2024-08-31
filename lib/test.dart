// import 'package:flutter/cupertino.dart';
//
// class aa extends StatelessWidget {
//   const aa({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//         height: AppDimension.currentHeight,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding:
//               EdgeInsets.symmetric(vertical: dimensionHeight(0.10)),
//               child: Text(
//                 "Rest Password",
//                 style: TextStyle(
//                     color: AppColors.blackColor,
//                     fontSize: dimensionFontSize(28),
//                     letterSpacing: 1.5,
//                     wordSpacing: 2,
//                     fontWeight: FontWeight.bold,
//                     fontStyle: FontStyle.italic),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: AppColors.bgColor.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(15)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Image.asset(
//                     "assets/images/reset_password.png",
//                   ),
//                   const Text(
//                     "Reset Password via Email",
//                     style: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic),
//                   ),
//                   Text(
//                     "enter the email associted with your account and we will reset a new password to email",
//                     style: TextStyle(
//                         color: AppColors.blackColor,
//                         fontSize: 18,
//                         fontStyle: FontStyle.italic),
//                   ),
//                   textFieldWidget(Icons.email, "email", false,
//                       authProvider.emailController, emailFormKey),
//                   authButton("Reset Password", Icons.lock_reset,
//                           () => authProvider.resetPassword(context))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ),;
//   }
// }
