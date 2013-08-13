<!-- Regular Table
================================================== -->
<div class="nine columns">

	<!-- Headline -->
	<h3 class="headline">יומן שיחות</h3>
	<span class="line" style="float: right;
    margin-bottom: 0;
    position: relative;
    top: 32px;
    width: 62%;"></span><a id="callLog_scroll_to_top" class="button color" href="#" style="float:left">גלול לשיחה האחרונה</a>

	
	<div class="clearfix"></div>
	<table id="callLogHeader" class="standard-table" style="margin-bottom:0px !important;display:none;padding-top:20px;">
		<tr>					
			<g:sortableColumn id="col1" style="width:139px" property="phoneNumber" title="${message(code: 'callLog.phoneNumber.label', default: 'phoneNumber')}" />
			<g:sortableColumn id="col2" style="width:101px" property="type" title="${message(code: 'callLog.type.label', default: 'type')}" />
			<g:sortableColumn id="col3" style="width:139px" property="duration" title="${message(code: 'callLog.duration.label', default: 'duration')}" />
			<g:sortableColumn id="col4" style="" property="time" title="${message(code: 'callLog.time.label', default: 'time')}" />					
		</tr>
	</table>	
	<div id="content_2" class="content" style="">	
		<div id="callLogAjaxTargetDiv">
			<div class="notification success closeable" style="margin-top: 20px;text-align: center;">אין שיחות להצגה</div>
			<div id="callLogSpinner" class="spinner" style="display:none;"></div>			
		</div>
	</div>
</div>
<script>
	(function($) {
		$(window).load(function() {
			$("#content_2").mCustomScrollbar({
				set_width : false, /*optional element width: boolean, pixels, percentage*/
				set_height : false, /*optional element height: boolean, pixels, percentage*/
				horizontalScroll : false, /*scroll horizontally: boolean*/
				scrollInertia : 950, /*scrolling inertia: integer (milliseconds)*/
				mouseWheel : true, /*mousewheel support: boolean*/
				mouseWheelPixels : "auto", /*mousewheel pixels amount: integer, "auto"*/
				autoDraggerLength : true, /*auto-adjust scrollbar dragger length: boolean*/
				autoHideScrollbar : false, /*auto-hide scrollbar when idle*/
				scrollButtons : { /*scroll buttons*/
					enable : true, /*scroll buttons support: boolean*/
					scrollType : "pixels", /*scroll buttons scrolling type: "continuous", "pixels"*/
					scrollSpeed : 100, /*scroll buttons continuous scrolling speed: integer, "auto"*/
					scrollAmount : 450
				/*scroll buttons pixels scroll amount: integer (pixels)*/
				},
				advanced : {
					updateOnBrowserResize : true, /*update scrollbars on browser resize (for layouts based on percentages): boolean*/
					updateOnContentResize : true, /*auto-update scrollbars on content resize (for dynamic content): boolean*/
					autoExpandHorizontalScroll : false, /*auto-expand width for horizontal scrolling: boolean*/
					autoScrollOnFocus : true, /*auto-scroll on focused elements: boolean*/
					normalizeMouseWheelDelta : false
				/*normalize mouse-wheel delta (-1/1)*/
				},
				contentTouchScroll : true, /*scrolling by touch-swipe content: boolean*/
				callbacks : {
					onScrollStart : function() {
					}, /*user custom callback function on scroll start event*/
					onScroll : function() {
					}, /*user custom callback function on scroll event*/
					onTotalScroll : function() {
					}, /*user custom callback function on scroll end reached event*/
					onTotalScrollBack : function() {
					}, /*user custom callback function on scroll begin reached event*/
					onTotalScrollOffset : 0, /*scroll end reached offset: integer (pixels)*/
					onTotalScrollBackOffset : 0, /*scroll begin reached offset: integer (pixels)*/
					whileScrolling : function() {
					} /*user custom callback function on scrolling event*/
				},
				theme : "dark-thick" /*"light", "dark", "light-2", "dark-2", "light-thick", "dark-thick", "light-thin", "dark-thin"*/
			});

			$("#callLog_scroll_to_top").click(function(e){
				e.preventDefault();
				$("#content_2").mCustomScrollbar("scrollTo","top");
			});
		});
	})(jQuery);
</script>