<g:each in="${smsInstanceList}" status="i" var="smsInstance">
	<!-- Testimonial #1 -->
	<li class="testimonial">
		<div class="testimonials emoji">
			${fieldValue(bean: smsInstance, field: "msg")}
		</div>
		<div class="testimonials-bg"></div>
		<div class="testimonials-author">
			${fieldValue(bean: smsInstance, field: "formatedPhoneNumer")}
			-
			${message(code: 'sms.folderName.' + fieldValue(bean: smsInstance, field: 'folderName') , default: 'folderName')}
			,<span>
				${fieldValue(bean: smsInstance, field: "formatedDate")}
			</span>
		</div>
	</li>
</g:each>
<script type="text/javascript">
<!--
$(document).ready(function(){runEmoji();});
//-->
</script>