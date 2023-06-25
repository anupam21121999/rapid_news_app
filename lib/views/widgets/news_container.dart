import 'package:daily_news_app/views/details_view.dart';
import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsCnt;
  String newsDesc;
  String newsUrl;

  NewsContainer({Key? key, required this.imgUrl, required this.newsHead, required this.newsCnt,required this.newsDesc, required this.newsUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage.assetNetwork(
                height: 400,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                placeholder: "assets/images/news.jpg", image: imgUrl),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    newsHead.length > 70 ? newsHead.substring(0, 70) :
                    newsHead,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(newsDesc,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    newsCnt != "--" ?
                    newsCnt.length > 100 ? newsCnt.substring(0, 100) :
                    "${newsCnt.toString().substring(0, newsCnt.length-5)}..." : newsCnt,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsViewScreen(newsUrl: newsUrl),));
                      },
                      child: Text("Read More")
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
