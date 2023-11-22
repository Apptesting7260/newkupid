import 'dart:ui';

import 'package:cupid_match/data/network/network_api_services.dart';
import 'package:cupid_match/models/AllMakerModel/AllMakerModel.dart';
import 'package:cupid_match/models/CreateMatchesPlanModel/CreateMatchesPlanModel.dart';
import 'package:cupid_match/models/CreateMonthlyPlanModel/CreateMonthlyPlanModel.dart';
import 'package:cupid_match/models/DoMachesModel.dart/DoMatchesModel.dart';
import 'package:cupid_match/models/FetchSubcriptionModel/FetchSubcriptionModel.dart';
import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:cupid_match/models/LiverPoolModel/LiverPollModel.dart';
import 'package:cupid_match/models/LiverPooledRequestModel/LiverPooledRequestModel.dart';
import 'package:cupid_match/models/MagicProfile/MagicProfiles.dart';
import 'package:cupid_match/models/MakerChatListModel/maker_chat_list_model.dart';
import 'package:cupid_match/models/MakerPaymentInfoModel/MakerPaymentInfoModel.dart';
import 'package:cupid_match/models/MakerSinglepageRequestModel/MakerSinglepageRequestModel.dart';
import 'package:cupid_match/models/OtpVerrificationModel/OtpverificationModel.dart';
import 'package:cupid_match/models/OutgoingRequestModel/OutgoingRequestModel.dart';
import 'package:cupid_match/models/ProfileScrollModel/ProfileScrollModel.dart';
import 'package:cupid_match/models/RequestAcceptModel/RequestAcceptModel.dart';
import 'package:cupid_match/models/RequestActionModel/RequestActionModel.dart';
import 'package:cupid_match/models/RequestModel/RequestModel.dart';
import 'package:cupid_match/models/SeekerMyProfileDetailsModel/SeekerMyProfileDetailsModel.dart';
import 'package:cupid_match/models/SeekerToMakerRequest/SeekerTomakerRequestModel.dart';
import 'package:cupid_match/models/SeekerToSeekerRequestModel/SeekerToSeekerRequestModel.dart';
import 'package:cupid_match/models/SeekersallInterestsModel/SeekersAllInterestsModel.dart';
import 'package:cupid_match/models/SignUpModel/SinUpModel.dart';
import 'package:cupid_match/models/StaticLiverPoolModel/StaticLiverPoolMdodel.dart';
import 'package:cupid_match/models/UserLoginModel/UserLoginModel.dart';
import 'package:cupid_match/models/ViewMakerProfileDetailsModel/ViewMakerProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewSikerDetailsToMatchModel,.dart/ViewSikerDetailsModel.dart';
import 'package:cupid_match/models/likeModel/LikeListModel.dart';
import 'package:cupid_match/res/app_url/app_url.dart';

import '../../models/AllOcupationsModel/AllOcupationsModel.dart';
import '../../models/CountryModel/country_model.dart';
import '../../models/CreatePasswordModel/CreatePasswordModel.dart';
import '../../models/FindMatch/FindMatchesController.dart';
import '../../models/ForgotPasswordModel/ForgotPasswordModel.dart';
import '../../models/ForgotPasswordResetModel/ForgotPasswordResetModel.dart';
import '../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
import '../../models/MakerHomePage/MakerHomePageModel.dart';
import '../../models/MakerMyProfileDetailModel/GetMyPrpfileDetailsModel.dart';
import '../../models/MakerProfileModel/MakerProfileModel.dart';
import '../../models/MakerRecentMatchesModel/maker_recent_matches_model.dart';
import '../../models/MakerSinglepageRequestModel/MakerSingleRequestModel.dart';
import '../../models/OutgoingMakerRequestModle/outgoing_maker_request_model.dart';
import '../../models/RecentSeekerMatches/recent_seeker_matches_Model.dart';
import '../../models/ResendOtpModel/ResendOtpModel.dart';
import '../../models/SeekerChatListModel/seeker_chat_list_model.dart';
import '../../models/SeekerHomePageRequestModel/SeekerHomePageRequest.dart';
import '../../models/SeekerProfileModel/SeekerProfileModel.dart';
import '../../models/SeekerRequestModel.dart';
import '../../models/SetRoleModel/SetRoleModel.dart';
import '../../models/ViewProfileDetailsModel/EditProfileDetailsModel.dart';

class AuthRepository {
  int? abcd;
  final _apiService = NetworkApiServices();

  Future<SignUpModel> SignUpApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.SignUpUrl);
    return SignUpModel.fromJson(response);
  }

  Future<SignUpModel> UserPhoneAndNumberVerfyApi(var data) async {
    dynamic response = await _apiService.postApi2(data, AppUrl.MakerProfileUrl);
    print("============$response");
    return SignUpModel.fromJson(response);
    
  }

  Future<OtpVerificationModel> OtpVarificationApi(var data) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.OtpvarificationUrl);
    return OtpVerificationModel.fromJson(response);
  }

  Future<CreatePasswordModel> CreatePasswordApi(var data) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.CreatePasswordUrl);
    return CreatePasswordModel.fromJson(response);
  }

  Future<ResendOtpModel> ResendOtpApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.ResendOtpUrl);
    return ResendOtpModel.fromJson(response);
  }

  Future<SetRoleModel> SetRoleApiApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.SetRoleUrl);
    return SetRoleModel.fromJson(response);
  }

  Future<ForgotPasswordModel> ForgotPasswordApi(var data) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.ForgotPasswordUrl);
    return ForgotPasswordModel.fromJson(response);
  }

  Future<ForgotPasswordResetModel> ForgotPasswordResetApi(var data) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.ForgotPasswordResetUrl);
    return ForgotPasswordResetModel.fromJson(response);
  }

  Future<MakerProfileModel> MakerProfileApi(var data) async {
    dynamic response = await _apiService.postApi2(
        data, "https://urlsdemo.xyz/kupid/api/user-profile-update");
    print(response);
    return MakerProfileModel.fromJson(response);
  }

  Future<SikerCreateProfileModel> SeekerProfileApi(var data) async {
    dynamic response = await _apiService.postApi2(
        data, "https://urlsdemo.xyz/kupid/api/user-profile-update");
    print(response);
    return SikerCreateProfileModel.fromJson(response);
  }

  Future<MakerPaymentInfoModel> MakerPaymentInfoApi(var data) async {
    dynamic response = await _apiService.postApi2(data, AppUrl.MakerPaymentUrl);
    print(response);
    return MakerPaymentInfoModel.fromJson(response);
  }

  Future<FetchsubcriptionplanModel> FetchSubcriptionApi(var data) async {
    // print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.FetchSubcriptionUrl);
    print(response);
    return FetchsubcriptionplanModel.fromJson(response);
  }

  Future<CreateMonthlyPlanModel> CreateMonhleyPlanApi(var data) async {
    // print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.CreateMonthlyPlanUrl);
    print(response);
    return CreateMonthlyPlanModel.fromJson(response);
  }

  Future<CreateMatchesPlanModel> CreateMatchesPlanApi(var data) async {
    // print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.CreateMatchesPlanUrl);
    // print(response);
    return CreateMatchesPlanModel.fromJson(response);
  }

  Future<SeekersAllInterestsModel> SeekersAllInterestsApi() async {
    // print("hited");
    dynamic response = await _apiService.getApi2(AppUrl.SeekersAllInterestsUrl);
    print(response);
    return SeekersAllInterestsModel.fromJson(response);
  }

  Future<MagicProfilesModel> MagicProfileApi() async {
    // print("hited");
    dynamic response = await _apiService.getApi2(AppUrl.MagicProfileUrl);
    // print(response);
    return MagicProfilesModel.fromJson(response);
  }

  Future<AllOcupationsModel> GetAllOcupationsApi() async {
    // print("hited");
    dynamic response = await _apiService.getApi2(AppUrl.GetAllOcupationsUrl);
    print(response);
    return AllOcupationsModel.fromJson(response);
  }

  Future<ViewProfileDetailsModel> ViewProfileDetailsapi() async {
    // print("hited");
    dynamic response = await _apiService.getApi2(AppUrl.ViewProfileDetailsUrl);
    print(response);
    return ViewProfileDetailsModel.fromJson(response);
  }

  Future<UserLoginModel> UserLoginapi(var data) async {
    print("hit");
    dynamic response = await _apiService.postApi(data, AppUrl.UserLoginUrl);
    print(response);
    return UserLoginModel.fromJson(response);
  }

  Future<CountryModel> CountryCodeapi() async {
    print('fshdshsdhfafhsd');
    dynamic response = await _apiService.getApi2(AppUrl.CountryCodeUrl);
    print(response);
    return CountryModel.fromJson(response);
  }

  Future<ProfilesScrollModel> ProfileScrollapi() async {
    print("hited");
    dynamic response = await _apiService.getApi2(AppUrl.ProfileScrollUrl);
    print(response);
    return ProfilesScrollModel.fromJson(response);
  }

  Future<DomatchesModel> DoMatcchesapi(var data) async {
    print("hited");
    dynamic response = await _apiService.postApi2(data, AppUrl.DoMatchesUrl);
    print(response);
    return DomatchesModel.fromJson(response);
  }

  Future<ViewMakerProfileModel> ViewMakerProfileDetailsApi(var data) async {
    print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.ViewMakerProfileDetailsUrl);
    print(response);
    return ViewMakerProfileModel.fromJson(response);
  }

  Future<ViewSikerDetailsToMatchModel> ViewSikerDetailsToMatchApi(
      var data) async {
    print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.viewuserprofileUrl);
    print(response);
    return ViewSikerDetailsToMatchModel.fromJson(response);
  }
  Future<EditViewprofileDetailsModel> ViewSikerEditeDetails() async {
    print("hited");
    dynamic response =
    await _apiService.getApi2(AppUrl.EditeProfileUrl);
    print(response);
    return EditViewprofileDetailsModel.fromJson(response);
  }

  Future<AllMakerModel> ListAllMakerApi() async {
    print("hited");
    dynamic response = await _apiService.getApi2(AppUrl.GetAllMakerUrl);
    print(response);
    return AllMakerModel.fromJson(response);
  }

//***************** OutgoinRequestApi  *********************
  Future<OutgoingRequestModel> OutgoinRequestApi() async {
    print("OutgoinRequestApi");
    dynamic response = await _apiService.getApi2(AppUrl.OutgoingRequestUrl);
    print(response);
    return OutgoingRequestModel.fromJson(response);
  }

//***************** IncomingRequestApi  *********************
  Future<IncomingSeekerRequestModel> IncomingRequestApi() async {
    print("IncomingRequestApdsgfdhsgfdsjhdsjfhdsji");
    dynamic response = await _apiService.getApi2(AppUrl.IncomingRequestUrl);
    // print(response);
    print(response);
    return IncomingSeekerRequestModel.fromJson(response);
  }//***************** IncomingRequestApi  *********************
  Future<MakerMyprofileDetailsModel> getMakerProfileDetails() async {
    print("IncomingRequestApdsgfdhsgfdsjhdsjfhdsji");
    dynamic response = await _apiService.getApi2(AppUrl.MakerGetDetails);
    // print(response);
    print(response);
    return MakerMyprofileDetailsModel.fromJson(response);
  }

////////***************RequestDetails***************************** */
  Future<RequestDetailsModel> RequestDetailsApi(var data) async {
    print("IncomingRequestApi");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.RequestDetailsUrl);
    print("$response============");
    return RequestDetailsModel.fromJson(response);
  }

  Future<LikeListModel> likeListApi() async {
    dynamic response = await _apiService.getApi2(AppUrl.LikeListUrl);
    print(response);
    return LikeListModel.fromJson(response);
  }

  Future<RequestActionModel> RequestActionApi(var data) async {
    print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.RequestActionUrl);
    print(response);
    return RequestActionModel.fromJson(response);
  }

  Future<SikerTOSikerRequestModel> SeekerToSeekerRequestApi(var data) async {
    print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.SeekerToSeekerRequestUrl);
    print(response);
    return SikerTOSikerRequestModel.fromJson(response);
  }

  //***************** Incoming Maker Request ApiServices  *********************
  Future<IncomingMakerRequestModel> IncomingMakerRequestApi() async {
    print("IncomingMakerRequestApi");
    dynamic response =
        await _apiService.getApi2(AppUrl.IncomingMakerRequestUrl);
    print(response);
    return IncomingMakerRequestModel.fromJson(response);
  }

  //***************** Recent Seeker Matches ApiServices  *********************
  Future<RecentSeekerMatchesModel> RecentSeekerMatchesApi(var data) async {
    dynamic response =
        await _apiService.postApi2(data, AppUrl.RecentSeekerMatchesUrl);
    print(response);
    print("RecentSeekerMatchesApi");
    return RecentSeekerMatchesModel.fromJson(response);
  }

  //***************** Seeker Chat List ApiServices  *********************
  Future<SeekerChatListModel> SeekerChatListApi(var data) async {
    dynamic response = await _apiService.postApi2(data, AppUrl.SeekerChatList);
    print(response);
    print("SeekerChatListApi");
    return SeekerChatListModel.fromJson(response);
  }

  //***************** Recent Maker Matches ApiServices  *********************

  Future<MakerRecentMatchesModel> RecentMakerMatchesApi() async {
    print("RecentMakerMatchesApi");
    dynamic response = await _apiService.getApi2(AppUrl.RecentMakerMatchesUrl);
    print(response);
    return MakerRecentMatchesModel.fromJson(response);
  }

  //***************** Outgoing Maker Request ApiServices  *********************

  Future<OutgoingMakerRequestModel1> OutgoingMakerRequestApi() async {
    print("OutgoingMakerRequestApi");
    dynamic response =
        await _apiService.getApi2(AppUrl.OutgoingMakerRequestUrl);
    print(response);
    return OutgoingMakerRequestModel1.fromJson(response);
  }

  Future<MakersinglepageRequestModel> MakerRequestDetailsApi(var data) async {
    print("OutgoingMakerRequestApi");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.makerrequestsinglepage);
    print(response);
    return MakersinglepageRequestModel.fromJson(response);
  }

//**************** Maker Chat List ApiServices  ********************
  Future<MakerChatListModel> MakerChatListApi(var data) async {
    dynamic response = await _apiService.postApi2(data, AppUrl.MakerChatList);
    print(response);
    print("MakerChatListModel");
    return MakerChatListModel.fromJson(response);
  }

  //**************** Maker Chat List ApiServices  ********************
  Future<SpeendRequestModel> SpeendRequestDetailsapi() async {
    dynamic response = await _apiService.getApi2(AppUrl.SpeendRequestUrl);
    print(response);
    print("MakerChatListModel");
    return SpeendRequestModel.fromJson(response);
  }

  Future<StaticLiverPullModel> StaticLiverPullApi() async {
    // print("hited");
    dynamic response = await _apiService.getApi2(AppUrl.staticLiverPullUrl);
    // print(response);
    return StaticLiverPullModel.fromJson(response);
  }

  Future<SeekerMyProfileDetailModelAutoGenerate> SeekerMyProfileDetailsApi() async {
    // print("hited");
    dynamic response =
        await _apiService.getApi2(AppUrl.SeekerMyProfileDetailsUrl);
    // print(response);
    return SeekerMyProfileDetailModelAutoGenerate.fromJson(response);
  }

    Future<LiverPoolModel> LiverPoolRequestApi( var data) async {
    // print("hited");
    dynamic response =
        await _apiService.postApi2(data, AppUrl.LiverPoolRequestUrl);
    print(response);
    return LiverPoolModel.fromJson(response);
  }




//***************** Home IncomingRequestApi  *********************
  Future<SeekerHomeRequestModel> HomeIncomingRequestApi() async {
    print("IncomingRequestApdsgfdhsgfdsjhdsjfhdsji");
    dynamic response = await _apiService.getApi2(AppUrl.HomeIncomingRequestUrl);
    print(response);
    // print(response);
    return SeekerHomeRequestModel.fromJson(response);
  }
//***************** Sekker out Going Request Api  *********************
  Future<SeekerOutgoingRequestModel> SeekerOutgoingRequestListApi() async{
    dynamic response = await _apiService.getApi2(AppUrl.saeekerOutgoingRequestListApi);
    print('responseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee outgoing');
    print(response);
    return SeekerOutgoingRequestModel.fromJson(response) ;
  }
  //***************** Incoming Maker Home Request ApiServices  *********************
  Future<MakerHomePageModel> MakerHomePageRequestApi() async {
    print("IncomingMakerRequestApi");
    dynamic response =
    await _apiService.getApi2(AppUrl.MakerHomeRequestcontroller);
    print(response);
    return MakerHomePageModel.fromJson(response);
  }
  //***************** Maker singlerequest List ApiServices  ********************
  Future<MakersinglepageRequestModel> MakerSingleRequestPageRequestApi(var data ) async {
    print("IncomingMakerRequestApi");
    dynamic response =
    await _apiService.postApi2(data,AppUrl.MakerSinlgeRequestUrl);
    print(response);
    return MakersinglepageRequestModel.fromJson(response);
  }

  Future<CreateNewMatchesModel> CreateNewMatchesApi(var datas) async{
    dynamic response = await _apiService.postApi2(datas,AppUrl.createNewMatchesApi);
    print('responseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    print(response);
    dynamic data = CreateNewMatchesModel.fromJson(response) ;
    return data;
  }
 Future<RequestAcceptModel> RequestAcceptModelApi(var data ) async {
    print("IncomingMakerRequestApi");
    dynamic response =
    await _apiService.postApi2(data,AppUrl.RequestAcceptApi);
    print(response);
    return RequestAcceptModel.fromJson(response);
  }
   Future<SeekerToMakerRequestModel> SeekerToMakerRequestApi(var data ) async {
    print("IncomingMakerRequestApi");
    dynamic response =
    await _apiService.postApi2(data,AppUrl.SeekerToMakerRequest);
    print(response);
    return SeekerToMakerRequestModel.fromJson(response);
  }

  
}

