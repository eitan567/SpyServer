<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 2.3.2
Version: 1.4
Author: KeenThemes
Website: http://www.keenthemes.com/preview/?theme=metronic
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469
-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<!-- Mirrored from www.keenthemes.com/preview/metronic_admin_rtl/index.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 14 Aug 2013 15:37:24 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8" />
<title>Metronic | Admin Dashboard Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/plugins/bootstrap/css', file: 'bootstrap-rtl.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/plugins/bootstrap/css', file: 'bootstrap-responsive-rtl.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/plugins/font-awesome/css', file: 'font-awesome.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/css', file: 'style-metro-rtl.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/css', file: 'style-rtl.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/css', file: 'style-responsive-rtl.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/css/themes', file: 'default-rtl.css')}"
	type="text/css" id="style_color">
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/plugins/uniform/css', file: 'uniform.default.css')}"
	type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/plugins/select2', file: 'select2_metro_rtl.css')}"
	type="text/css" />
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet"
	href="${resource(dir: 'uaassets/css/pages', file: 'login-rtl.css')}"
	type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<link rel="shortcut icon" href="favicon.ico" />

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<img src="../uaassets/img/logo-big.png" alt="" />
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<g:form class="form-vertical login-form" controller="auth"
			action="signIn" method="post">
			<input type="hidden" name="targetUri" value="${targetUri}" />
			<h3 class="form-title">התחבר לחשבונך</h3>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>הזן שם משתמש וסיסמה כלשהם.</span>
			</div>

			<g:if test="${flash.message}">
				<div class="alert alert-error">
					<button class="close" data-dismiss="alert"></button>
					<span>
						${flash.message}
					</span>
				</div>
			</g:if>

			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">שם
					משתמש</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" autocomplete="off" placeholder="שם משתמש"
							name="username" value="${username}" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">סיסמה</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" autocomplete="off" placeholder="סיסמה"
							name="password" value="" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox"> <input type="checkbox"
					name="rememberMe" value="${rememberMe}" /> זכור אותי
				</label>
				<button type="submit" class="btn green pull-left">
					התחבר <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
			<div class="forget-password">
				<h4>שחכת את סיסמתך ?</h4>
				<p>
					אל דאגה, לחץ <a href="javascript:;" id="forget-password">כאן</a> על
					מנת לאפס את סיסמתך.
				</p>
			</div>
			<div class="create-account">
				<p>
					אין לך עדיין חשבון ?&nbsp; <a href="javascript:;" id="register-btn">צור
						חשבון משתמש חדש</a>
				</p>
			</div>
		</g:form>
		<!-- END LOGIN FORM -->
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form class="form-vertical forget-form"
			action="http://www.keenthemes.com/preview/metronic_admin_rtl/index.html"
			method="post">
			<h3>שחכת את סיסמתך ?</h3>
			<p>הזן את הדואר האלקטרוני שלך על מנת לאפס את הסיסמה</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text" autocomplete="off"
							placeholder="דואר אלקטרוני" name="email" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
					<i class="m-icon-swapleft"></i> חזרה
				</button>
				<button type="submit" class="btn green pull-left">
					אישור <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
		<!-- END FORGOT PASSWORD FORM -->
		<!-- BEGIN REGISTRATION FORM -->
		<g:form class="form-vertical register-form" action="register"
			controller="auth" method="post">
			<input type="hidden" name="registerTargetUri" value="${targetUri}" />
			<h3>רישום משתמש</h3>
			<p>הזן את פרטיך האישיים מטה:</p>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">שם מלא</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-font"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="שם מלא" name="fullname"
							value="${user.fullname}" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">דואר
					אלקטרוני</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text"
							placeholder="דואר אלקטרוני" name="email" value="${user.email}" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">כתובת</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-ok"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="כתובת" name="address"
							value="${user.address}" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">עיר</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-location-arrow"></i> <input
							class="m-wrap placeholder-no-fix" type="text" placeholder="עיר"
							name="city" value="${user.city}" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="row-fluid">
					<label class="control-label visible-ie8 visible-ie9">מדינה</label>
					<div class="controls">
						<select name="country" id="select2_sample4" class="span12 select2"
							value="${user.country}">
							<option value=""></option>
							<option value="AF">אפגניסטן</option>
							<option value="AL">אלבניה</option>
							<option value="DZ">אלג'יריה</option>
							<option value="AS">האמריקאי סמואה</option>
							<option value="AD">אנדורה</option>
							<option value="AO">אנגולה</option>
							<option value="AI">אנגווילה</option>
							<option value="AQ">אנטרקטיקה</option>
							<option value="AR">ארגנטינה</option>
							<option value="AM">ארמניה</option>
							<option value="AW">ארובה</option>
							<option value="AU">אוסטרליה</option>
							<option value="AT">אוסטריה</option>
							<option value="AZ">אזרבייג'ן</option>
							<option value="BS">בהאמה</option>
							<option value="BH">בחריין</option>
							<option value="BD">בנגלדש</option>
							<option value="BB">ברבדוס</option>
							<option value="BY">בלארוס</option>
							<option value="BE">בלגיה</option>
							<option value="BZ">בליז</option>
							<option value="BJ">בנין</option>
							<option value="BM">ברמודה</option>
							<option value="BT">בהוטן</option>
							<option value="BO">בוליביה</option>
							<option value="BA">בוסניה והרצגובינה</option>
							<option value="BW">בוצואנה</option>
							<option value="BV">בובה איילנד</option>
							<option value="BR">ברזיל</option>
							<option value="IO">טריטוריה בריטית באוקיינוס ​​הודי</option> 
							<option value="BN">ברוני</option>
							<option value="BG">בולגריה</option>
							<option value="BF">ורקינה פאסו</option>
							<option value="BI">בורונדי</option>
							<option value="KH">קמבודיה</option>
							<option value="CM">קמרון</option>
							<option value="CA">קנדה</option>
							<option value="CV">קייפ ורדה</option>
							<option value="KY">איי קיימן</option>
							<option value="CF">רפובליקת מרכז האפריקאי</option>
							<option value="TD">צ'אד</option>
							<option value="CL">צ'ילה</option>
							<option value="CN">סין</option>
							<option value="CX">חג המולד איילנד</option>
							<option value="CC">קוקוס ( קילינג)</option>
							<option value="CO">קולומביה</option>
							<option value="KM">קומורו</option>
							<option value="CG">קונגו</option>
							<option value="CD">רפובליקה הדמוקרטית של קונגו</option>
							<option value="CK">איי קוק</option>
							<option value="CR">קוסטה ריקה</option>
							<option value="CI">חוף השנהב</option>
							<option value="HR">קרואטיה ( קרואטיה)</option>
							<option value="CU">קובה</option>
							<option value="CY">קפריסין</option>
							<option value="CZ">צ'כיה</option>
							<option value="DK">דנמרק</option>
							<option value="DJ">ג'יבוטי</option>
							<option value="DM">דומיניקה</option>
							<option value="DO">רפובליקה דומיניקנית</option>
							<option value="EC">אקוודור</option>
							<option value="EG">מצרים</option>
							<option value="SV">אל סלבדור</option>
							<option value="GQ">גיניאה המשוונית</option>
							<option value="ER">אריתריאה</option>
							<option value="EE">אסטוניה</option>
							<option value="ET">אתיופיה</option>
							<option value="FK">איי פוקלנד ( מלווינס)</option>
							<option value="FO">איים פארו</option>
							<option value="FJ">פיג'י</option>
							<option value="FI">פינלנד</option>
							<option value="FR">צרפת</option>
							<option value="GF">הצרפתי גיאנה</option>
							<option value="PF">פולינזיה צרפתית</option>
							<option value="TF">הצרפתית טריטוריות דרומיות</option>
							<option value="GA">גבון</option>
							<option value="GM">גמביה</option>
							<option value="GE">גאורגיה</option>
							<option value="DE">גרמניה </option>
							<option value="GH">גאנה</option>
							<option value="GI">גיברלטר</option>
							<option value="GR">יוון</option>
							<option value="GL">גרינלנד</option>
							<option value="GD">גרנדה</option>
							<option value="GP">גוואדלופ</option>
							<option value="GU">גואה</option>
							<option value="GT">גואטמלה</option>
							<option value="GN">גינאה</option>
							<option value="GW">גינאה ביסאו</option>
							<option value="GY">גיאנה</option>
							<option value="HT">האיטי</option>
							<option value="HM">הרדואיי מק דונלד</option>
							<option value="VA">הכס קדוש ( מדינת הוותיקן)</option>
							<option value="HN">הונדורס</option>
							<option value="HK">הונג קונג</option>
							<option value="HU">הונגריה</option>
							<option value="IS">איסלנד</option>
							<option value="IN">הודו </option>
							<option value="ID">אינדונזיה</option>
							<option value="IR">איראן ( רפובליקה אסלאמית של )</option>
							<option value="IQ">עיראק</option>
							<option value="IE">אירלנד</option>
							<option value="IL">ישראל </option>
							<option value="IT">איטליה</option>
							<option value="JM">ג'מייקה</option>
							<option value="JP">יפן</option>
							<option value="JO">ירדן</option>
							<option value="KZ">קזחסטן</option>
							<option value="KE">קניה</option>
							<option value="KI">קיריבטי</option>
							<option value="KP">הרפובליקה דמוקרטית העממית של קוריאה</option>
							<option value="KR">קוריאה, רפובליקה של</option>
							<option value="KW">כווית</option>
							<option value="KG">קירגיסטן</option>
							<option value="LA">העממית של לאוס רפובליקה דמוקרטית</option>
							<option value="LV">לטביה</option>
							<option value="LB">לבנון</option>
							<option value="LS">לסוטו</option>
							<option value="LR">ליבריה</option>
							<option value="LY">ערבית לובית</option>
							<option value="LI">ליכטנשטיין</option>
							<option value="LT">ליטא</option>
							<option value="LU">לוקסמבורג</option>
							<option value="MO">מקאו</option>
							<option value="MK">הרפובליקה היוגוסלבית לשעבר של מקדוניה</option>
							<option value="MG">מדגסקר</option>
							<option value="MW">מלאווי</option>
							<option value="MY">מלזיה</option>
							<option value="MV">האיים המלדיביים</option>
							<option value="ML">מלי</option>
							<option value="MT">מלטה</option>
							<option value="MH">איי מרשל</option>
							<option value="MQ">מרטיניק</option>
							<option value="MR">מאוריטניה</option>
							<option value="MU">מאוריציוס</option>
							<option value="YT">מאיוט</option>
							<option value="MX">מקסיקו</option>
							<option value="FM">מיקרונזיה, מדינות המאוחדות של</option>
							<option value="MD">מולדובה, רפובליקה של</option>
							<option value="MC">מונקו</option>
							<option value="MN">מונגוליה</option>
							<option value="MS">מונטסראט</option>
							<option value="MA">מרוקו</option>
							<option value="MZ">מוזמביק</option>
							<option value="MM">מיאנמר</option>
							<option value="NA">נמיביה</option>
							<option value="NR">נאורו</option>
							<option value="NP">נפאל</option>
							<option value="NL">הולנד</option>
							<option value="AN">האנטילים הולנדיים</option>
							<option value="NC">קלדוניה החדשה</option>
							<option value="NZ">ניו זילנד</option>
							<option value="NI">ניקרגואה</option>
							<option value="NE">ניז'ר ​​</option>
							<option value="NG">ניגריה</option>
							<option value="NU">ניואה</option>
							<option value="NF">אי נורפולק</option>
							<option value="MP">מריאנה הצפוני איי</option>
							<option value="NO">נורבגיה</option>
							<option value="OM">עומאן</option>
							<option value="PK">פקיסטן</option>
							<option value="PW">פלאו</option>
							<option value="PA">פנמה</option>
							<option value="PG">פפואה גינאה חדשה</option>
							<option value="PY">פרגוואי</option>
							<option value="PE">פרו</option>
							<option value="PH">פיליפינים</option>
							<option value="PN">פיטקרן</option>
							<option value="PL">פולין </option>
							<option value="PT">פורטוגל</option>
							<option value="PR">פורטו ריקו</option>
							<option value="QA">קטאר</option>
							<option value="RE">ראוניון</option>
							<option value="RO">רומניה </option>
							<option value="RU">פדרציה רוסית</option>
							<option value="RW">רואנדה</option>
							<option value="KN">קיטס ונוויס</option>
							<option value="LC">סנט לוסיה</option>
							<option value="VC">סנט וינסנט והגרנדינים</option>
							<option value="WS">סמואה</option>
							<option value="SM">סן מרינו</option>
							<option value="ST">פרינסיפה סאו טומהו</option>
							<option value="SA">סעודיה</option>
							<option value="SN">סנגל</option>
							<option value="SC">סיישל</option>
							<option value="SL">סיירה ליאונה</option>
							<option value="SG">סינגפור</option>
							<option value="SK">סלובקיה ( רפובליקה סלובקית )</option>
							<option value="SI">סלובניה</option>
							<option value="SB">האי שלמה</option>
							<option value="SO">סומליה</option>
							<option value="ZA">דרום אפריקה</option>
							<option value="GS">ג'ורג'יה הדרומית ואיי סנדוויץ'הדרומי</option>
							<option value="ES">ספרד</option>
							<option value="LK">סרי לנקה</option>
							<option value="SH">סנט הלנה</option>
							<option value="PM">סנט פייר ומיקלון</option>
							<option value="SD">סודאן</option>
							<option value="SR">סורינאם</option>
							<option value="SJ">סוולברדואיי ז'אן יאן</option>
							<option value="SZ">סווזילנד</option>
							<option value="SE">שוודיה</option>
							<option value="CH">שוויץ</option>
							<option value="SY">רפובליקה הערבית סורית</option>
							<option value="TW">טייוואן, פרובינציה של סין</option>
							<option value="TJ">טג'יקיסטן</option>
							<option value="TZ">טנזניה, רפובליקה המאוחדת של</option>
							<option value="TH">תאילנד</option>
							<option value="TG">טוגו</option>
							<option value="TK">טוקלאו</option>
							<option value="TO">טונגה</option>
							<option value="TT">טרינידד וטובגו</option>
							<option value="TN">תוניסיה</option>
							<option value="TR">טורקיה</option>
							<option value="TM">טורקמניסטן</option>
							<option value="TC">טורקים ואיי קייקוס</option>
							<option value="TV">טובאלו</option>
							<option value="UG">אוגנדה</option>
							<option value="UA">אוקראינה</option>
							<option value="AE">איחוד אמירויות ערבי</option>
							<option value="GB">בריטניה</option>
							<option value="US">ארצות הברית</option>
							<option value="UM">ארצות הברית קטן איי תחת שלטון</option>
							<option value="UY">אורוגוואי</option>
							<option value="UZ">אוזבקיסטן</option>
							<option value="VU">ונואטו</option>
							<option value="VE">ונצואלה</option>
							<option value="VN">יאטנם</option>
							<option value="VG">איי בתולה ( בריטית)</option>
							<option value="VI">איי בתולה ( ארה"ב )</option>
							<option value="WF">ואליסופוטונה איים</option>
							<option value="EH">סהרה המערבית</option>
							<option value="YE">תימן</option>
							<option value="ZM">זמביה</option>
							<option value="ZW">זימבבואה</option>
						</select>
					</div>
				</div>
			</div>
			<p>הזן את פרטי חשבונך מטה:</p>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">שם
					משתמש</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="שם משתמש" autocomplete="off"
							name="username" value="${user.username}" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">סיסמה</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" id="register_password" autocomplete="off"
							placeholder="סיסמה" name="password" value="" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">הזן
					סיסמה שנית</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-ok"></i> <input class="m-wrap placeholder-no-fix"
							type="password" autocomplete="off" placeholder="הזן סיסמתך שנית"
							name="password2" value="" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<label class="checkbox"> <input type="checkbox" name="tnc" />
						הנני מסכים <a href="#">לחוקי השירות</a> ו <a href="#">להסכם
							האישי</a>
					</label>
					<div id="register_tnc_error"></div>
				</div>
			</div>
			<div class="form-actions">
				<button id="register-back-btn" type="button" class="btn">
					<i class="m-icon-swapleft"></i> חזרה
				</button>
				<button type="submit" id="register-submit-btn"
					class="btn green pull-left">
					הירשם <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</g:form>
		<!-- END REGISTRATION FORM -->
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">2013 &copy; Metronic. Admin Dashboard
		Template.</div>

	<!-- BEGIN CORE PLUGINS -->
	<script
		src="${resource(dir: 'uaassets/plugins', file: 'jquery-1.10.1.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'uaassets/plugins', file: 'jquery-migrate-1.2.1.min.js')}"
		type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script
		src="${resource(dir: 'uaassets/plugins/jquery-ui', file: 'jquery-ui-1.10.1.custom.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'uaassets/plugins/bootstrap/js', file: 'bootstrap-rtl.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'uaassets/plugins/bootstrap-hover-dropdown', file: 'twitter-bootstrap-hover-dropdown.min.js')}"
		type="text/javascript"></script>
	<!--[if lt IE 9]>
	<script src="${resource(dir: 'uaassets/plugins', file: 'excanvas.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/plugins', file: 'respond.min.js')}" type="text/javascript"></script>  
	<![endif]-->
	<script
		src="${resource(dir: 'uaassets/plugins/jquery-slimscroll', file: 'jquery.slimscroll.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'uaassets/plugins', file: 'jquery.blockui.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'uaassets/plugins', file: 'jquery.cookie.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'uaassets/plugins/uniform', file: 'jquery.uniform.min.js')}"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${resource(dir: 'uaassets/plugins/jquery-validation/dist', file: 'jquery.validate.min.js')}"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${resource(dir: 'uaassets/scripts', file: 'app.js')}"
		type="text/javascript"></script>
	<script src="${resource(dir: 'uaassets/scripts', file: 'login.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'uaassets/plugins/select2', file: 'select2.min.js')}"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {     
		  App.init();
		  Login.init();
		  if(${loginMode=='register'})
		  {
			  jQuery('#register-btn').click();
		  }
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->

<!-- Mirrored from www.keenthemes.com/preview/metronic_admin_rtl/login.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 14 Aug 2013 15:37:26 GMT -->
</html>