import 'package:ecommerceapp/core/constants/lang_keys.dart';

Map<String, String> enMap = {
  // main
  LangKeys.appTitle: "My App",
  LangKeys.offersTitle: "Offers",

  // onboarding
  LangKeys.chooseLanguage: "Choose Your Language",
  LangKeys.arabic: "Arabic",
  LangKeys.english: "English",
  LangKeys.germany: "German",
  LangKeys.spain: "Spanish",
  LangKeys.chooseProduct: "Choose Product",
  LangKeys.onBoarding1: "Welcome to the app",
  LangKeys.onBoardingTitle1: "Discover Everything You Need 🛍️",
  LangKeys.onBoardingTitle2: "Fast & Secure Delivery 🚚",
  LangKeys.onBoardingTitle3: "Flexible Payment Options 💳",
  LangKeys.onBoardingBody1:
      "Browse thousands of products from all \ncategories with ease and security.",
  LangKeys.onBoardingBody2:
      "Place your order and get it delivered right\n to your doorstep in no time.",
  LangKeys.onBoardingBody3:
      "Pay your way – by card, bank transfer,\n or cash on delivery.",
  LangKeys.next: "Next",
  LangKeys.enter: "Enter",

  // auth
  LangKeys.login: "Login",
  LangKeys.loginTitle: "Welcome Back",
  LangKeys.loginSub: "Sign in with your email and password",
  LangKeys.signup: "Sign Up",
  LangKeys.signupTitle: "Join Us Now",
  LangKeys.signupSub: "Register your information",
  LangKeys.rememberMe: "Remember Me",
  LangKeys.forgetPassword: "Forgot Password?",
  LangKeys.dontHaveAccount: "Don't have an account? ",
  LangKeys.ifHaveAccount: "If you have an account, ",
  LangKeys.email: "Email",
  LangKeys.emailFieldHint: "Enter your email",
  LangKeys.password: "Password",
  LangKeys.passwordFieldHint: "Enter your password",
  LangKeys.userName: "User Name",
  LangKeys.userNameFieldHint: "Enter your user name",
  LangKeys.phone: "Phone",
  LangKeys.phoneFieldHint: "Enter your phone number",
  LangKeys.confirmPassword: "Confirm Password",
  LangKeys.confirmHint: "Re-enter your password",
  LangKeys.emptyFieldError: "This field cannot be empty",
  LangKeys.minLengthError: "Minimum length not met",
  LangKeys.maxLengthError: "Maximum length exceeded",
  LangKeys.checkYourEmail: "Check your email",
  LangKeys.check: "Check",
  LangKeys.returnTo: "Return to",
  LangKeys.verificationCode: "Verification Code",
  LangKeys.verificationSentence:
      "Enter the verification code sent to your email",
  LangKeys.continueButton: "Continue",
  LangKeys.newPassword: "New Password",
  LangKeys.resetPassword: "Reset Password",
  LangKeys.resetPasswordSentence: "Enter a new password to reset",
  LangKeys.save: "Save",
  LangKeys.goLogin: "Go to Login",
  LangKeys.passChangedSuccess: "Password changed successfully",
  LangKeys.passChangedSuccessTitle: "Success",
  LangKeys.passChangedSuccessSub:
      "Your password has been updated successfully.",
  LangKeys.pcAuthText: """
      Welcome Back! 👋

Discover a smarter way to shop.  
Thousands of products, seamless experience, and lightning-fast delivery – all in one place.

Create your account now and join a growing community of smart shoppers.

Your next favorite item is just a click away.
""",

  // homepage
  LangKeys.searchFieldHint: "Search for product...",
  LangKeys.specialForYou: "Special For You",
  LangKeys.seeAll: "See All",
  LangKeys.categories: "Categories",
  LangKeys.topSelling: "Top Selling",
  LangKeys.offers: "Offers",
  LangKeys.cart: "Cart",
  LangKeys.profile: "Profile",
  LangKeys.settings: "Settings",

  // cart
  LangKeys.cartTitle: "Cart",
  LangKeys.couponFiledHint: "Enter coupon code",
  LangKeys.apply: "Apply",
  LangKeys.checkoutButton: "Checkout",
  LangKeys.cartTotal: "Cart Total",
  LangKeys.deliveryCost: "Delivery Cost",
  LangKeys.total: "Total",
  LangKeys.confirmRemoveFromCart: "Do you agree to remove @itemName from cart?",
  LangKeys.cartIsEmpty: "Your cart is empty, please add some items first.",
  LangKeys.error: "Error",

  // checkout
  LangKeys.checkoutTitle: "Checkout",
  LangKeys.deliveryMethod: "Delivery Method",
  LangKeys.delivery: "Delivery",
  LangKeys.receiveStore: "Receive from Store",
  LangKeys.address: "Address",
  LangKeys.paymentMethod: "Payment Method",
  LangKeys.cash: "cash on delivery",
  LangKeys.creditCards: "Credit Cards",
  LangKeys.payOnline: "pay online",
  LangKeys.wallets: "Digital Wallets",
  LangKeys.chooseDelivery: "Please choose delivery method",
  LangKeys.chooseAddress: "Please choose address",
  LangKeys.choosePayment: "Please choose payment method",
  LangKeys.done: "done",
  LangKeys.orderSuccess: "the order created successfully ",

  // profile
  LangKeys.orders: "Orders",
  LangKeys.ordersSub: "Your Orders List",
  LangKeys.information: "Information",
  LangKeys.informationSub: "Update your info",
  LangKeys.addresses: "Addresses",
  LangKeys.addressesSub: "Manage your addresses",

  // address
  LangKeys.choosingLocationTitle1: "Choose Location",
  LangKeys.choosingLocationTitle2: "Select your precise location",
  LangKeys.addressName: "Address Name",
  LangKeys.selectGov: "Select Governorate",
  LangKeys.selectCity: "Select City",
  LangKeys.streetName: "Street Name",
  LangKeys.add: "Add",

  // orders
  LangKeys.pendingOrders: "Pending Orders",
  LangKeys.orderNumber: "Order Number",
  LangKeys.totalPrice: "Total Price",
  LangKeys.status: "Order Status",
  LangKeys.details: "Details",
  LangKeys.delete: "Delete",
  LangKeys.archiveOrders: "Archive Orders",
  LangKeys.pendingAwait: "Pending",
  LangKeys.approved: "Approved",
  LangKeys.onTheWay: "On the Way",
  LangKeys.prepared: "Prepared",
  LangKeys.archived: "Archived",
  LangKeys.orderDetails: "Order Details",
  LangKeys.price: "Price",
  LangKeys.quantity: "Quantity",
  LangKeys.item: "Item",
  LangKeys.tracking: "tracking",

  // settings
  LangKeys.settingsTitle: "Settings",
  LangKeys.language: "Language",
  LangKeys.languageSub: "Choose your preferred language",
  LangKeys.notification: "Notification",
  LangKeys.notificationSub: "Manage notifications",
  LangKeys.theme: "Theme",
  LangKeys.darkTheme: "dark Theme",
  LangKeys.themeSub: "Choose app theme",
  LangKeys.aboutUs: "About Us",
  LangKeys.aboutUsSub: "Information about app",
  LangKeys.contactUs: "Contact Us",
  LangKeys.contactUsSub: "We welcome your feedback",
  LangKeys.logOut: "Log Out",
  LangKeys.logOutSub: "Sign out from app",

  // dialog
  LangKeys.warn: "Warning",
  LangKeys.deleteConfirmMsg: "Are you sure you want to delete this item?",
  LangKeys.ok: "OK",
  LangKeys.cancel: "Cancel",
  LangKeys.confirm: "Confirm",
  LangKeys.logoutConfirmMsg: "Do you want to log out?",
  LangKeys.exitMsg: "Do you want to exit ?",
  LangKeys.exit: "exit",
};
