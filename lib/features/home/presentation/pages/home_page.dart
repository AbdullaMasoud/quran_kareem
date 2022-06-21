import 'package:flutter/material.dart';
import 'package:musilm_app/config/routes/route.dart';
import 'package:musilm_app/core/utils/color_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.only(left: 40),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.quranMainPage);
            },
            icon: const Icon(
              Icons.menu_book,
              color: Colors.black,
            ),
          ),
        ),
        title: Column(
          children: [
            const Text(
              'Mon, 14 Dec',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '25 Rabi\' II 1442 AH',
              style: TextStyle(
                fontSize: 14,
                color: ColorManager.lightSky,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.compass_calibration,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 30),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: const Image(
                    image: AssetImage(
                      'assets/images/homes_1.png',
                    ),
                    fit: BoxFit.fill,
                    height: 200,
                    width: 400,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: ColorManager.green.withOpacity(0.78),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Text(
                        'Dzuhar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: ColorManager.offWhite),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '11:29',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: ColorManager.offWhite),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'AM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: ColorManager.offWhite),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_location_alt,
                            color: ColorManager.offWhite,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'libyan arab jamahiriya',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorManager.offWhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // SizedBox(
            //   height: 60,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 1,
            //     itemBuilder: (BuildContext context, int index) {
            //       return daysItem();
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget daysItem() => Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: lightWhite,
//           child: Text(
//             'Sun',
//             style: TextStyle(
//               color: lightSky,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 17,
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: green,
//           child: Text(
//             'Mon',
//             style: TextStyle(
//               color: offWhite,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 17,
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: lightWhite,
//           child: Text(
//             'Tue',
//             style: TextStyle(
//               color: lightSky,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 17,
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: lightWhite,
//           child: Text(
//             'wed',
//             style: TextStyle(
//               color: lightSky,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 17,
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: lightWhite,
//           child: Text(
//             'Thu',
//             style: TextStyle(
//               color: lightSky,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 17,
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: lightWhite,
//           child: Text(
//             'Fri',
//             style: TextStyle(
//               color: lightSky,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 17,
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: lightWhite,
//           child: Text(
//             'Sat',
//             style: TextStyle(
//               color: lightSky,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
