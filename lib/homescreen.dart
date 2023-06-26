
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/geolocator.dart';
import 'package:weather_app/model/weathermodel.dart';
import 'package:weather_app/service/weatherdata.dart';
import 'package:weather_app/widgets/texts.dart';


 var dayinfo = DateTime.now();
 var dateformat = DateFormat('EEE, d MMM, yyyy').format(dayinfo);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    info();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(             
            gradient: LinearGradient(
                colors: [
                 Color.fromARGB(255, 199, 177, 101),
                Color.fromARGB(255, 86, 144, 250),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
               stops: [0.2, 0.85])), 
        child: FutureBuilder<Weather?>( 
          future: info(),builder: (context, snapshot) {
          return  snapshot.connectionState == ConnectionState.done && snapshot.hasData?
             Column(
                children: [
                  SizedBox(
                    height: 70.h,
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox( height: 9.h,),
                        Column(
                          children: [
                            boldtext(snapshot.data!.location!.name!, 26, FontWeight.bold),
                            boldtext(dateformat, 13, FontWeight.normal),
                          ],
                        ),
                        SizedBox(height: 3.h,), 
                        Image.network('https:${snapshot.data!.current!.condition!.icon}',fit: BoxFit.fill,width: 35.w,),   
                        SizedBox(height: 1.h,),
                        boldtext(snapshot.data!.current!.condition!.text!, 16, FontWeight.bold), 
                        boldtext('${snapshot.data!.current!.tempC!.toString()}°', 46, FontWeight.bold),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                    height: 6.h,
                                    width: 14.w,
                                    child: const Image(
                                        image: AssetImage(
                                     "assets/images/images-removebg-preview.png"))),
                                boldtext('${snapshot.data!.current!.windKph} km/h', 13, FontWeight.bold),
                                boldtext('wind', 10, FontWeight.normal),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    height: 6.h,
                                    width: 13.w,
                                    child: const Image(
                                   image: AssetImage(
                                   "assets/images/Screenshot_2023-06-19_205647-removebg-preview.png"))),
                                boldtext(snapshot.data!.current!.humidity.toString(), 13, FontWeight.bold),
                                boldtext('Humidity', 10, FontWeight.normal),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    height: 6.h,
                                    width: 11.w,
                                    child: const Image(
                                    image: AssetImage(
                                   "assets/images/download-removebg-preview.png"))),
                                boldtext(snapshot.data!.current!.windDir.toString(), 13, FontWeight.bold),
                                boldtext('wind direction', 10, FontWeight.normal),
                              ],
                            )],),
                        SizedBox(height: 6.h,)
                      ],
                    ),
                  ),
                  Flexible( 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       const SizedBox(height: 5,), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                boldtext('Gust', 9.sp, FontWeight.normal),
                                boldtext('${snapshot.data!.current!.gustKph} kp/h', 14.sp, FontWeight.bold),
                              ],
                            ),
                            Column(
                              children: [
                                boldtext('UV', 9.sp, FontWeight.normal),
                                boldtext(snapshot.data!.current!.uv.toString(), 14.sp, FontWeight.bold),
                              ],
                            ),
                            Column(
                              children: [
                                boldtext('Wind', 9.sp, FontWeight.normal), 
                                boldtext('${snapshot.data!.current!.windKph} km/h', 14.sp, FontWeight.bold),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                boldtext('Pressure', 9.sp, FontWeight.normal),
                                boldtext('${snapshot.data!.current!.pressureMb.toString()} hpa', 14.sp, FontWeight.bold),
                              ],
                            ), 
                            Column(
                              children: [
                                boldtext('Precipitation', 9.sp, FontWeight.normal,),
                                boldtext('${snapshot.data!.current!.precipMm.toString()} mm', 14.sp, FontWeight.bold),
                              ],
                            ),
                            Column(
                              children: [ 
                                boldtext('Last Update', 9.sp, FontWeight.normal),
                               const SizedBox(height: 3,), 
                                boldtext(snapshot.data!.current!.lastUpdated.toString(), 10.sp, FontWeight.bold),  
                              ], 
                            ),
                          ],
                        ),
                       const SizedBox(height: 5,), 
                      ], 
                    ),
                  )
                ],
              ):
             const Center(child: CircularProgressIndicator(color: Colors.white,),);  
          },  
        ),
      ));   
  }

 Future<Weather?> info() async {
    var position = await geolocation();
    Weather? data;
    await WeatherData().getData(position.latitude, position.longitude).then((value) { 
      data = value;
    });
    return data;
  }
}
