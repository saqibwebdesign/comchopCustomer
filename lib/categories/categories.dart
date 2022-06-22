import 'package:flutter/material.dart';
import 'package:Comchop/Tabbar_screens/subCategories.dart';
import 'package:Comchop/models/categories_model.dart';
import 'package:Comchop/services/getcategories_api.dart';
import 'package:Comchop/widgets/dashboard_widget.dart';

class categories extends StatelessWidget {
  const categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url = 'https://comchop.com/public/storage/category/';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(


        
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    'Top Categories',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                FutureBuilder<Categories>(
                  future: get_categories().getcategories(),
                  builder: (c, snap) {
                    if (!snap.hasData)
                      return Align(
                          alignment: Alignment.center,
                          child: dashboardwidget().cicularbar());
                    if (snap.hasData)
                      return GridView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 180,
                                  childAspectRatio: 5 / 4,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15),
                          itemCount: snap.data!.categories!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => subcategories(
                                        name:snap.data!.categories![index].name
                                                ,
                                            id: snap.data!.categories![index].id
                                                .toString(),
                                          )),
                                );
                         
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: NetworkImage(url +
                                              "${snap.data!.categories![index].image}"),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                        child: Text(
                                      '${snap.data!.categories![index].name}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )),
                                  ],
                                ),
                              ),
                            );
                          });

                    if (snap.hasError)
                      print("ssssssssssssss" + snap.error.toString());
                    return Align(
                        alignment: Alignment.center,
                        child: dashboardwidget().cicularbar());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
