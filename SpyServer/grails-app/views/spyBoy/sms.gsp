<div class="seven columns" style="width: 470px;">
<h3 class="headline">הודעות טקסט (SMS)</h3>
<span class="line" style="float: right;
    margin-bottom: 0;
    position: relative;
    top: 32px;
    width: 35%;"></span><a id="scroll_to_bottom" class="button color" href="#" style="width:20%;float:left">גלול לסוף השיחה</a>
	<div id="content_1" class="content">			
		<ul id="smsAjaxTargetDiv">
			<div class="notification success closeable" style="margin-top: 20px;text-align: center;">אין הודעות להצגה</div>			
		</ul>
	</div>
</div>
<script>
	(function($) {
		$(window).load(function() {
			$("#content_1").mCustomScrollbar({
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

			$("#scroll_to_bottom").click(function(e){
				e.preventDefault();
				$("#content_1").mCustomScrollbar("scrollTo","bottom");
			});
		
		});
	})(jQuery);
</script>