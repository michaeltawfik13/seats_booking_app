import 'package:flutter/material.dart';

class detailsScreen extends StatelessWidget {
  const detailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      height: 50,
      decoration: BoxDecoration(color: Colors.white
          ,boxShadow:[
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6
            )],
          borderRadius: BorderRadius.circular(15)),
      child:SingleChildScrollView(
        child: Column(
          children: [
            Text('شكل من الأدب الذي يكتبه الكاتب المسرحي، وعادة ما يتكون من حوار أو غناء بين الشخصيات، ويكون النص مخصصًا للأداء المسرحي بدلاً من مجرد القراءة. يتم تقديم المسرحيات على مستويات مختلفة، من مسارح وست اند في لندن و مسرح برودواي في نيويورك - والتي تعد أعلى مستوى من المسرح التجاري في العالم الناطق باللغة الإنجليزية - إلى المسرح الإقليمي، إلى المسرح المجتمعي، وكذلك مسرح الجامعة أو المدرسة. هناك مسرحيون مشهورون، مثل جورج برنارد شو، الذين لم يكونوا ليًذكروا لولا مسرحياتهم التي تم تمثيلها. يمكن أن يشير المصطلح "play" إلى كل من النصوص المكتوبة للكتاب المسرحيين وإلى أدائهم المسرحي الكامل.')
          ],
        ),
      ),
    );
  }
}
