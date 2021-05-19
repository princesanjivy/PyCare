import 'package:flutter/material.dart';

class TranslationText with ChangeNotifier {
  String currentLanguage = "english";

  Map translation = {
    "pudhuvai care": ["புதுவை கேர்", "पुढुवाई केयर "],
    "address": ["முகவரி", "पता"],
    "puducherry": ["புதுச்சேரி", "पुदुचेरी"],
    "hospital": ["மருத்துவமனை", "अस्पताल"],
    "active": ["சிகிச்சையில்", "सक्रिय"],
    "cured": ["குணமானோர்\nவிகிதம்", "ठीक हो"],
    "death": ["இறப்பு", "मौत"],
    "covid-19 tracker": ["கோவிட்-19 டிராக்கர்", "कोविड-19 ट्रैकर"],
    "developers": ["டெவலப்பர்கள்", "डेवलपर्स"],
    "home": ["வீடு", "घर"],
    "total reported": ["பதிவாகியுள்ளன", "कुल सूचना दी"],
    "precautions": ["தற்காப்பு நடவடிக்கைகள்", "एहतियात"],
    "don't forget to wear your mask": [
      "உங்கள் முகமூடி அணிய மறக்க தெரியவில்லை",
      "न अपने मुखौटा पहनने के लिए भूल जाते हैं"
    ],
    "ensure you sanitize your hands regularly": [
      "நீங்கள் ஒழுங்காக உங்கள் கையில் துப்புரவாக்குங்கள் உறுதி",
      "आप अपने हाथ नियमित रूप से स्वच्छ सुनिश्चित"
    ],
    "map": ["சிகிச்சை மையங்கள்", "नक्शा"],
    "about us": ["எங்களை பற்றி", "हमारे बारे में"],
    "list of hospitals": ["சிகிச்சை மையங்கள்", "अस्पतालों की सूची"],
    "filter ": ["வடிகட்டி", "फिल्टर"],
    "sort": ["வகைபடுத்து", "तरह"],
    "wash your hands regularly": [
      "வழக்கமாக உங்கள் கைகளை சுத்தம்",
      "अपने हाथों को नियमित रूप से धोने"
    ],
    "use gloves when required": [
      "தேவைப்படும் போது கையுறைகள் பயன்படுத்த",
      "जब जरूरत दस्ताने का उपयोग"
    ],
    "vaccine drive": ["தடுப்பூசி விபரங்கள்", "वैक्सीन ड्राइव"],
    "get vaccinated": ["கிடைக்கும் தடுப்பூசி", "प्राप्त टीका"],
    "indira gandhi government general hospital and post graduate institue": [
      "இந்திரா காந்தி அரசு பொது மருத்துவமனை மற்றும் பட்ட மேற்படிப்பு இன்ஸ்டிடியூட் ஆப்",
      "इंदिरा गांधी सरकार जनरल अस्पताल और स्नातकोत्तर ऑफ"
    ],
    "indira gandhi medical college & hospital": [
      "இந்திரா காந்தி மருத்துவ கல்லூரி மற்றும் மருத்துவமனையில்",
      "इंदिरा गांधी मेडिकल कॉलेज एंड हॉस्पिटल"
    ],
    "dental college": ["பல் மருத்துவ கல்லூரி", "डेंटल कॉलेज"],
    "community health centre karikalampakkam": [
      "சமூக சுகாதார மையம் கரிகலம்பாக்கம்",
      "सामुदायिक स्वास्थ्य केंद्र Karikalampakkam"
    ],
    "pondicherry institute of medical sciences": [
      "மருத்துவ அறிவியல் பாண்டிச்சேரி இன்ஸ்டிடியூட்",
      "आयुर्विज्ञान संस्थान पांडिचेरी"
    ],
    "the jawaharlal institute of postgraduate medical education & research  jipmer":
        [
      "முதுகலை மருத்துவ கல்வி மற்றும் ஆராய்ச்சி ஜிப்மர் ஜவகர்லால் இன்ஸ்டிடியூட் ஆப்",
      "स्नातकोत्तर चिकित्सा शिक्षा एवं अनुसंधान जेआईपीएमईआर की जवाहरलाल इंस्टीट्यूट"
    ],
    "primary health centre nettapakkam": [
      "ஆரம்ப சுகாதார மையம் நெட்டப்பாக்கம்",
      "प्राथमिक स्वास्थ्य केन्द्र Nettapakkam"
    ],
    "sri venkateshwaraa medical college": [
      "ஸ்ரீ வெங்கடேஸ்வரா மருத்துவக் கல்லூரி",
      "श्री Venkateshwaraa मेडिकल कॉलेज"
    ],
    "mahatma gandhi medical college": [
      "மகாத்மா காந்தி மருத்துவ கல்லூரி",
      "महात्मा गांधी मेडिकल कॉलेज"
    ],
    "sri lakshmi narayana institute of medical science": [
      "மெடிக்கல் சயின்ஸ் ஸ்ரீ லட்சுமி நாராயண நிறுவனம்",
      "श्री लक्ष्मी नारायण चिकित्सा विज्ञान संस्थान"
    ],
    "sri manakula vinayagar medical college": [
      "ஸ்ரீ மனகுல விநாயகர் மருத்துவக் கல்லூரி",
      "श्री मनाकुला विनेगर मेडिकल कॉलेज"
    ],
    "aarupadai veedu medical college": [
      "ஆருபடை வீது மருத்துவக் கல்லூரி",
      "Aarupadai विदु मेडिकल कॉलेज"
    ],
    "avmc": ["எ.வி.எம்.சி", "ए वी एम सी"],
    "chc karikalampakkam": [
      "சி.எச்.சி கரிக்கலாம்பாக்கம்",
      "सी एच सी करिकलमपक्कम"
    ],
    "igggh & pgi": ["ஐஜிஜிஜிஎச் & பிஜிஐ", "आई जी जी जी एच एंड पी जी आई"],
    "igmc": ["ஐ.ஜி.எம்.சி", "आई जी एम सी"],
    "jipmer": ["ஜேஐபிஎம்இஆர்", "जिपमेर"],
    "mgmc": ["எம்.ஜி.எம்.சி", "एम जी एम सी"],
    "mvr": ["எம்.வி.ஆர்", "एम वी आर"],
    "phc nettapakkam": ["பிஎச்சி நெட்டபாக்கம்", "न्यू मेडिकल सेंटर"],
    "pims": ["பி.ஐ.எம்.எஸ்", "पी आई एम एस"],
    "slims": ["எஸ்.எல்.ஐ.எம்.எஸ்", "स्लिम्स"],
    "smvmc": ["எஸ்.எம்.வி.எம்.சி", "एसएमवीएमसी"],
    "svmc": ["எஸ்.வி.எம்.சி", "एस वी एम सी"],
    "be well hospital": ["பி வெள் மருத்துவமனை", "बी वेल हॉस्पिटल"],
    "rani hospital": ["ராணி மருத்துவமனை", "रानी अस्पताल"],
    "new medical centre": ["புதிய மருத்துவ மையம்", "न्यू मेडिकल सेंटर"],
    "kumaran hospital": ["குமரன் மருத்துவமனையில்", "कुमारन अस्पताल"],
    "karaikal": ["காரைக்கால்", "कराईकल"],
    "vinayaka missions medical college karaikal": [
      "விநாயகா மிஷன்ஸ் மருத்துவக் கல்லூரி காரைக்கால்",
      "विनायक मिशन मेडिकल कॉलेज कराईकल"
    ],
    "description about dsc": [
      "டிஎஸ்சிக்கு பற்றி விளக்கம்",
      "विवरण डीएससी बारे में"
    ],
    // "an outcome of dsc pec puducherry": [
    //   "An outcome of DSC PEC Puducherry",
    //   "An outcome of DSC PEC Puducherry"
    // ],
    "dr. selvaradjou ka": ["பேராசிரியர் க. செல்வராஜூ", "सेल्वरज"],
    "mentor": ["எண்ணம்", "सिर"],
    "durga prasad": ["துர்கா பிரசாத்", "दुर्गा प्रस्साद "],
    "dsc lead": ["குழு தலைமை", "लीड"],
    "monica emmanuel": ["மோனிகா இம்மானுவல்", "मोनिका इमैनुएल"],
    "ui designer": ["பயனர் இடைமுகம் வடிவமைப்புகள்", "यूआई डिजाइनर"],
    "logaprasanna": ["லோகப்பிரசன்னா", "लोगाप्रसन्ना"],
    "vignesh hendrix": ["விக்னேஷ் ஹெண்ட்ரிக்ஸ்", "विग्नेश हेंड्रिक्स"],
    "ayush singh": ["ஆயுஸ் சிங்", "आयुष सिंह"],
    "anshul sharma": ["அன்ஷுல் சர்மா", "अंशुल शर्मा"],
    "frontend developer": ["முன்நிலை டெவலப்பர்", "अग्रणी डेवलपर"],
    "prince sanjivy": ["சஞ்சிவி", "संजीवी"],
    "aswini s": ["அஸ்வினி எஸ்", "अश्विनी एस"],
    "akshay r r": ["அக்ஷய் ஆர்.ஆர்", "अक्षय आर आर"],
    "backend developer": ["பின்தளத்தில் டெவலப்பர்", "बैकएंड डेवलपर"],
    "hospital detiails": ["மருத்துவமனையில் detiails", "अस्पताल विवरण"],
    "institute type": ["நிறுவனம் வகை", "संस्थान प्रकार"],
    "private": ["தனியார்", "निजी"],
    "government": ["அரசாங்கம்", "सरकारी"],
    "nursing homes": ["மருத்துவ இல்லம்", "नर्सिंग होम"],
    "location": ["சிகிச்சை மையங்கள்", "स्थान"],
    "more details": ["கூடுதல் தகவல்கள்", "अधिक जानकारी"],
    "kalathumettupathai, ganapathichettikulam village no 20, kalapet, puducherry 605014":
        [
      "கலாத்துமேட்டுபதி, கணபதிச்செட்டிகுளம் கிராம எண் 20, கலப்பேட்டை, புதுச்சேரி 605014",
      "कलाथुमेट्टुपथाई, गणपतिचेट्टीकुलम ग्राम संख्या २०, कलापेट, पुडुचेरी ६०५०१४"
    ],
    "13-a, pondy-villupuram main road, ariyur, puducherry-605 102": [
      "13-ஏ, Pondy-விழுப்புரம் மெயின் ரோடு, Ariyur, புதுச்சேரி-605 102.",
      "13-ए, पोंडी-विल्लुपुरम मेन रोड, अरियुर, पुडुचेरी-605 102"
    ],
    "pondicherry - cuddalore rd, ecr, pillayarkuppam, puducherry 607402": [
      "பாண்டிச்சேரி - கடலூர் ஆர்.டி, இ.சி.ஆர், பிள்ளையர்குப்பம், புதுச்சேரி 607402",
      "पांडिचेरी - कुड्डालोर रोड, ईसीआर, पिल्लयार्कुप्पम, पुडुचेरी 607402"
    ],
    "osudu agaram village, villianur commune, kudapakkam post, puducherry, 605502":
        [
      "Osudu அகரம் கிராமம் வில்லியனூர் கம்யூன் Kudapakkam போஸ்ட், புதுச்சேரி, 605502",
      "ओजुडु अकरम गांव, विलियनुर कम्यून, कुडापक्कम पोस्ट, पुडुचेरी, 605502"
    ],
    "madagadipet, kalitheerthalkuppam, 605107": [
      "மடகடிபேட், காளிதீர்த்தல்குப்பம், 605107",
      "मेडागादिपेट, कालीतीर्थलकुप्पम, 605107"
    ],
    "commune panchayat, pondy cuddalore main road kirumampakkam bahour, kirumampakkam, puducherry 607402":
        [
      "கம்யூன் பஞ்சாயத்து, பாண்டி கடலூர் மெயின் ரோடு கிருமம்பாக்கம் பஹூர், கிருமம்பாக்கம், புதுச்சேரி 607402",
      "कम्यून पंचायत, पांडे सुद्दलोर मेन रोड किरुमनपक्कम बहाउर, किरुमनपक्कम, पुडुचेरी, 607402"
    ],
    "kathirkamam, puducherry, 605009": [
      "கதிர்காமம், புதுச்சேரி, 605009",
      "कटिरकमम, पुडुचेरी, 605009"
    ],
    "jipmer campus rd, jipmer campus, puducherry, 605006": [
      "ஜிப்மர் வளாகம் St, ஜிப்மர் வளாகம், புதுச்சேரி, 605006",
      "जिपमेर कैंपस रोड, जिपमेर कैंपस, पुडुचेरी, 605006"
    ],
    "4 indira nagar, pondicherry 605006": [
      "#ERROR!",
      "4 इंदिरा नगर, पांडिचेरी 605006"
    ],
    "15, east coast rd, maduvu pet, green gardens, kottupalayam, puducherry, 605008":
        [
      "15, கிழக்கு கடற்கரை St, Maduvu செல்லப்பிராணி, பச்சை பூங்கா, Kottupalayam, புதுச்சேரி, 605008",
      "15 \n, ईस्ट कोस्ट, मेक पेट, ग्रीन गार्डन, कोट्टुपालयम, पुडुचेरी, 605008"
    ],
    "no: 27, vazhudavoor rd, near rajiv gandhi statue, pettaiyanchathiram, aruthra nagar, puducherry, 605009":
        [
      "இல்லை: 27, Vazhudavoor St, ராஜீவ் காந்தி சிலை, Pettaiyanchathiram, Aruthra நகர், புதுச்சேரி, 605009 அருகே",
      "नंबर: 27, वझुदावूर रोड, राजीव गांधी की प्रतिमा के पास, पेट्टैयांचथिरम, अरुथरा नगर, पुडुचेरी, 605009"
    ],
    "no:470, mg road, puducherry, 605001": [
      "இல்லை: 470, எம்ஜி ரோட்டில் புதுச்சேரி, 605001",
      "नंबर:470, एमजी रोड, पुडुचेरी, 605001"
    ],
    "12 & 13 ecr main road near sivaji statue lawspet, karuvadikuppam, puducherry, 605008":
        [
      "12 & 13 ECR மெயின் ரோடு அருகே சிவாஜி சிலை Lawspet, Karuvadikuppam, புதுச்சேரி, 605008",
      "12 और 13 ईसीआर मेन रोड शिवाजी स्टैच्यू लॉस्पेट के पास, करुवादिकुप्पम, पुडुचेरी, 605008"
    ],
    "rights club centre, netaji subhash chandra bose salai ( gingee salai ), white town, puducherry, 605001":
        [
      "உரிமைகள் கிளப் மையம், நேதாஜி சுபாஷ் சந்திர போஸ் சாலை (செஞ்சி சாலை), வெள்ளை டவுன், புதுச்சேரி, 605001",
      "\nराइट्स क्लब सेंटर, नेताजी सुभाष चंद्र बोस सलाई (गिंगी सलाई), व्हाइट टाउन, पुडुचेरी, 605001"
    ],
    "madugarai main road, karikalampakkam, puducherry, 605106": [
      "Madugarai மெயின் ரோடு, Karikalampakkam, புதுச்சேரி, 605106",
      "मधुगरी मेन रोड, करिकलमपक्कम, पुडुचेरी, 605106"
    ],
    "valavanur, main road, madukarai, puducherry 605105": [
      "வளவனூர், முக்கிய சாலை, மதுகரை, புதுச்சேரி 605105",
      "वलवनूर, मेन रोड, मदुकराई, पुडुचेरी 605105"
    ],
    "website": ["இணையதளம்", "वेबसाइट"],
    "phone number": ["தொலைபேசி எண்கள்", "दूरभाष संख्या"],
    "availability of": ["கிடைப்பது", "उपलब्धता"],
    "oxygen beds": ["ஆக்சிஜன் படுக்கைகள்", "ऑक्सीजन बेड"],
    "ventilator beds": ["மறுபடியும் படுக்கைகள்", "वेंटिलेटर बेड"],
    "isolation beds": ["தனிமை படுக்கைகள்", "अलगाव बिस्तर"],
  };

  void setCurrentLanguage(String lang) {
    this.currentLanguage = lang;
    notifyListeners();
  }

  String getTranslatedText(BuildContext context, String text) {
    String t = text;

    if (currentLanguage == "english") {
      return text;
    } else {
      if (currentLanguage == "tamil") {
        return translation[text.toLowerCase()] == null
            ? t
            : translation[text.toLowerCase()][0];
      } else {
        return translation[text.toLowerCase()] == null
            ? t
            : translation[text.toLowerCase()][1];
      }
    }
  }
}
