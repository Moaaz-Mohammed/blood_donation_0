import 'package:blood_donation/Screens/volunteer_page.dart';
import 'package:flutter/material.dart';
import '../Styles/CustomColors.dart';

class VolunteerButton extends StatelessWidget {
  const VolunteerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.07,
      width: width * 0.7,
      decoration: BoxDecoration(
        color: CustomColors.primaryRedColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Volunteer()));
        },
        child: Text(
          'متـبـرع',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}
