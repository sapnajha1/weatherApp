import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// import 'package:weather_app_youtube/bloc/weather_bloc_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  // Define a TextEditingController for the search input.
  // final TextEditingController _searchController = TextEditingController();
  //
  // // Function to handle location search and weather retrieval.
  // void _searchLocationAndFetchWeather(String location) {
  //   // Implement location search and weather data retrieval here.
  //   Future<Map<String, dynamic>?> searchLocation(String location) async {
  //     final apiKey = '8441cff378e4a99b887fd5ecef091354'; // Replace with your Google API key
  //     final apiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=$_searchController&key=$apiKey';
  //
  //     final response = await http.get(Uri.parse(apiUrl));
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       return data;
  //     } else {
  //       // Handle error
  //       return null;
  //     }
  //   }
  // }
  //
  // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
  // var searchRecipe="Vegetable";
  // List hits = [];
  // @override
  // void initState(){
  //   super.initState();
  //   getApiData(searchRecipe);
  // }
  //
  // Future<void> getApiData(String searchRecipe) async{
  //   final response = await http.get(Uri.parse(
  //       'https://api.edamam.com/search?q=$searchRecipe&app_id=166f88cc&app_key=14530b3d9f8903c7b5b91274db72c713&from=0&to=100&calories=591-722&health=alcohol-free'));
  //
  //   if (response.statusCode==200) {
  //     final jsonData = json.decode(response.body);
  //     for(final hit in jsonData['hits']) {
  //       final recipe4 = hit['recipe'];
  //
  //       setState(() {
  //         hits = (jsonData['hits'] as List).map((data) =>
  //             Model.fromjson(data)).toList();
  //
  //       });
  //     }
  //   } else{
  //     throw Exception('Failed to load');
  //   }
  // }
  //
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm



//   Future<void> fetchWeatherByLocation(String location) async {
//     final apiKey = '8441cff378e4a99b887fd5ecef091354'; // Replace with your API key
//     final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey';
// // final apiUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=$_searchController&key=$apiKey'
//
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       // Process the fetched data and update the UI
//       // For example, update state with Bloc or directly set state here
//     } else {
//       // Handle error
//       throw Exception('Failed to fetch weather data');
//     }
//   }


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String enteredLocation ='';

  Widget getgreet(int hour) {
    if (hour >= 0 && hour < 4) {
      return Text(
        'Good Night',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (hour >= 4 && hour < 12) {
      return Text(
        'Good Morning',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (hour >= 12 && hour < 16) {
      return Text(
        'Good Afternoon',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (hour >= 16 && hour < 24) {
      return Text(
        'Good Evening',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        'Hello',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }


  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300 :
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/5.json.json'),
          );
      case >= 300 && < 400 :
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/2.json.json'),
          );
      case >= 500 && < 600 :
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/1.json.json'),
          );
      case >= 600 && < 700 :
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/snow.json.json'),
          );
      case >= 700 && < 800 :
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/haze.json.json'),
          );
      case == 800 :
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/sunrise.json.json'),
          );
      case > 800 && <= 804 :
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 250,
              maxWidth: 250,

              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/8.json.json',fit: BoxFit.cover),
          );

    // return Lottie.asset('assets1/3.json.json',
        // height: 2,width: 2,fit: BoxFit.cover);
        // return Image.asset(
        //     'images/7.png'
        // );
      default:
        return
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
              maxWidth: 200,
              // minHeight: 2,
              // minWidth: 2,
            ),
            child: Lottie.asset('assets1/8.json.json'),
          );
    }
  }

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    int currentHour = now.hour;

    Widget greetingWidget = getgreet(currentHour);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300 ,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF673AB7)
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFAB40)
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if(state is WeatherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Add a search bar and button for location search.

                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: TextField(
                          //         controller: widget._searchController,
                          //         decoration: InputDecoration(
                          //           hintText: 'Search location',
                          //           filled: true,
                          //           fillColor: Colors.white,
                          //         ),
                          //       ),
                          //     ),
                          //     ElevatedButton(
                          //       onPressed: () {
                          //         final location = widget._searchController.text;
                          //         widget._searchLocationAndFetchWeather(location);
                          //       },
                          //       child: Text('Search'),
                          //     ),
                          //   ],
                          // ),

                      // Container(
                      // decoration: BoxDecoration(color: Colors.black),
                      // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      // child:
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     TextField(
                      //         onChanged: (value){},
                      //         decoration: InputDecoration(hintText: "Search Recipe for today's menu",
                      //             suffix: IconButton(icon: Icon(Icons.search,color: Colors.white,),
                      //           onPressed: (){
                      //             // getApiData( searchRecipe);            },),
                      //             border: OutlineInputBorder(
                      //               borderRadius: BorderRadius.circular(50),),
                      //             fillColor: Color.fromARGB(240, 26, 58, 7).
                      //             withOpacity(0.84),

                          // Container(
                          //   height: 20,
                          //   width: MediaQuery.of(context).size.width*7/10,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(10.0),
                          //   ),
                          //   child: TextField(
                          //     onChanged: (value){
                          //       enteredLocation = value;
                          //     },
                          //     decoration: InputDecoration(
                          //       hintText: 'Search Location',
                          //       border: InputBorder.none,
                          //       suffix: IconButton(icon: Icon(Icons.search,color: Colors.white),
                          //         onPressed: () {
                          //         if (enteredLocation.isNotEmpty) {
                          //           widget.fetchWeatherByLocation(enteredLocation);
                          //         }
                          //           // fetchWeatherByLocation(enteredLocation);
                          //           // getApiData();
                          //         },),
                          //
                          //     ),
                          //
                          //   ),
                          // ),

                          // ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

                          Text(
                            '📍 ${state.weather.areaName}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                          const SizedBox(height: 8),
                          greetingWidget,
                          // const Text(
                          //   'Good Morning',
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 25,
                          //       fontWeight: FontWeight.bold
                          //   ),
                          // ),

                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          maxWidth: 200,
                          // minHeight: 2,
                          // minWidth: 2,
                        ),
                        child: Lottie.asset('assets1/8.json.json'),
                      ),
                          // Lottie.asset('assets1/2.json.json',),
                          // Image.asset('images/1.png',scale: 3,),
                          // getWeatherIcon(state.weather.weatherConditionCode!),
                          SizedBox(height: 100,),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                //       ConstrainedBox(
                                //       constraints: BoxConstraints(
                                //         maxHeight: 2,
                                //         maxWidth: 2,
                                //         // minHeight: 2,
                                //         // minWidth: 2,
                                //       ),
                                //          child: Lottie.asset('1.json.json'),
                                // ),
                                  Image.asset(
                                    'images/sun.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunrise',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunrise!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  // ConstrainedBox(
                                  //   constraints: BoxConstraints(
                                  //     maxHeight: 2,
                                  //     maxWidth: 2,
                                  //     // minHeight: 2,
                                  //     // minWidth: 2,
                                  //   ),
                                  //   child: Lottie.asset('6.json.json'),
                                  // ),
                                  Image.asset(
                                    'images/moon.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunset',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunset!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  children: [
                                    // ConstrainedBox(
                                    //   constraints: BoxConstraints(
                                    //     maxHeight: 2,
                                    //     maxWidth: 2,
                                    //     // minHeight: 2,
                                    //     // minWidth: 2,
                                    //   ),
                                    //   child: Lottie.asset('3.json.json'),
                                    // ),
                                    Image.asset(
                                      'images/max.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Temp Max',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "${state.weather.tempMax!.celsius!.round()} °C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ]
                              ),
                              Row(
                                  children: [
                                    // ConstrainedBox(
                                    //   constraints: BoxConstraints(
                                    //     maxHeight: 2,
                                    //     maxWidth: 2,
                                    //     // minHeight: 2,
                                    //     // minWidth: 2,
                                    //   ),
                                    //   child: Lottie.asset('4.json.json'),
                                    // ),
                                    Image.asset(
                                      'images/min.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Temp Min',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          "${state.weather.tempMin!.celsius!.round()} °C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    )
                                  ]
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}