import 'package:bitserver/core/Strings/String.dart';
import 'package:flutter/material.dart';

const bgColor = Color(0XFF021B3A);

const curveGradient = RadialGradient(
  colors: <Color>[
    Color(0XFF313F70),
    Color(0XFF203063),
  ],
  focalRadius: 16,
);

const vpnStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.white,
  fontSize: 34,
);

const txtSpeedStyle = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 15,
  color: Color(0XFF6B81BD),
);

const greenGradient = LinearGradient(
  colors: <Color>[
    Color(0XFF00D58D),
    Color(0XFF00C2A0),
  ],
);
const Lithuania="https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Flag_of_Lithuania.svg/255px-Flag_of_Lithuania.svg.png";
const canada='https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/255px-Flag_of_Canada_%28Pantone%29.svg.png';
const Switzerland="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Switzerland.svg/255px-Flag_of_Switzerland.svg.png";
const Bulgaria="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Bulgaria.svg/255px-Flag_of_Bulgaria.svg.png";
const Italy="https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/255px-Flag_of_Italy.svg.png";
const Norway="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Norway.svg/255px-Flag_of_Norway.svg.png";
const Portugal="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/255px-Flag_of_Portugal.svg.png";
const Spain="https://upload.wikimedia.org/wikipedia/en/thumb/9/9a/Flag_of_Spain.svg/255px-Flag_of_Spain.svg.png";
const kenyaFlagUrl =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Kenya.svg/255px-Flag_of_Kenya.svg.png';

const ugandaFlagUrl =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flag_of_Uganda.svg/255px-Flag_of_Uganda.svg.png';

String countryPic(String st)
{
  switch(st.toLowerCase())
  {
    case "ca":return canada;break;
    case "it":return Italy;break;
    case "pt":return Portugal;break;
    case "lt":return Lithuania;break;
    case "ch":return Switzerland;break;
    case "bg":return Bulgaria;break;
    case "no":return Norway;break;
    case "es":return Spain;break;
  }
}
TextStyle connectedStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w600,
  fontFamily: StringData.fontPr,
  height: 1.6,
  color: Colors.white,
);
TextStyle connectedGreenStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w600,
  color: Colors.greenAccent,
  fontFamily: StringData.fontPr,

);
TextStyle connectedSubtitle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  fontFamily: StringData.fontPr,

  color: Colors.white,
);
