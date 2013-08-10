<g:if test="${smsInstanceTotal>0}">
<g:each in="${smsInstanceList}" status="i" var="smsInstance">
	<!-- Testimonial #1 -->
	<li class="testimonial" style="word-wrap: break-word;width:400px">
		<div class="testimonials emoji" style="word-wrap: break-word;">
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
</g:if>
<g:else>
	<div class="notification notice closeable" style="text-align: center; margin-top: 50px;">אין הודעות להצגה</div>
</g:else>
<script type="text/javascript">
<!--
$(document).ready(function(){runEmoji();});
//-->
</script>