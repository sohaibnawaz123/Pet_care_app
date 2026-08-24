import 'package:flutter/material.dart';

class AppAsset {
  AppAsset._internal();

  static final AppAsset _instance = AppAsset._internal();

  factory AppAsset() {
    return _instance;
  }

  static const String imagePath = 'assets/images';
  static const String iconPath = 'assets/icons';
  static const String gifPath = 'assets/gifs';

  // ============================================================
  // Images
  // ============================================================

  static const String animalFootPatternBg =
      '$imagePath/animal_foot_pattern_bg.png';
  static const String dogImage = '$imagePath/dog_image.png';
  static const String dp1 = '$imagePath/dp1.jpg';
  static const String dp2 = '$imagePath/dp2.jpg';
  static const String logo = '$imagePath/logo.png';
  static const String logoSvg = '$imagePath/logo.svg';
  static const String splashLogo = '$imagePath/splash_logo.png';

  // Backward-compatible alias.
  static const String applogo = splashLogo;

  // ============================================================
  // GIFs
  // ============================================================

  static const String animatedMarkerGif = '$gifPath/animated_marker.gif';
  static const String bookingAcceptedGif = '$gifPath/booking_accepted.gif';
  static const String bookingRejectedGif = '$gifPath/booking_rejected.gif';
  static const String doneGif = '$gifPath/done.gif';
  static const String locationPinGif = '$gifPath/location_pin.gif';
  static const String paymentSendGif = '$gifPath/payment_send.gif';

  // ============================================================
  // Icons
  // ============================================================

  static const String additionalServiceIcon =
      '$iconPath/additional_service_icon.svg';
  static const String addCirculerIcon = '$iconPath/add_circuler.svg';
  static const String addMediaIcon = '$iconPath/addMedia.svg';
  static const String back = '$iconPath/back.svg';
  static const String birthIcon = '$iconPath/birth_icon.svg';
  static const String boardingIcon = '$iconPath/boarding_icon.svg';
  static const String boneIcon = '$iconPath/bone_icon.svg';
  static const String bookmarkIcon = '$iconPath/bookmark_icon.svg';
  static const String calendarIcon = '$iconPath/calendar.svg';
  static const String calendarSolidIcon = '$iconPath/calendar_solid.svg';
  static const String calendarTableIcon = '$iconPath/calender_table_icon.svg';
  static const String calendarTodayIcon = '$iconPath/calendar_today.svg';
  static const String callIcon = '$iconPath/Call.svg';
  static const String cameraIcon = '$iconPath/camera_icon.svg';
  static const String cardIcon = '$iconPath/card_icon.svg';
  static const String catSelectIcon = '$iconPath/cat_select_icon.svg';
  static const String chatIcon = '$iconPath/chat_icon.svg';
  static const String chattingIcon = '$iconPath/chatting_icon.svg';
  static const String checkinIcon = '$iconPath/checkin_icon.svg';
  static const String checkinIcon2 = '$iconPath/checkin_icon2.svg';
  static const String checkoutIcon = '$iconPath/checkout_icon.svg';
  static const String checkoutIcon2 = '$iconPath/checkout_icon2.svg';
  static const String clinicalNotesIcon = '$iconPath/clinical_notes.svg';
  static const String clockIcon = '$iconPath/clock_icon.svg';
  static const String dnaIcon = '$iconPath/dna_icon.svg';
  static const String dogIcon = '$iconPath/dog_icon.svg';
  static const String dogPuppyIcon = '$iconPath/dog_puppy_icon.svg';
  static const String dogSelectIcon = '$iconPath/dog_select_icon.svg';
  static const String donationIcon = '$iconPath/donation.svg';
  static const String downIcon = '$iconPath/down_icon.svg';
  static const String dropDownIcon = '$iconPath/drop_down_icon.svg';
  static const String editIcon2 = '$iconPath/edit_icon_2.svg';
  static const String editSquareIcon = '$iconPath/edit_square_icon.svg';
  static const String emergencyIcon = '$iconPath/emergency_icon.svg';
  static const String eye = '$iconPath/eye.svg';
  static const String eyeOff = '$iconPath/eye-off.svg';
  static const String facebook = '$iconPath/facebook.svg';
  static const String facebookIcon = '$iconPath/facebook_icon.svg';
  static const String genderIcon = '$iconPath/gender_icon.svg';
  static const String google = '$iconPath/google.svg';
  static const String groomIcon = '$iconPath/groom_icon.svg';
  static const String groomingIcon = '$iconPath/grooming_icon.svg';
  static const String hideIcon = '$iconPath/hide_icon.svg';
  static const String homeIcon = '$iconPath/home_icon.svg';
  static const String homeSitIcon = '$iconPath/home_sit_icon.svg';
  static const String image = '$iconPath/addMedia.svg';
  static const String instagramIcon = '$iconPath/instagram_icon.svg';
  static const String insuranceIcon = '$iconPath/insurance_icon.svg';
  static const String languageIcon = '$iconPath/language_icon.svg';
  static const String languageIconCopy = '$iconPath/language_icon copy.svg';
  static const String linkedinIcon = '$iconPath/linkedin_icon.svg';
  static const String locationPinIcon = '$iconPath/location_pin_icon.svg';
  static const String locationTrackingIcon =
      '$iconPath/location_tracking_icon.svg';
  static const String lockBrainIcon = '$iconPath/lock_brain_icon.svg';
  static const String lockSecureIcon = '$iconPath/lock_secure_icon.svg';
  static const String logoIcon = '$iconPath/logo.svg';
  static const String logout = '$iconPath/logout.svg';
  static const String logoutIcon = '$iconPath/logout_icon.svg';
  static const String masterIcon = '$iconPath/master_icon.svg';
  static const String medicalServicesIcon = '$iconPath/medical_services.svg';
  static const String medBagIcon = '$iconPath/med_bag_icon.svg';
  static const String medIcon = '$iconPath/med_icon.svg';
  static const String messageIcon = '$iconPath/Message.svg';
  static const String neurologyIcon = '$iconPath/neurology_icon.svg';
  static const String notificationBadgeIcon =
      '$iconPath/notification_badge.svg';
  static const String notificationIcon = '$iconPath/notification_icon.svg';
  static const String otherSelectIcon = '$iconPath/other_select_icon.svg';
  static const String outpatientIcon = '$iconPath/outpatient_icon.svg';
  static const String paperIcon = '$iconPath/Paper.svg';
  static const String pawIcon = '$iconPath/paw_icon.svg';
  static const String paypalIcon = '$iconPath/paypal_icon.svg';
  static const String petIcon = '$iconPath/pet_icon.svg';
  static const String plusIcon = '$iconPath/plus_icon.svg';
  static const String priceTagIcon = '$iconPath/price_tag_icon.svg';
  static const String privacyIcon = '$iconPath/privacy_icon.svg';
  static const String searchIcon = '$iconPath/search_icon.svg';
  static const String selectBookmarkIcon = '$iconPath/select_bookmark_icon.svg';
  static const String selectChatIcon = '$iconPath/select_chat_icon.svg';
  static const String selectHomeIcon = '$iconPath/select_home_icon.svg';
  static const String selectPetIcon = '$iconPath/select_pet_icon.svg';
  static const String selectSettingIcon = '$iconPath/select_setting_icon.svg';
  static const String serviceIcon = '$iconPath/service_icon.svg';
  static const String settingIcon = '$iconPath/setting_icon.svg';
  static const String settingNotificationIcon =
      '$iconPath/setting_notification_icon.svg';
  static const String supportIcon = '$iconPath/support_icon.svg';
  static const String taxTagIcon = '$iconPath/tax_tag_icon.svg';
  static const String timerIcon = '$iconPath/timer_icon.svg';
  static const String uaeFlagIcon = '$iconPath/uae_flag_icon.svg';
  static const String unlockBrainIcon = '$iconPath/unlock_brain_icon.svg';
  static const String unlockBrainIcon1 = '$iconPath/unlock_brain_icon1.svg';
  static const String unlockIcon = '$iconPath/unlock_icon.svg';
  static const String unlockPlusIcon = '$iconPath/unlock_plus_icon.svg';
  static const String unlockSecureIcon = '$iconPath/unlock_secure_icon.svg';
  static const String usFlagIcon = '$iconPath/us_flag_icon.svg';
  static const String verifyIcon = '$iconPath/verify_icon.svg';
  static const String vetRunIcon = '$iconPath/vetrun_icon.svg';
  static const String vetIcon = '$iconPath/vet_icon.svg';
  static const String visaIcon = '$iconPath/visa_icon.svg';
  static const String voiceLineIcon = '$iconPath/voice_line.svg';
  static const String walkingIcon = '$iconPath/walking_icon.svg';
  static const String walkingIcon2 = '$iconPath/walking_icon2.svg';
  static const String walletIcon = '$iconPath/wallet_icon.svg';
  static const String warningIcon = '$iconPath/warning_icon.svg';
  static const String weightScaleIcon = '$iconPath/weight_scale_icon.svg';
  static const String youtubeIcon = '$iconPath/youtube_icon.svg';

  // ============================================================
  // Location / Map
  // ============================================================

  static const IconData maps = Icons.pin_drop_outlined;
  static const IconData pinDrop = Icons.pin_drop;
  static const IconData pinDrop2 = Icons.location_pin;
  static const IconData locationRadius = Icons.radar_outlined;
  static const IconData mapType = Icons.map_outlined;
  static const IconData myLocation = Icons.my_location_outlined;
  static const IconData myPlace = Icons.crop_free;
  static const IconData location = Icons.location_on_outlined;
  static const IconData gpsIcon = Icons.radar;
  static const IconData measureDistanceArea = Icons.compare_arrows;
  static const IconData drawArea = Icons.share_outlined;
  static const IconData polyline = Icons.polyline_outlined;
  static const IconData polygon = Icons.hexagon_outlined;

  // ============================================================
  // Navigation / Arrows
  // ============================================================

  static const IconData rightArrow = Icons.arrow_forward_ios_outlined;
  static const IconData downArrow = Icons.keyboard_arrow_down_outlined;
  static const IconData moveUp = Icons.move_up_outlined;

  static const IconData backIcon = Icons.arrow_back_ios_new_sharp;
  static const IconData back2 = Icons.arrow_back;
  static const IconData forward = Icons.arrow_forward_ios_sharp;
  static const IconData forward2 = Icons.arrow_forward;

  static const IconData dropDownArrow = Icons.arrow_drop_down_outlined;
  static const IconData dropDownArrowUp = Icons.arrow_drop_up_outlined;

  // ============================================================
  // User / Profile
  // ============================================================

  static const IconData profile = Icons.person_outline;
  static const IconData personIcon = Icons.person;
  static const IconData edit = Icons.edit;
  static const IconData editIcon = Icons.edit;

  static const IconData contactUs = Icons.support_agent_outlined;
  static const IconData preference = Icons.settings_applications_outlined;
  static const IconData darkMode = Icons.dark_mode_outlined;
  static const IconData changeLanguage = Icons.translate_outlined;

  // ============================================================
  // Saved / Projects / Properties
  // ============================================================

  static const IconData saved = Icons.favorite_outline;
  static const IconData savedFilled = Icons.favorite;
  static const IconData jobs = Icons.work_outline;
  static const IconData addProperty = Icons.add_home_outlined;
  static const IconData saveProject = Icons.bookmark_border;
  static const IconData projects = Icons.home_work_outlined;
  static const IconData building = Icons.location_city_outlined;

  // ============================================================
  // Search / More / Menu
  // ============================================================

  static const IconData search = Icons.search_outlined;
  static const IconData more = Icons.apps_outlined;
  static const IconData moreHorizontal = Icons.more_horiz_outlined;
  static const IconData moreVertical = Icons.more_vert_outlined;
  static const IconData menu = Icons.menu;

  // ============================================================
  // Share / Social
  // ============================================================

  static const IconData share = Icons.ios_share_outlined;
  static const IconData share2 = Icons.shortcut_outlined;
  static const IconData social = Icons.rss_feed_outlined;
  static const IconData public = Icons.public_outlined;

  // ============================================================
  // Settings / Information
  // ============================================================

  static const IconData termsConditions = Icons.menu_book_outlined;
  static const IconData privacyPolicy = Icons.privacy_tip_outlined;
  static const IconData information = Icons.info_outline_rounded;
  static const IconData faqs = Icons.help_outline;
  static const IconData speed = Icons.speed_outlined;
  static const IconData cloud = Icons.cloud_outlined;

  // ============================================================
  // Security
  // ============================================================

  static const IconData lock = Icons.lock_sharp;
  static const IconData lock2 = Icons.lock_outline_sharp;

  // ============================================================
  // Actions
  // ============================================================

  static const IconData add = Icons.add;
  static const IconData addCirculer = Icons.add_circle_outline;
  static const IconData delete = Icons.delete_outlined;
  static const IconData download = Icons.download;
  static const IconData save = Icons.save_outlined;
  static const IconData refresh = Icons.refresh_outlined;
  static const IconData check = Icons.check;
  static const IconData close = Icons.close_outlined;
  static const IconData cross = Icons.close;
  static const IconData crossOutline = Icons.cancel_outlined;
  static const IconData undo = Icons.undo_outlined;

  // ============================================================
  // Authentication
  // ============================================================

  static const IconData login = Icons.login;
  static const IconData logoutData = Icons.logout_outlined;

  // ============================================================
  // Visibility
  // ============================================================

  static const IconData visible = Icons.visibility_outlined;
  static const IconData visibleOff = Icons.visibility_off_outlined;

  // ============================================================
  // Communication
  // ============================================================

  static const IconData addChat = Icons.maps_ugc_outlined;
  static const IconData emoji = Icons.emoji_emotions_outlined;
  static const IconData mic = Icons.mic;
  static const IconData camera = Icons.camera_alt_outlined;
  static const IconData email = Icons.email_outlined;
  static const IconData phone = Icons.phone_outlined;
  static const IconData send = Icons.send;

  static const IconData chatOutlined = Icons.chat_outlined;
  static const IconData chatRounded = Icons.chat_rounded;

  // ============================================================
  // Notifications
  // ============================================================

  static const IconData notification = Icons.notifications_outlined;
  static const IconData notificationOff = Icons.notifications_off;

  // ============================================================
  // Media
  // ============================================================

  static const IconData imageIcon = Icons.image_outlined;
  static const IconData photoLibrary = Icons.photo_library_outlined;
  static const IconData photo = Icons.photo_outlined;
  static const IconData addPhoto = Icons.add_a_photo_outlined;

  static const IconData play = Icons.play_arrow;
  static const IconData pause = Icons.pause;
  static const IconData stop = Icons.stop;

  static const IconData playCircle = Icons.play_circle_outline;
  static const IconData playVoiceNote = Icons.play_circle_fill;
  static const IconData pauseVoiceNote = Icons.pause_circle_filled;

  static const IconData volumeOff = Icons.volume_off;
  static const IconData volumeUp = Icons.volume_up;

  // ============================================================
  // Files / Attachments
  // ============================================================

  static const IconData attachment = Icons.attach_file_outlined;
  static const IconData import = Icons.upload_file_outlined;
  static const IconData upload = Icons.upload_outlined;
  static const IconData uploadIcon = Icons.file_upload_outlined;
  static const IconData dataSheet = Icons.storage;

  // ============================================================
  // Calendar / Time
  // ============================================================

  static const IconData calendar = Icons.date_range_outlined;
  static const IconData clock = Icons.access_time_outlined;

  // ============================================================
  // Status / Errors
  // ============================================================

  static const IconData circle = Icons.circle;
  static const IconData error = Icons.error;
  static const IconData imageError = Icons.image_not_supported_outlined;
  static const IconData videoError = Icons.play_disabled_outlined;

  // ============================================================
  // Requests
  // ============================================================

  static const IconData incommingRequest = Icons.turn_left_outlined;
  static const IconData outgoingRequest = Icons.turn_right_outlined;

  // ============================================================
  // Miscellaneous
  // ============================================================

  static const IconData joystick = Icons.control_camera_outlined;
  static const IconData colorize = Icons.colorize_outlined;
  static const IconData color = Icons.color_lens_outlined;
  static const IconData payment = Icons.payment_outlined;
  static const IconData filter = Icons.filter_alt_outlined;
  static const IconData ads = Icons.feed_outlined;
}
