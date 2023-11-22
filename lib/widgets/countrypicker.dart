import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:http/http.dart'as http;
class CountryPicker extends StatefulWidget {
  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
   List<Map<String, dynamic>> countries = [
    {
            "id": 1,
            "code": "AF",
            "name": "Afghanistan",
            "name_official": "Islamic Republic of Afghanistan",
            "latitude": "33.98299275",
            "longitude": "66.39159363",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AF-32.png"
        },
        {
            "id": 2,
            "code": "AL",
            "name": "Albania",
            "name_official": "Republic of Albania",
            "latitude": "41.00017358",
            "longitude": "19.87170014",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AL-32.png"
        },
        {
            "id": 3,
            "code": "DZ",
            "name": "Algeria",
            "name_official": "People's Democratic Republic of Algeria",
            "latitude": "27.89861690",
            "longitude": "3.19771194",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/DZ-32.png"
        },
        {
            "id": 4,
            "code": "AD",
            "name": "Andorra",
            "name_official": "Principality of Andorra",
            "latitude": "42.54057088",
            "longitude": "1.55201340",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AD-32.png"
        },
        {
            "id": 5,
            "code": "AO",
            "name": "Angola",
            "name_official": "Republic of Angola",
            "latitude": "-12.16469683",
            "longitude": "16.70933622",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AO-32.png"
        },
        {
            "id": 6,
            "code": "AG",
            "name": "Antigua and Barbuda",
            "name_official": "Antigua and Barbuda",
            "latitude": "17.48060423",
            "longitude": "-61.42014426",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AG-32.png"
        },
        {
            "id": 7,
            "code": "AR",
            "name": "Argentina",
            "name_official": "Argentine Republic",
            "latitude": "-38.01529308",
            "longitude": "-64.97897469",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AR-32.png"
        },
        {
            "id": 8,
            "code": "AM",
            "name": "Armenia",
            "name_official": "Republic of Armenia",
            "latitude": "40.13475528",
            "longitude": "45.01072318",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AM-32.png"
        },
        {
            "id": 9,
            "code": "AU",
            "name": "Australia",
            "name_official": "Australia",
            "latitude": "-26.29594646",
            "longitude": "133.55540944",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AU-32.png"
        },
        {
            "id": 10,
            "code": "AT",
            "name": "Austria",
            "name_official": "Republic of Austria",
            "latitude": "47.63125476",
            "longitude": "13.18776731",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AT-32.png"
        },
        {
            "id": 11,
            "code": "AZ",
            "name": "Azerbaijan",
            "name_official": "Republic of Azerbaijan",
            "latitude": "40.35321757",
            "longitude": "47.46706372",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AZ-32.png"
        },
        {
            "id": 12,
            "code": "BS",
            "name": "Bahamas",
            "name_official": "Commonwealth of the Bahamas",
            "latitude": "24.45991732",
            "longitude": "-77.68192453",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BS-32.png"
        },
        {
            "id": 13,
            "code": "BH",
            "name": "Bahrain",
            "name_official": "Kingdom of Bahrain",
            "latitude": "25.90740996",
            "longitude": "50.65932354",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BH-32.png"
        },
        {
            "id": 14,
            "code": "BD",
            "name": "Bangladesh",
            "name_official": "People's Republic of Bangladesh",
            "latitude": "24.08273251",
            "longitude": "90.49915527",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BD-32.png"
        },
        {
            "id": 15,
            "code": "BB",
            "name": "Barbados",
            "name_official": "Barbados",
            "latitude": "13.19383077",
            "longitude": "-59.54319600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BB-32.png"
        },
        {
            "id": 16,
            "code": "BY",
            "name": "Belarus",
            "name_official": "Republic of Belarus",
            "latitude": "53.58628747",
            "longitude": "27.95338900",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BY-32.png"
        },
        {
            "id": 17,
            "code": "BE",
            "name": "Belgium",
            "name_official": "Kingdom of Belgium",
            "latitude": "50.49593874",
            "longitude": "4.46993600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BE-32.png"
        },
        {
            "id": 18,
            "code": "BZ",
            "name": "Belize",
            "name_official": "Belize",
            "latitude": "17.21153631",
            "longitude": "-88.01424956",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BZ-32.png"
        },
        {
            "id": 19,
            "code": "BJ",
            "name": "Benin",
            "name_official": "Republic of Benin",
            "latitude": "9.37180859",
            "longitude": "2.29386134",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BJ-32.png"
        },
        {
            "id": 20,
            "code": "BT",
            "name": "Bhutan",
            "name_official": "Kingdom of Bhutan",
            "latitude": "27.50752756",
            "longitude": "90.43360300",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BT-32.png"
        },
        {
            "id": 21,
            "code": "BA",
            "name": "Bosnia and Herzegovina",
            "name_official": "Bosnia and Herzegovina",
            "latitude": "44.00040856",
            "longitude": "17.81640910",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BA-32.png"
        },
        {
            "id": 22,
            "code": "BW",
            "name": "Botswana",
            "name_official": "Republic of Botswana",
            "latitude": "-22.18279485",
            "longitude": "24.22344422",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BW-32.png"
        },
        {
            "id": 23,
            "code": "BR",
            "name": "Brazil",
            "name_official": "Federative Republic of Brazil",
            "latitude": "-11.80965046",
            "longitude": "-53.33152600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BR-32.png"
        },
        {
            "id": 24,
            "code": "BN",
            "name": "Brunei Darussalam",
            "name_official": "Brunei Darussalam",
            "latitude": "4.54189364",
            "longitude": "114.60132823",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BN-32.png"
        },
        {
            "id": 25,
            "code": "BG",
            "name": "Bulgaria",
            "name_official": "Republic of Bulgaria",
            "latitude": "42.70160678",
            "longitude": "25.48583200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BG-32.png"
        },
        {
            "id": 26,
            "code": "BF",
            "name": "Burkina Faso",
            "name_official": "Burkina Faso",
            "latitude": "12.22492458",
            "longitude": "-1.56159100",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BF-32.png"
        },
        {
            "id": 27,
            "code": "BI",
            "name": "Burundi",
            "name_official": "Republic of Burundi",
            "latitude": "-3.40499707",
            "longitude": "29.88592902",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BI-32.png"
        },
        {
            "id": 28,
            "code": "KH",
            "name": "Cambodia",
            "name_official": "Kingdom of Cambodia",
            "latitude": "12.83288883",
            "longitude": "104.84814273",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KH-32.png"
        },
        {
            "id": 29,
            "code": "CM",
            "name": "Cameroon",
            "name_official": "Republic of Cameroon",
            "latitude": "7.38622543",
            "longitude": "12.72825915",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CM-32.png"
        },
        {
            "id": 30,
            "code": "CA",
            "name": "Canada",
            "name_official": "Canada",
            "latitude": "60.36196817",
            "longitude": "-106.69833150",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CA-32.png"
        },
        {
            "id": 31,
            "code": "CV",
            "name": "Cabo Verde",
            "name_official": "Republic of Cabo Verde",
            "latitude": "15.11988711",
            "longitude": "-23.60517010",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CV-32.png"
        },
        {
            "id": 32,
            "code": "CF",
            "name": "Central African Republic",
            "name_official": "Central African Republic",
            "latitude": "6.82541830",
            "longitude": "20.64281514",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CF-32.png"
        },
        {
            "id": 33,
            "code": "TD",
            "name": "Chad",
            "name_official": "Republic of Chad",
            "latitude": "14.80342407",
            "longitude": "18.78714064",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TD-32.png"
        },
        {
            "id": 34,
            "code": "CL",
            "name": "Chile",
            "name_official": "Republic of Chile",
            "latitude": "-38.01760790",
            "longitude": "-71.40014474",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CL-32.png"
        },
        {
            "id": 35,
            "code": "CN",
            "name": "China",
            "name_official": "People's Republic of China",
            "latitude": "36.71457440",
            "longitude": "103.55819197",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CN-32.png"
        },
        {
            "id": 36,
            "code": "CO",
            "name": "Colombia",
            "name_official": "Republic of Colombia",
            "latitude": "3.68182320",
            "longitude": "-73.53927436",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CO-32.png"
        },
        {
            "id": 37,
            "code": "KM",
            "name": "Comoros",
            "name_official": "Union of the Comoros",
            "latitude": "-11.64529989",
            "longitude": "43.33330200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KM-32.png"
        },
        {
            "id": 38,
            "code": "CG",
            "name": "Congo",
            "name_official": "Republic of the Congo",
            "latitude": "-0.68967806",
            "longitude": "15.69033190",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CG-32.png"
        },
        {
            "id": 39,
            "code": "CR",
            "name": "Costa Rica",
            "name_official": "Republic of Costa Rica",
            "latitude": "9.98427463",
            "longitude": "-84.09949534",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CR-32.png"
        },
        {
            "id": 40,
            "code": "HR",
            "name": "Croatia",
            "name_official": "Republic of Croatia",
            "latitude": "44.81372482",
            "longitude": "16.29039507",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/HR-32.png"
        },
        {
            "id": 41,
            "code": "CU",
            "name": "Cuba",
            "name_official": "Republic of Cuba",
            "latitude": "21.54513189",
            "longitude": "-79.00064743",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CU-32.png"
        },
        {
            "id": 42,
            "code": "CY",
            "name": "Cyprus",
            "name_official": "Republic of Cyprus",
            "latitude": "35.12450768",
            "longitude": "33.42986100",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CY-32.png"
        },
        {
            "id": 43,
            "code": "CZ",
            "name": "Czechia",
            "name_official": "Czech Republic",
            "latitude": "49.76026136",
            "longitude": "15.53888197",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CZ-32.png"
        },
        {
            "id": 44,
            "code": "CI",
            "name": "Côte d'Ivoire",
            "name_official": "Republic of Côte d'Ivoire",
            "latitude": "7.59684148",
            "longitude": "-5.49214636",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CI-32.png"
        },
        {
            "id": 45,
            "code": "DK",
            "name": "Denmark",
            "name_official": "Kingdom of Denmark",
            "latitude": "54.71794021",
            "longitude": "9.41938953",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/DK-32.png"
        },
        {
            "id": 46,
            "code": "DJ",
            "name": "Djibouti",
            "name_official": "Republic of Djibouti",
            "latitude": "11.75959257",
            "longitude": "42.65344839",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/DJ-32.png"
        },
        {
            "id": 47,
            "code": "DM",
            "name": "Dominica",
            "name_official": "Commonwealth of Dominica",
            "latitude": "15.41473963",
            "longitude": "-61.37097400",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/DM-32.png"
        },
        {
            "id": 48,
            "code": "DO",
            "name": "Dominican Republic",
            "name_official": "Dominican Republic",
            "latitude": "18.73076761",
            "longitude": "-70.16264900",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/DO-32.png"
        },
        {
            "id": 49,
            "code": "EC",
            "name": "Ecuador",
            "name_official": "Republic of Ecuador",
            "latitude": "-1.22919037",
            "longitude": "-78.55693916",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/EC-32.png"
        },
        {
            "id": 50,
            "code": "EG",
            "name": "Egypt",
            "name_official": "Arab Republic of Egypt",
            "latitude": "26.71650873",
            "longitude": "30.80250000",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/EG-32.png"
        },
        {
            "id": 51,
            "code": "SV",
            "name": "El Salvador",
            "name_official": "Republic of El Salvador",
            "latitude": "13.79043561",
            "longitude": "-88.89652800",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SV-32.png"
        },
        {
            "id": 52,
            "code": "GQ",
            "name": "Equatorial Guinea",
            "name_official": "Republic of Equatorial Guinea",
            "latitude": "1.65068442",
            "longitude": "10.26789700",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GQ-32.png"
        },
        {
            "id": 53,
            "code": "ER",
            "name": "Eritrea",
            "name_official": "State of Eritrea",
            "latitude": "15.21227764",
            "longitude": "39.61204792",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ER-32.png"
        },
        {
            "id": 54,
            "code": "EE",
            "name": "Estonia",
            "name_official": "Republic of Estonia",
            "latitude": "58.74041141",
            "longitude": "25.38165099",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/EE-32.png"
        },
        {
            "id": 55,
            "code": "ET",
            "name": "Ethiopia",
            "name_official": "Federal Democratic Republic of Ethiopia",
            "latitude": "9.10727589",
            "longitude": "39.84148164",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ET-32.png"
        },
        {
            "id": 56,
            "code": "FJ",
            "name": "Fiji",
            "name_official": "Republic of Fiji",
            "latitude": "-17.71219757",
            "longitude": "178.06503600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/FJ-32.png"
        },
        {
            "id": 57,
            "code": "FI",
            "name": "Finland",
            "name_official": "Republic of Finland",
            "latitude": "64.69610892",
            "longitude": "26.36339137",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/FI-32.png"
        },
        {
            "id": 58,
            "code": "FR",
            "name": "France",
            "name_official": "French Republic",
            "latitude": "46.48372145",
            "longitude": "2.60926281",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/FR-32.png"
        },
        {
            "id": 59,
            "code": "GA",
            "name": "Gabon",
            "name_official": "Gabonese Republic",
            "latitude": "-0.43426435",
            "longitude": "11.43916591",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GA-32.png"
        },
        {
            "id": 60,
            "code": "GM",
            "name": "Gambia",
            "name_official": "Islamic Republic of the Gambia",
            "latitude": "13.15921146",
            "longitude": "-15.35956748",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GM-32.png"
        },
        {
            "id": 61,
            "code": "GE",
            "name": "Georgia",
            "name_official": "Georgia",
            "latitude": "41.82754301",
            "longitude": "44.17329916",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GE-32.png"
        },
        {
            "id": 62,
            "code": "DE",
            "name": "Germany",
            "name_official": "Federal Republic of Germany",
            "latitude": "50.82871201",
            "longitude": "10.97887975",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/DE-32.png"
        },
        {
            "id": 63,
            "code": "GH",
            "name": "Ghana",
            "name_official": "Republic of Ghana",
            "latitude": "7.69154199",
            "longitude": "-1.29234904",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GH-32.png"
        },
        {
            "id": 64,
            "code": "GR",
            "name": "Greece",
            "name_official": "Hellenic Republic",
            "latitude": "38.52254746",
            "longitude": "24.53794505",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GR-32.png"
        },
        {
            "id": 65,
            "code": "GD",
            "name": "Grenada",
            "name_official": "Grenada",
            "latitude": "12.11644807",
            "longitude": "-61.67899400",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GD-32.png"
        },
        {
            "id": 66,
            "code": "GT",
            "name": "Guatemala",
            "name_official": "Republic of Guatemala",
            "latitude": "15.72598421",
            "longitude": "-89.96707712",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GT-32.png"
        },
        {
            "id": 67,
            "code": "GN",
            "name": "Guinea",
            "name_official": "Republic of Guinea",
            "latitude": "9.94301472",
            "longitude": "-11.31711839",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GN-32.png"
        },
        {
            "id": 68,
            "code": "GW",
            "name": "Guinea-Bissau",
            "name_official": "Republic of Guinea-Bissau",
            "latitude": "11.80050682",
            "longitude": "-15.18040700",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GW-32.png"
        },
        {
            "id": 69,
            "code": "GY",
            "name": "Guyana",
            "name_official": "Republic of Guyana",
            "latitude": "4.47957059",
            "longitude": "-58.72692293",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GY-32.png"
        },
        {
            "id": 70,
            "code": "HT",
            "name": "Haiti",
            "name_official": "Republic of Haiti",
            "latitude": "19.07430861",
            "longitude": "-72.79607526",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/HT-32.png"
        },
        {
            "id": 71,
            "code": "HN",
            "name": "Honduras",
            "name_official": "Republic of Honduras",
            "latitude": "14.64994423",
            "longitude": "-87.01643713",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/HN-32.png"
        },
        {
            "id": 72,
            "code": "HU",
            "name": "Hungary",
            "name_official": "Hungary",
            "latitude": "46.97670384",
            "longitude": "19.35499657",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/HU-32.png"
        },
        {
            "id": 73,
            "code": "IS",
            "name": "Iceland",
            "name_official": "Republic of Iceland",
            "latitude": "64.99294495",
            "longitude": "-18.57038755",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IS-32.png"
        },
        {
            "id": 74,
            "code": "IN",
            "name": "India",
            "name_official": "Republic of India",
            "latitude": "20.46549519",
            "longitude": "78.50146222",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IN-32.png"
        },
        {
            "id": 75,
            "code": "ID",
            "name": "Indonesia",
            "name_official": "Republic of Indonesia",
            "latitude": "-2.46229680",
            "longitude": "121.18329789",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ID-32.png"
        },
        {
            "id": 76,
            "code": "IQ",
            "name": "Iraq",
            "name_official": "Republic of Iraq",
            "latitude": "32.90170182",
            "longitude": "43.19590056",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IQ-32.png"
        },
        {
            "id": 77,
            "code": "IE",
            "name": "Ireland",
            "name_official": "Ireland",
            "latitude": "53.10101628",
            "longitude": "-8.21092302",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IE-32.png"
        },
        {
            "id": 78,
            "code": "IL",
            "name": "Israel",
            "name_official": "State of Israel",
            "latitude": "30.85883075",
            "longitude": "34.91753797",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IL-32.png"
        },
        {
            "id": 79,
            "code": "IT",
            "name": "Italy",
            "name_official": "Republic of Italy",
            "latitude": "41.77810840",
            "longitude": "12.67725128",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IT-32.png"
        },
        {
            "id": 80,
            "code": "JM",
            "name": "Jamaica",
            "name_official": "Jamaica",
            "latitude": "18.10838487",
            "longitude": "-77.29750600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/JM-32.png"
        },
        {
            "id": 81,
            "code": "JP",
            "name": "Japan",
            "name_official": "Japan",
            "latitude": "37.51848822",
            "longitude": "137.67066061",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/JP-32.png"
        },
        {
            "id": 82,
            "code": "JO",
            "name": "Jordan",
            "name_official": "Hashemite Kingdom of Jordan",
            "latitude": "31.31616588",
            "longitude": "36.37575510",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/JO-32.png"
        },
        {
            "id": 83,
            "code": "KZ",
            "name": "Kazakhstan",
            "name_official": "Republic of Kazakhstan",
            "latitude": "45.38592596",
            "longitude": "68.81334444",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KZ-32.png"
        },
        {
            "id": 84,
            "code": "KE",
            "name": "Kenya",
            "name_official": "Republic of Kenya",
            "latitude": "0.19582452",
            "longitude": "37.97212297",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KE-32.png"
        },
        {
            "id": 85,
            "code": "KI",
            "name": "Kiribati",
            "name_official": "Republic of Kiribati",
            "latitude": "1.87085244",
            "longitude": "-157.36259310",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KI-32.png"
        },
        {
            "id": 86,
            "code": "KW",
            "name": "Kuwait",
            "name_official": "State of Kuwait",
            "latitude": "29.43253341",
            "longitude": "47.71798405",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KW-32.png"
        },
        {
            "id": 87,
            "code": "KG",
            "name": "Kyrgyzstan",
            "name_official": "Kyrgyz Republic",
            "latitude": "41.11509878",
            "longitude": "74.25524574",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KG-32.png"
        },
        {
            "id": 88,
            "code": "LA",
            "name": "Lao People's Democratic Republic",
            "name_official": "Lao People's Democratic Republic",
            "latitude": "17.76075593",
            "longitude": "103.61611347",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LA-32.png"
        },
        {
            "id": 89,
            "code": "LV",
            "name": "Latvia",
            "name_official": "Republic of Latvia",
            "latitude": "56.86697515",
            "longitude": "24.54826936",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LV-32.png"
        },
        {
            "id": 90,
            "code": "LB",
            "name": "Lebanon",
            "name_official": "Lebanese Republic",
            "latitude": "34.08249284",
            "longitude": "35.66454309",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LB-32.png"
        },
        {
            "id": 91,
            "code": "LS",
            "name": "Lesotho",
            "name_official": "Kingdom of Lesotho",
            "latitude": "-29.60303205",
            "longitude": "28.23361200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LS-32.png"
        },
        {
            "id": 92,
            "code": "LR",
            "name": "Liberia",
            "name_official": "Republic of Liberia",
            "latitude": "6.44154681",
            "longitude": "-9.39103485",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LR-32.png"
        },
        {
            "id": 93,
            "code": "LY",
            "name": "Libya",
            "name_official": "Libya",
            "latitude": "27.06902914",
            "longitude": "18.19513987",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LY-32.png"
        },
        {
            "id": 94,
            "code": "LI",
            "name": "Liechtenstein",
            "name_official": "Principality of Liechtenstein",
            "latitude": "47.16587383",
            "longitude": "9.55537700",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LI-32.png"
        },
        {
            "id": 95,
            "code": "LT",
            "name": "Lithuania",
            "name_official": "Republic of Lithuania",
            "latitude": "55.25095948",
            "longitude": "23.80987587",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LT-32.png"
        },
        {
            "id": 96,
            "code": "LU",
            "name": "Luxembourg",
            "name_official": "Grand Duchy of Luxembourg",
            "latitude": "49.81327712",
            "longitude": "6.12958700",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LU-32.png"
        },
        {
            "id": 97,
            "code": "MG",
            "name": "Madagascar",
            "name_official": "Republic of Madagascar",
            "latitude": "-19.79858543",
            "longitude": "46.97898228",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MG-32.png"
        },
        {
            "id": 98,
            "code": "MW",
            "name": "Malawi",
            "name_official": "Republic of Malawi",
            "latitude": "-12.48684092",
            "longitude": "34.14223524",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MW-32.png"
        },
        {
            "id": 99,
            "code": "MY",
            "name": "Malaysia",
            "name_official": "Malaysia",
            "latitude": "4.97345793",
            "longitude": "106.54609050",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MY-32.png"
        },
        {
            "id": 100,
            "code": "MV",
            "name": "Maldives",
            "name_official": "Republic of Maldives",
            "latitude": "-0.64224221",
            "longitude": "73.13373313",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MV-32.png"
        },
        {
            "id": 101,
            "code": "ML",
            "name": "Mali",
            "name_official": "Republic of Mali",
            "latitude": "17.69385811",
            "longitude": "-1.96368730",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ML-32.png"
        },
        {
            "id": 102,
            "code": "MT",
            "name": "Malta",
            "name_official": "Republic of Malta",
            "latitude": "35.89706403",
            "longitude": "14.43687877",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MT-32.png"
        },
        {
            "id": 103,
            "code": "MH",
            "name": "Marshall Islands",
            "name_official": "Republic of the Marshall Islands",
            "latitude": "7.30130732",
            "longitude": "168.75512619",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MH-32.png"
        },
        {
            "id": 104,
            "code": "MR",
            "name": "Mauritania",
            "name_official": "Islamic Republic of Mauritania",
            "latitude": "20.28331239",
            "longitude": "-10.21573334",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MR-32.png"
        },
        {
            "id": 105,
            "code": "MU",
            "name": "Mauritius",
            "name_official": "Republic of Mauritius",
            "latitude": "-20.28368188",
            "longitude": "57.56588291",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MU-32.png"
        },
        {
            "id": 106,
            "code": "MX",
            "name": "Mexico",
            "name_official": "United Mexican States",
            "latitude": "22.92036676",
            "longitude": "-102.33305344",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MX-32.png"
        },
        {
            "id": 107,
            "code": "MC",
            "name": "Monaco",
            "name_official": "Principality of Monaco",
            "latitude": "43.70463620",
            "longitude": "6.75444978",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MC-32.png"
        },
        {
            "id": 108,
            "code": "MN",
            "name": "Mongolia",
            "name_official": "Mongolia",
            "latitude": "46.80556270",
            "longitude": "104.30808978",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MN-32.png"
        },
        {
            "id": 109,
            "code": "ME",
            "name": "Montenegro",
            "name_official": "Montenegro",
            "latitude": "42.71699590",
            "longitude": "19.09699321",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ME-32.png"
        },
        {
            "id": 110,
            "code": "MA",
            "name": "Morocco",
            "name_official": "Kingdom of Morocco",
            "latitude": "31.95441758",
            "longitude": "-7.26839325",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MA-32.png"
        },
        {
            "id": 111,
            "code": "MZ",
            "name": "Mozambique",
            "name_official": "Republic of Mozambique",
            "latitude": "-19.07617816",
            "longitude": "33.81570282",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MZ-32.png"
        },
        {
            "id": 112,
            "code": "MM",
            "name": "Myanmar",
            "name_official": "Republic of Union of Myanmar",
            "latitude": "19.20985380",
            "longitude": "96.54949272",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MM-32.png"
        },
        {
            "id": 113,
            "code": "NA",
            "name": "Namibia",
            "name_official": "Republic of Namibia",
            "latitude": "-22.70965620",
            "longitude": "16.72161918",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NA-32.png"
        },
        {
            "id": 114,
            "code": "NR",
            "name": "Nauru",
            "name_official": "Republic of Nauru",
            "latitude": "-0.52586763",
            "longitude": "166.93270463",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NR-32.png"
        },
        {
            "id": 115,
            "code": "NP",
            "name": "Nepal",
            "name_official": "Federal Democratic Republic of Nepal",
            "latitude": "28.28430770",
            "longitude": "83.98119373",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NP-32.png"
        },
        {
            "id": 116,
            "code": "NL",
            "name": "Netherlands",
            "name_official": "Kingdom of Netherlands",
            "latitude": "52.33939951",
            "longitude": "4.98914998",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NL-32.png"
        },
        {
            "id": 117,
            "code": "NZ",
            "name": "New Zealand",
            "name_official": "New Zealand",
            "latitude": "-40.95025298",
            "longitude": "171.76586181",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NZ-32.png"
        },
        {
            "id": 118,
            "code": "NI",
            "name": "Nicaragua",
            "name_official": "Republic of Nicaragua",
            "latitude": "12.91806226",
            "longitude": "-84.82270352",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NI-32.png"
        },
        {
            "id": 119,
            "code": "NE",
            "name": "Niger",
            "name_official": "Republic of Niger",
            "latitude": "17.23446679",
            "longitude": "8.23547860",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NE-32.png"
        },
        {
            "id": 120,
            "code": "NG",
            "name": "Nigeria",
            "name_official": "Federal Republic of Nigeria",
            "latitude": "9.02165273",
            "longitude": "7.82933373",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NG-32.png"
        },
        {
            "id": 121,
            "code": "NO",
            "name": "Norway",
            "name_official": "Kingdom of Norway",
            "latitude": "65.04680297",
            "longitude": "13.50069228",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NO-32.png"
        },
        {
            "id": 122,
            "code": "OM",
            "name": "Oman",
            "name_official": "Sultanate of Oman",
            "latitude": "20.69906846",
            "longitude": "56.69230596",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/OM-32.png"
        },
        {
            "id": 123,
            "code": "PK",
            "name": "Pakistan",
            "name_official": "Islamic Republic of Pakistan",
            "latitude": "29.90335974",
            "longitude": "70.34487986",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PK-32.png"
        },
        {
            "id": 124,
            "code": "PW",
            "name": "Palau",
            "name_official": "Republic of Palau",
            "latitude": "7.49856307",
            "longitude": "134.57291496",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PW-32.png"
        },
        {
            "id": 125,
            "code": "PA",
            "name": "Panama",
            "name_official": "Republic of Panama",
            "latitude": "8.52135102",
            "longitude": "-80.04603702",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PA-32.png"
        },
        {
            "id": 126,
            "code": "PG",
            "name": "Papua New Guinea",
            "name_official": "Independent State of Papua New Guinea",
            "latitude": "-6.62414046",
            "longitude": "144.44993477",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PG-32.png"
        },
        {
            "id": 127,
            "code": "PY",
            "name": "Paraguay",
            "name_official": "Republic of Paraguay",
            "latitude": "-23.38564782",
            "longitude": "-58.29551057",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PY-32.png"
        },
        {
            "id": 128,
            "code": "PE",
            "name": "Peru",
            "name_official": "Republic of Peru",
            "latitude": "-8.50205247",
            "longitude": "-76.15772412",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PE-32.png"
        },
        {
            "id": 129,
            "code": "PH",
            "name": "Philippines",
            "name_official": "Republic of Philippines",
            "latitude": "12.82361200",
            "longitude": "121.77401700",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PH-32.png"
        },
        {
            "id": 130,
            "code": "PL",
            "name": "Poland",
            "name_official": "Republic of Poland",
            "latitude": "52.10117636",
            "longitude": "19.33190957",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PL-32.png"
        },
        {
            "id": 131,
            "code": "PT",
            "name": "Portugal",
            "name_official": "Portuguese Republic",
            "latitude": "39.44879136",
            "longitude": "-8.03768042",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PT-32.png"
        },
        {
            "id": 132,
            "code": "QA",
            "name": "Qatar",
            "name_official": "State of Qatar",
            "latitude": "25.24551555",
            "longitude": "51.24431480",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/QA-32.png"
        },
        {
            "id": 133,
            "code": "RO",
            "name": "Romania",
            "name_official": "Romania",
            "latitude": "45.56450023",
            "longitude": "25.21945155",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/RO-32.png"
        },
        {
            "id": 134,
            "code": "RU",
            "name": "Russian Federation",
            "name_official": "Russian Federation",
            "latitude": "57.96812298",
            "longitude": "102.41837137",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/RU-32.png"
        },
        {
            "id": 135,
            "code": "RW",
            "name": "Rwanda",
            "name_official": "Republic of Rwanda",
            "latitude": "-1.98589079",
            "longitude": "29.94255855",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/RW-32.png"
        },
        {
            "id": 136,
            "code": "KN",
            "name": "Saint Kitts and Nevis",
            "name_official": "Saint Kitts and Nevis",
            "latitude": "17.33453669",
            "longitude": "-62.76411725",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KN-32.png"
        },
        {
            "id": 137,
            "code": "LC",
            "name": "Saint Lucia",
            "name_official": "Saint Lucia",
            "latitude": "13.90938495",
            "longitude": "-60.97889500",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LC-32.png"
        },
        {
            "id": 138,
            "code": "VC",
            "name": "Saint Vincent and the Grenadines",
            "name_official": "Saint Vincent and the Grenadines",
            "latitude": "13.25276143",
            "longitude": "-61.19709800",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/VC-32.png"
        },
        {
            "id": 139,
            "code": "WS",
            "name": "Samoa",
            "name_official": "Independent State of Samoa",
            "latitude": "-13.57998954",
            "longitude": "-172.45207363",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/WS-32.png"
        },
        {
            "id": 140,
            "code": "SM",
            "name": "San Marino",
            "name_official": "Republic of San Marino",
            "latitude": "43.94223356",
            "longitude": "12.45777700",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SM-32.png"
        },
        {
            "id": 141,
            "code": "ST",
            "name": "Sao Tome and Principe",
            "name_official": "Democratic Republic of Sao Tome and Principe",
            "latitude": "0.23381910",
            "longitude": "6.59935809",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ST-32.png"
        },
        {
            "id": 142,
            "code": "SA",
            "name": "Saudi Arabia",
            "name_official": "Kingdom of Saudi Arabia",
            "latitude": "24.16687314",
            "longitude": "42.88190638",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SA-32.png"
        },
        {
            "id": 143,
            "code": "SN",
            "name": "Senegal",
            "name_official": "Republic of Senegal",
            "latitude": "14.43579003",
            "longitude": "-14.68306489",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SN-32.png"
        },
        {
            "id": 144,
            "code": "RS",
            "name": "Serbia",
            "name_official": "Republic of Serbia",
            "latitude": "44.06736041",
            "longitude": "20.29725084",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/RS-32.png"
        },
        {
            "id": 145,
            "code": "SC",
            "name": "Seychelles",
            "name_official": "Republic of Seychelles",
            "latitude": "-4.68053204",
            "longitude": "55.49061371",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SC-32.png"
        },
        {
            "id": 146,
            "code": "SL",
            "name": "Sierra Leone",
            "name_official": "Republic of Sierra Leone",
            "latitude": "8.45575589",
            "longitude": "-11.93368759",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SL-32.png"
        },
        {
            "id": 147,
            "code": "SG",
            "name": "Singapore",
            "name_official": "Republic of Singapore",
            "latitude": "1.33873261",
            "longitude": "103.83323559",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SG-32.png"
        },
        {
            "id": 148,
            "code": "SK",
            "name": "Slovakia",
            "name_official": "Slovak Republic",
            "latitude": "48.66923253",
            "longitude": "19.75396564",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SK-32.png"
        },
        {
            "id": 149,
            "code": "SI",
            "name": "Slovenia",
            "name_official": "Republic of Slovenia",
            "latitude": "46.14315048",
            "longitude": "14.99546300",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SI-32.png"
        },
        {
            "id": 150,
            "code": "SB",
            "name": "Solomon Islands",
            "name_official": "Solomon Islands",
            "latitude": "-9.64554280",
            "longitude": "160.15619400",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SB-32.png"
        },
        {
            "id": 151,
            "code": "SO",
            "name": "Somalia",
            "name_official": "Federal Republic of Somalia",
            "latitude": "2.87224619",
            "longitude": "45.27676444",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SO-32.png"
        },
        {
            "id": 152,
            "code": "ZA",
            "name": "South Africa",
            "name_official": "Republic of South Africa",
            "latitude": "-27.17706863",
            "longitude": "24.50856092",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ZA-32.png"
        },
        {
            "id": 153,
            "code": "ES",
            "name": "Spain",
            "name_official": "Kingdom of Spain",
            "latitude": "39.87299401",
            "longitude": "-3.67089492",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ES-32.png"
        },
        {
            "id": 154,
            "code": "LK",
            "name": "Sri Lanka",
            "name_official": "Democratic Socialist Republic of Sri Lanka",
            "latitude": "7.61264985",
            "longitude": "80.83772497",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/LK-32.png"
        },
        {
            "id": 155,
            "code": "SD",
            "name": "Sudan",
            "name_official": "Republic of Sudan",
            "latitude": "15.96646839",
            "longitude": "30.37145459",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SD-32.png"
        },
        {
            "id": 156,
            "code": "SR",
            "name": "Suriname",
            "name_official": "Republic of Suriname",
            "latitude": "4.26470865",
            "longitude": "-55.93988238",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SR-32.png"
        },
        {
            "id": 157,
            "code": "SZ",
            "name": "Eswatini",
            "name_official": "Kingdom of Eswatini",
            "latitude": "-26.53892570",
            "longitude": "31.47960891",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SZ-32.png"
        },
        {
            "id": 158,
            "code": "SE",
            "name": "Sweden",
            "name_official": "Kingdom of Sweden",
            "latitude": "61.42370427",
            "longitude": "16.73188991",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SE-32.png"
        },
        {
            "id": 159,
            "code": "CH",
            "name": "Switzerland",
            "name_official": "Swiss Confederation",
            "latitude": "46.81010721",
            "longitude": "8.22751200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CH-32.png"
        },
        {
            "id": 160,
            "code": "SY",
            "name": "Syrian Arab Republic",
            "name_official": "Syrian Arab Republic",
            "latitude": "34.71097430",
            "longitude": "38.66723516",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SY-32.png"
        },
        {
            "id": 161,
            "code": "TJ",
            "name": "Tajikistan",
            "name_official": "Republic of Tajikistan",
            "latitude": "38.68075124",
            "longitude": "71.23215769",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TJ-32.png"
        },
        {
            "id": 162,
            "code": "TH",
            "name": "Thailand",
            "name_official": "Kingdom of Thailand",
            "latitude": "14.60009810",
            "longitude": "101.38805881",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TH-32.png"
        },
        {
            "id": 163,
            "code": "TL",
            "name": "Timor-Leste",
            "name_official": "Democratic Republic of Timor-Leste",
            "latitude": "-8.88926365",
            "longitude": "125.99671404",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TL-32.png"
        },
        {
            "id": 164,
            "code": "TG",
            "name": "Togo",
            "name_official": "Togolese Republic",
            "latitude": "8.68089206",
            "longitude": "0.86049757",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TG-32.png"
        },
        {
            "id": 165,
            "code": "TO",
            "name": "Tonga",
            "name_official": "Kingdom of Tonga",
            "latitude": "-21.17890075",
            "longitude": "-175.19824200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TO-32.png"
        },
        {
            "id": 166,
            "code": "TT",
            "name": "Trinidad and Tobago",
            "name_official": "Republic of Trinidad and Tobago",
            "latitude": "10.43241863",
            "longitude": "-61.22250300",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TT-32.png"
        },
        {
            "id": 167,
            "code": "TN",
            "name": "Tunisia",
            "name_official": "Republic of Tunisia",
            "latitude": "33.88431940",
            "longitude": "9.71878341",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TN-32.png"
        },
        {
            "id": 168,
            "code": "TR",
            "name": "Türkiye",
            "name_official": "Republic of Türkiye",
            "latitude": "38.27069555",
            "longitude": "36.28703317",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TR-32.png"
        },
        {
            "id": 169,
            "code": "TM",
            "name": "Turkmenistan",
            "name_official": "Turkmenistan",
            "latitude": "38.94915421",
            "longitude": "59.06190323",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TM-32.png"
        },
        {
            "id": 170,
            "code": "TV",
            "name": "Tuvalu",
            "name_official": "Tuvalu",
            "latitude": "-8.45968122",
            "longitude": "179.13310944",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TV-32.png"
        },
        {
            "id": 171,
            "code": "UG",
            "name": "Uganda",
            "name_official": "Republic of Uganda",
            "latitude": "1.54760620",
            "longitude": "32.44409759",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/UG-32.png"
        },
        {
            "id": 172,
            "code": "UA",
            "name": "Ukraine",
            "name_official": "Ukraine",
            "latitude": "48.89358596",
            "longitude": "31.10516920",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/UA-32.png"
        },
        {
            "id": 173,
            "code": "AE",
            "name": "United Arab Emirates",
            "name_official": "United Arab Emirates",
            "latitude": "24.64324405",
            "longitude": "53.62261227",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AE-32.png"
        },
        {
            "id": 174,
            "code": "UY",
            "name": "Uruguay",
            "name_official": "Eastern Republic of Uruguay",
            "latitude": "-32.49342987",
            "longitude": "-55.76583300",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/UY-32.png"
        },
        {
            "id": 175,
            "code": "UZ",
            "name": "Uzbekistan",
            "name_official": "Republic of Uzbekistan",
            "latitude": "41.30829147",
            "longitude": "62.62970960",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/UZ-32.png"
        },
        {
            "id": 176,
            "code": "VU",
            "name": "Vanuatu",
            "name_official": "Republic of Vanuatu",
            "latitude": "-15.37256614",
            "longitude": "166.95916000",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/VU-32.png"
        },
        {
            "id": 177,
            "code": "VN",
            "name": "Viet Nam",
            "name_official": "Socialist Republic of Viet Nam",
            "latitude": "17.19931699",
            "longitude": "107.14012804",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/VN-32.png"
        },
        {
            "id": 178,
            "code": "YE",
            "name": "Yemen",
            "name_official": "Republic of Yemen",
            "latitude": "15.60865453",
            "longitude": "47.60453676",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/YE-32.png"
        },
        {
            "id": 179,
            "code": "ZM",
            "name": "Zambia",
            "name_official": "Republic of Zambia",
            "latitude": "-13.01812188",
            "longitude": "28.33274444",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ZM-32.png"
        },
        {
            "id": 180,
            "code": "ZW",
            "name": "Zimbabwe",
            "name_official": "Republic of Zimbabwe",
            "latitude": "-19.00784952",
            "longitude": "30.18758584",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/ZW-32.png"
        },
        {
            "id": 181,
            "code": "CK",
            "name": "Cook Islands",
            "name_official": "Cook Islands",
            "latitude": "-21.23673066",
            "longitude": "-159.77766900",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CK-32.png"
        },
        {
            "id": 182,
            "code": "BO",
            "name": "Bolivia (Plurinational State of)",
            "name_official": "Plurinational State of Bolivia",
            "latitude": "-16.74518128",
            "longitude": "-65.19265691",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BO-32.png"
        },
        {
            "id": 183,
            "code": "CD",
            "name": "Democratic Republic of the Congo",
            "name_official": "Democratic Republic of Congo",
            "latitude": "-4.05373938",
            "longitude": "23.01110741",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CD-32.png"
        },
        {
            "id": 184,
            "code": "EU",
            "name": "European Union",
            "name_official": "European Union",
            "latitude": "48.76380654",
            "longitude": "14.26843140",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/EU-32.png"
        },
        {
            "id": 185,
            "code": "FM",
            "name": "Micronesia (Federated States of)",
            "name_official": "Federated States of Micronesia",
            "latitude": "6.88747377",
            "longitude": "158.21507170",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/FM-32.png"
        },
        {
            "id": 186,
            "code": "GB",
            "name": "United Kingdom",
            "name_official": "United Kingdom of Great Britain and Northern Ireland",
            "latitude": "53.36540813",
            "longitude": "-2.72184767",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GB-32.png"
        },
        {
            "id": 187,
            "code": "IR",
            "name": "Iran (Islamic Republic of)",
            "name_official": "Islamic Republic of Iran",
            "latitude": "31.40240324",
            "longitude": "51.28204814",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IR-32.png"
        },
        {
            "id": 188,
            "code": "KP",
            "name": "Democratic People's Republic of Korea",
            "name_official": "Democratic People's Republic of Korea",
            "latitude": "40.00785500",
            "longitude": "127.48812834",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KP-32.png"
        },
        {
            "id": 189,
            "code": "KR",
            "name": "Republic of Korea",
            "name_official": "Republic of Korea",
            "latitude": "36.56344139",
            "longitude": "127.51424646",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KR-32.png"
        },
        {
            "id": 190,
            "code": "MD",
            "name": "Republic of Moldova",
            "name_official": "Republic of Moldova",
            "latitude": "47.10710437",
            "longitude": "28.54018109",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MD-32.png"
        },
        {
            "id": 191,
            "code": "MK",
            "name": "North Macedonia",
            "name_official": "Republic of North Macedonia",
            "latitude": "41.60059479",
            "longitude": "21.74527900",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MK-32.png"
        },
        {
            "id": 192,
            "code": "NU",
            "name": "Niue",
            "name_official": "Niue",
            "latitude": "-19.04976362",
            "longitude": "-169.86585571",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NU-32.png"
        },
        {
            "id": 193,
            "code": "TZ",
            "name": "United Republic of Tanzania",
            "name_official": "United Republic of Tanzania",
            "latitude": "-6.37551085",
            "longitude": "34.85587302",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TZ-32.png"
        },
        {
            "id": 194,
            "code": "VE",
            "name": "Venezuela (Bolivarian Republic of)",
            "name_official": "Bolivarian Republic of Venezuela",
            "latitude": "5.98477766",
            "longitude": "-65.94152264",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/VE-32.png"
        },
        {
            "id": 195,
            "code": "AI",
            "name": "Anguilla",
            "name_official": "Anguilla",
            "latitude": "18.22053521",
            "longitude": "-63.06861300",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AI-32.png"
        },
        {
            "id": 196,
            "code": "AQ",
            "name": "Antarctica",
            "name_official": "Antarctica",
            "latitude": "-45.13806295",
            "longitude": "10.48095703",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AQ-32.png"
        },
        {
            "id": 197,
            "code": "AS",
            "name": "American Samoa",
            "name_official": "The United States Territory of American Samoa",
            "latitude": "-14.30634641",
            "longitude": "-170.69501750",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AS-32.png"
        },
        {
            "id": 198,
            "code": "AW",
            "name": "Aruba",
            "name_official": "Aruba of the Kingdom of the Netherlands",
            "latitude": "12.52109661",
            "longitude": "-69.96833800",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AW-32.png"
        },
        {
            "id": 199,
            "code": "AX",
            "name": "Åland Islands",
            "name_official": "Åland Islands",
            "latitude": "60.25403213",
            "longitude": "20.35918350",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/AX-32.png"
        },
        {
            "id": 200,
            "code": "BL",
            "name": "Saint Barthélemy",
            "name_official": "Territorial collectivity of Saint Barthélemy",
            "latitude": "17.90042417",
            "longitude": "-62.83376215",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BL-32.png"
        },
        {
            "id": 201,
            "code": "BM",
            "name": "Bermuda",
            "name_official": "Bermudas",
            "latitude": "32.31995785",
            "longitude": "-64.76182765",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BM-32.png"
        },
        {
            "id": 202,
            "code": "BQ",
            "name": "Bonaire, Saint Eustatius And Saba",
            "name_official": "Bonaire, Saint Eustatius and Saba",
            "latitude": "12.17229702",
            "longitude": "-68.28831170",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BQ-32.png"
        },
        {
            "id": 203,
            "code": "BV",
            "name": "Bouvet Island",
            "name_official": "Bouvet Island",
            "latitude": "-54.42316906",
            "longitude": "3.41319600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/BV-32.png"
        },
        {
            "id": 204,
            "code": "CC",
            "name": "Cocos (Keeling) Islands",
            "name_official": "Territory of Cocos (Keeling) Islands",
            "latitude": "-12.12890685",
            "longitude": "96.84689104",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CC-32.png"
        },
        {
            "id": 205,
            "code": "CW",
            "name": "Curaçao",
            "name_official": "Curaçao",
            "latitude": "12.20710309",
            "longitude": "-69.02160369",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CW-32.png"
        },
        {
            "id": 206,
            "code": "CX",
            "name": "Christmas Island",
            "name_official": "Territory of Christmas Island",
            "latitude": "-10.49170619",
            "longitude": "105.68083796",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/CX-32.png"
        },
        {
            "id": 207,
            "code": "EH",
            "name": "Western Sahara",
            "name_official": "Western Sahara",
            "latitude": "24.79324356",
            "longitude": "-13.67683563",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/EH-32.png"
        },
        {
            "id": 208,
            "code": "FK",
            "name": "Falkland Islands (Malvinas)",
            "name_official": "Falkland Islands",
            "latitude": "-51.78838251",
            "longitude": "-59.52361100",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/FK-32.png"
        },
        {
            "id": 209,
            "code": "FO",
            "name": "Faroe Islands (Associate Member)",
            "name_official": "Faroe Islands",
            "latitude": "61.88590482",
            "longitude": "-6.91180400",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/FO-32.png"
        },
        {
            "id": 210,
            "code": "GF",
            "name": "French Guiana",
            "name_official": "French Guiana",
            "latitude": "4.01114381",
            "longitude": "-52.97746057",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GF-32.png"
        },
        {
            "id": 211,
            "code": "GG",
            "name": "Guernsey",
            "name_official": "Bailiwick of Guernsey",
            "latitude": "49.46565975",
            "longitude": "-2.58527200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GG-32.png"
        },
        {
            "id": 212,
            "code": "GI",
            "name": "Gibraltar",
            "name_official": "Gibraltar",
            "latitude": "36.14864641",
            "longitude": "-5.34404779",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GI-32.png"
        },
        {
            "id": 213,
            "code": "GL",
            "name": "Greenland",
            "name_official": "Greenland",
            "latitude": "71.42932629",
            "longitude": "-34.38651956",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GL-32.png"
        },
        {
            "id": 214,
            "code": "GP",
            "name": "Guadeloupe",
            "name_official": "Department of Guadeloupe",
            "latitude": "16.26472785",
            "longitude": "-61.55099400",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GP-32.png"
        },
        {
            "id": 215,
            "code": "GS",
            "name": "South Georgia and the South Sandwich Islands",
            "name_official": "South Georgia and the South Sandwich Islands",
            "latitude": "-54.38130284",
            "longitude": "-36.67305304",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GS-32.png"
        },
        {
            "id": 216,
            "code": "GU",
            "name": "Guam",
            "name_official": "Territory of Guam",
            "latitude": "13.44410137",
            "longitude": "144.80747791",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/GU-32.png"
        },
        {
            "id": 217,
            "code": "HK",
            "name": "Hong Kong",
            "name_official": "Hong Kong Special Administrative Region of the People's Republic",
            "latitude": "22.33728531",
            "longitude": "114.14657786",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/HK-32.png"
        },
        {
            "id": 218,
            "code": "HM",
            "name": "Heard Island And McDonald Islands",
            "name_official": "Heard and McDonald Islands",
            "latitude": "-53.08168847",
            "longitude": "73.50415800",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/HM-32.png"
        },
        {
            "id": 219,
            "code": "IM",
            "name": "Isle of Man",
            "name_official": "The Isle of Man",
            "latitude": "54.23562697",
            "longitude": "-4.54805400",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IM-32.png"
        },
        {
            "id": 220,
            "code": "IO",
            "name": "British Indian Ocean Territory",
            "name_official": "The British Indian Ocean Territory",
            "latitude": "-7.33461519",
            "longitude": "72.42425280",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/IO-32.png"
        },
        {
            "id": 221,
            "code": "JE",
            "name": "Jersey",
            "name_official": "Bailiwick of Jersey",
            "latitude": "49.21440771",
            "longitude": "-2.13124600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/JE-32.png"
        },
        {
            "id": 222,
            "code": "KY",
            "name": "Cayman Islands",
            "name_official": "The Cayman Islands",
            "latitude": "19.31322102",
            "longitude": "-81.25459800",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/KY-32.png"
        },
        {
            "id": 223,
            "code": "MF",
            "name": "Saint Martin",
            "name_official": "Saint Martin",
            "latitude": "18.07637107",
            "longitude": "-63.05019106",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MF-32.png"
        },
        {
            "id": 224,
            "code": "MO",
            "name": "Macao",
            "name_official": "Macau Special Administrative Region",
            "latitude": "22.19872287",
            "longitude": "113.54387700",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MO-32.png"
        },
        {
            "id": 225,
            "code": "MP",
            "name": "Northern Mariana Islands",
            "name_official": "Commonwealth of the Northern Mariana Islands",
            "latitude": "15.09783636",
            "longitude": "145.67390000",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MP-32.png"
        },
        {
            "id": 226,
            "code": "MQ",
            "name": "Martinique",
            "name_official": "Department of Martinique",
            "latitude": "14.64128045",
            "longitude": "-61.02417600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MQ-32.png"
        },
        {
            "id": 227,
            "code": "MS",
            "name": "Montserrat",
            "name_official": "Montserrat",
            "latitude": "16.74774077",
            "longitude": "-62.18736600",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/MS-32.png"
        },
        {
            "id": 228,
            "code": "NC",
            "name": "New Caledonia",
            "name_official": "Territory of New Caledonia and Dependencies",
            "latitude": "-21.26104020",
            "longitude": "165.58783760",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NC-32.png"
        },
        {
            "id": 229,
            "code": "NF",
            "name": "Norfolk Island",
            "name_official": "Norfolk Islands",
            "latitude": "-29.02801043",
            "longitude": "167.94303023",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/NF-32.png"
        },
        {
            "id": 230,
            "code": "PF",
            "name": "French Polynesia",
            "name_official": "Territory of French Polynesia",
            "latitude": "-17.66243898",
            "longitude": "-149.40683900",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PF-32.png"
        },
        {
            "id": 231,
            "code": "PM",
            "name": "Saint Pierre and Miquelon",
            "name_official": "Saint Pierre and Miquelon",
            "latitude": "46.88469499",
            "longitude": "-56.31590200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PM-32.png"
        },
        {
            "id": 232,
            "code": "PN",
            "name": "Pitcairn Islands",
            "name_official": "Pitcairn Group of Islands",
            "latitude": "-24.37673925",
            "longitude": "-128.32423730",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PN-32.png"
        },
        {
            "id": 233,
            "code": "PR",
            "name": "Puerto Rico",
            "name_official": "Commonwealth of Puerto Rico",
            "latitude": "18.21963053",
            "longitude": "-66.59015100",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PR-32.png"
        },
        {
            "id": 234,
            "code": "PS",
            "name": "Palestinian Territory, Occupied",
            "name_official": "Occupied Palestinian Territory",
            "latitude": "32.26367103",
            "longitude": "35.21936714",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/PS-32.png"
        },
        {
            "id": 235,
            "code": "RE",
            "name": "Réunion",
            "name_official": "Department of Reunion",
            "latitude": "-21.11480084",
            "longitude": "55.53638200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/RE-32.png"
        },
        {
            "id": 236,
            "code": "SH",
            "name": "Saint Helena, Ascension and Tristan da Cunha",
            "name_official": "Saint Helena, Ascension and Tristan da Cunha",
            "latitude": "-37.10521846",
            "longitude": "-12.27768580",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SH-32.png"
        },
        {
            "id": 237,
            "code": "SJ",
            "name": "Svalbard and Jan Mayen",
            "name_official": "Svalbard and Jan Mayen",
            "latitude": "77.92215764",
            "longitude": "18.99010622",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SJ-32.png"
        },
        {
            "id": 238,
            "code": "SX",
            "name": "Sint Maarten",
            "name_official": "Sint Maarten",
            "latitude": "18.04433885",
            "longitude": "-63.05616320",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SX-32.png"
        },
        {
            "id": 239,
            "code": "TC",
            "name": "Turks and Caicos Islands",
            "name_official": "Turks and Caicos Islands",
            "latitude": "21.72816866",
            "longitude": "-71.79654471",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TC-32.png"
        },
        {
            "id": 240,
            "code": "TF",
            "name": "French Southern and Antarctic Lands",
            "name_official": "Territory of the French Southern and Antarctic Lands",
            "latitude": "-49.27235903",
            "longitude": "69.34856300",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TF-32.png"
        },
        {
            "id": 241,
            "code": "TK",
            "name": "Tokelau (Associate Member)",
            "name_official": "Tokelau",
            "latitude": "-9.16682644",
            "longitude": "-171.83981693",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TK-32.png"
        },
        {
            "id": 242,
            "code": "TW",
            "name": "Taiwan",
            "name_official": "Republic of China",
            "latitude": "23.71891402",
            "longitude": "121.10884043",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/TW-32.png"
        },
        {
            "id": 243,
            "code": "UM",
            "name": "United States Minor Outlying Islands",
            "name_official": "United States Minor Outlying Islands",
            "latitude": "19.46305694",
            "longitude": "177.98631092",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/UM-32.png"
        },
        {
            "id": 244,
            "code": "US",
            "name": "United States of America",
            "name_official": "United States of America",
            "latitude": "37.66895362",
            "longitude": "-102.39256450",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/US-32.png"
        },
        {
            "id": 245,
            "code": "VA",
            "name": "Holy See",
            "name_official": "Holy see",
            "latitude": "41.90377810",
            "longitude": "12.45340142",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/VA-32.png"
        },
        {
            "id": 246,
            "code": "VG",
            "name": "Virgin Islands",
            "name_official": "British Virgin Islands",
            "latitude": "17.67004187",
            "longitude": "-64.77411010",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/VG-32.png"
        },
        {
            "id": 247,
            "code": "VI",
            "name": "United States Virgin Islands",
            "name_official": "Virgin Islands of the United States",
            "latitude": "18.01000938",
            "longitude": "-64.77411410",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/VI-32.png"
        },
        {
            "id": 248,
            "code": "WF",
            "name": "Wallis and Futuna",
            "name_official": "Territory of the Wallis and Futuna Islands",
            "latitude": "-14.29378486",
            "longitude": "-178.11649800",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/WF-32.png"
        },
        {
            "id": 249,
            "code": "YT",
            "name": "Mayotte",
            "name_official": "Overseas Department of Mayotte",
            "latitude": "-12.82744522",
            "longitude": "45.16624200",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/YT-32.png"
        },
        {
            "id": 250,
            "code": "SS",
            "name": "South Sudan",
            "name_official": "Republic of South Sudan",
            "latitude": "7.91320803",
            "longitude": "30.15342434",
            "flag_path": "https://urlsdemo.xyz/kupid/public/admin-assets/img/country_flags/SS-32.png"
        }
    // Add other countries...
  ];


@override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Dropdown'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CountryDropdown(countries: countries),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> countries;

  CountryDropdown({required this.countries});

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  Map<String, dynamic>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<Map<String, dynamic>>(
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
          prefixIcon:selectedCountry != null
            ? Image.network(
                selectedCountry!['flag_path'],
                width: 24,
                height: 24,
              )
            : null ,
          labelText: 'Select Country', ),
        
        controller: TextEditingController(
          text: selectedCountry != null ? selectedCountry!['name'] : '',
        ),
        // Prefix icon displaying the selected country's flag
      
      ),
      suggestionsCallback: (pattern) {
        return widget.countries
            .where((country) =>
                country['name']
                    .toLowerCase()
                    .contains(pattern.toLowerCase()) ||
                country['name_official']
                    .toLowerCase()
                    .contains(pattern.toLowerCase()))
            .toList();
      },
      itemBuilder: (context, country) {
        return ListTile(
          leading: Image.network(
            country['flag_path'],
            width: 32,
            height: 32,
          ),
          title: Text(country['name']),
          subtitle: Text(country['name_official']),
        );
      },
      onSuggestionSelected: (country) {
        setState(() {
          selectedCountry = country;
        });
      },
      noItemsFoundBuilder: (context) {
        return ListTile(
          title: Text('No countries found.'),
        );
      },
    );
  }
}

