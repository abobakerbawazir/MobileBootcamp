import 'package:flutter/material.dart';
import 'package:video/HomeWok_Video/features/Model/VideoModel/Video.dart';
import 'package:video/HomeWok_Video/features/Veiw/Costom_Plan_page.dart';
import 'package:video/HomeWok_Video/features/Veiw/CreateAnAccount.dart';
import 'package:video/HomeWok_Video/features/Veiw/EditProfile.dart';
import 'package:video/HomeWok_Video/features/Veiw/HomeScreen.dart';
import 'package:video/HomeWok_Video/features/Veiw/Home_nav.dart';
import 'package:video/HomeWok_Video/features/Veiw/List_is_Empty_16.dart';
import 'package:video/HomeWok_Video/features/Veiw/Login_7.dart';
import 'package:video/HomeWok_Video/features/Veiw/NotificationPage.dart';
import 'package:video/HomeWok_Video/features/Veiw/Page9_splash.dart';
import 'package:video/HomeWok_Video/features/Veiw/PageNotFound.dart';
import 'package:video/HomeWok_Video/features/Veiw/Page_1_2_3.dart';
import 'package:video/HomeWok_Video/features/Veiw/Payment/Payment_15_page.dart';
import 'package:video/HomeWok_Video/features/Veiw/PaymentMethod14.dart';
import 'package:video/HomeWok_Video/features/Veiw/Payment_Method_13.dart';
import 'package:video/HomeWok_Video/features/Veiw/Sign_in.dart';
import 'package:video/HomeWok_Video/features/Veiw/Subscription_Plan.dart';
import 'package:video/HomeWok_Video/features/Veiw/VerificationCode.dart';
import 'package:video/HomeWok_Video/features/Veiw/VideoPlayerScreenPage.dart';
import 'package:video/HomeWok_Video/features/Veiw/WatcList.dart';
import 'package:video/HomeWok_Video/features/Veiw/ListWatch_Video.dart';
import 'package:video/HomeWok_Video/features/Veiw/bottomNavigationBar/BottomNav.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Page_1_2_3();
            },
          );
        }
      case '/aaa':
        {
          return MaterialPageRoute(
            builder: (context) {
              final List<Video> x =
                  ModalRoute.of(context)!.settings.arguments as List<Video>;
              return ListWatch_Video(
                x: x,
              );
            },
          );
        }
      case '/homeNav':
        {
          return MaterialPageRoute(
            builder: (context) {
              //final List<Video> x=ModalRoute.of(context)!.settings.arguments as List<Video>;
              return HomeNav();
            },
          );
        }
      case '/home':
        {
          return MaterialPageRoute(builder: (ctx) {
            return HomeScreen();
          });
        }

      case '/bottomNav':
        {
          return MaterialPageRoute(
            builder: (context) {
              return BottomNav();
            },
          );
        }

      case '/watchListPage':
        {
          return MaterialPageRoute(
            builder: (context) {
              return WatchListPage();
            },
          );
        }

      case '/notification_page':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Notification_page();
            },
          );
        }
      case '/paymentMethod14':
        {
          return MaterialPageRoute(
            builder: (context) {
              return PaymentMethod14();
            },
          );
        }
      case '/listIsEmpty':
        {
          return MaterialPageRoute(
            builder: (context) {
              return ListIsEmpty();
            },
          );
        }
      case '/sign_in':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Sign_in();
            },
          );
        }

      case '/costom_Plan_Page':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Costom_Plan_Page();
            },
          );
        }

      case '/payment_Method_13':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Payment_Method_13();
            },
          );
        }
      case '/loginPage':
        {
          return MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          );
        }
      case '/page9_Splash':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Page9_Splash();
            },
          );
        }
      case '/subscription_Plan':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Subscription_Plan();
            },
          );
        }
      case '/editProfile':
        {
          return MaterialPageRoute(
            builder: (context) {
              return EditProfile();
            },
          );
        }

      case '/createAnAccount':
        {
          return MaterialPageRoute(
            builder: (context) {
              return CreateAnAccount();
            },
          );
        }
      case '/payment_15_page':
        {
          return MaterialPageRoute(
            builder: (context) {
              return Payment_15_page();
            },
          );
        }

      case '/VideoPlayerScreenPage':
        {
          return MaterialPageRoute(
            builder: (context) {
              final String video_path =
                  ModalRoute.of(context)!.settings.arguments as String;
              return VideoPlayerScreenPage(video_path);
            },
          );
        }
      case '/verificationCodePage':
        {
          return MaterialPageRoute(
            builder: (context) {
              return VerificationCodePage();
            },
          );
        }
      default:
        {
          return MaterialPageRoute(builder: (ctx) {
            return const PageNotFound();
          });
        }
    }
  }
}
