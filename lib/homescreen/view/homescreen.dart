import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newpaper_app/homescreen/provider/homeprovider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Homeprovider? homeproviderTrue;
  Homeprovider? homeproviderFalse;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Homeprovider>(context, listen: false).jsonParshingOfNewsdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of(context, listen: true);
    homeproviderFalse = Provider.of(context, listen: false);

    print("${homeproviderTrue!.newsJsonList.length}**************");
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          // appBar: AppBar(
          //   leading: IconButton(icon: Icon(Icons.local_airport),onPressed: () {
          //     homeproviderFalse!.jsonParshingOfNewsdata();
          //   },),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.search, color: Colors.grey.shade500),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search your choice",
                        style: GoogleFonts.poppins(color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        tabbarBox(),
                        SizedBox(
                          width: 5,
                        ),
                        tabbarBoxUnSelected("Story"),
                        SizedBox(
                          width: 5,
                        ),
                        tabbarBoxUnSelected("Video"),
                        SizedBox(
                          width: 5,
                        ),
                        tabbarBoxUnSelected("Recent"),
                      ],
                    ),
                  ),
                ),

                Container(
                  height: 650,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => mainNewsBox(
                        homeproviderTrue!.newsJsonList[index].urlToImage!,
                        homeproviderTrue!.newsJsonList[index+2].source!.name!,
                        homeproviderTrue!.newsJsonList[index+2].urlToImage!,
                        homeproviderTrue!.newsJsonList[index+2].title!,
                      homeproviderTrue!.newsJsonList[index].publishedAt!,
                    ),
                    itemCount: homeproviderTrue!.newsJsonList.length,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget mainNewsBox(String profilePath, String name, String contentImg,String newsDescription,String date) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 410,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("${profilePath}"),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${name}",
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              letterSpacing: 1,
                              fontSize: 12),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Image.asset(
                            "assets/tik/tik.png",
                            height: 17,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      " ${date}",
                      style:
                          GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey.shade50,
                  ),
                  alignment: Alignment.center,
                  child: Text("Follow",
                      style: GoogleFonts.mukta(
                          color: Colors.blue.shade500,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          fontSize: 14)),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 90,
              width: double.infinity,
              child: Text("${newsDescription}",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${contentImg}",
                      fit: BoxFit.cover,
                    ))),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "90K",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.comment, color: Colors.grey, size: 15),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "120",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.share, color: Colors.grey, size: 15),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "90",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12),
                ),
                Spacer(),
                Icon(Icons.more_horiz, color: Colors.grey, size: 15),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabbarBox() {
    return Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Text("Trending",
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 1)),
    );
  }

  Widget tabbarBoxUnSelected(String boxname) {
    return Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Text("${boxname}",
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 1)),
    );
  }
}
