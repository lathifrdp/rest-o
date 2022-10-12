// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restoran_dicoding/src/bloc/restaurant/restaurant_bloc.dart';
import 'package:restoran_dicoding/src/helper/theme_colors.dart';
import 'package:restoran_dicoding/src/model/restaurants.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  TextEditingController editingController = TextEditingController();
  String? cari;
  RestaurantsResponse restaurantsResponse = RestaurantsResponse();
  RestaurantBloc restaurantBloc = RestaurantBloc();

  @override
  Widget build(BuildContext context) {
    restaurantBloc = BlocProvider.of<RestaurantBloc>(context);
    restaurantBloc.add(GetRestaurantListRequest());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: warningColor60,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Container(
            //color: whiteColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "Rest-O",
                    style: TextStyle(
                        color: warningColor60,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Recommendation restaurant for you!",
                  style: TextStyle(color: whiteColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    cursorColor: warningColor60,
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: grayColor40, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: grayColor40, width: 1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search",
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: warningColor60,
                        ),
                        hintStyle: TextStyle(
                            color: grayColor50, fontWeight: FontWeight.w400),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                BlocListener(
                  bloc: restaurantBloc,
                  listener: (context, state) {
                    if (state is GetRestaurantListSuccess) {
                      restaurantsResponse = state.response;
                    }
                    if (state is GetRestaurantListError) {
                      print(state.errorMessage);
                    }
                  },
                  child: BlocBuilder(
                    bloc: restaurantBloc,
                    builder: (context, state) {
                      if (state is GetRestaurantListSuccess) {
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount:
                                  restaurantsResponse.restaurants!.length,
                              itemBuilder: (ctx, idx) {
                                return content(
                                    restaurantsResponse.restaurants![idx]);
                              }),
                        );
                      }
                      return restaurantsResponse.restaurants != null
                          ? Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount:
                                      restaurantsResponse.restaurants!.length,
                                  itemBuilder: (ctx, idx) {
                                    return content(
                                        restaurantsResponse.restaurants![idx]);
                                  }),
                            )
                          : Container();
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget content(Restaurants e) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(12)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "${e.pictureId}",
              fit: BoxFit.cover,
              width: 80,
              height: 60,
            )),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${e.name}",
                style:
                    TextStyle(color: grayColor80, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 16,
                    color: grayColor50,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${e.city}",
                    style: TextStyle(color: grayColor50, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: grayColor60,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${e.rating}",
                    style: TextStyle(color: grayColor60, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        cari = query;
        // if (cari!.length > 2) {
        //   restaurantsResponse.restaurants!
        //       .where((element) => element.name!.contains(cari!))
        //       .toList();
        // }
      });
      return;
    } else {
      setState(() {
        cari = null;
        //_loadInit();
      });
    }
  }
}
