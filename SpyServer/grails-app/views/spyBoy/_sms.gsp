<g:if test="${smsInstanceTotal>0}">
<g:each in="${smsInstanceList}" status="i" var="smsInstance">
	<!-- Testimonial #1 -->
	<li class="testimonial" style="word-wrap: break-word;width:440px" >
		<div id="speaker" class="header">${fieldValue(bean: smsInstance, field: "formatedPhoneNumer")}<!-- TODO! - change to contact name --></div>
		<div id="smsmsg" class="testimonials emoji  ${fieldValue(bean: smsInstance, field: 'folderName')}" style="word-wrap: break-word;">
			${fieldValue(bean: smsInstance, field: "msg")}
		</div>
		<div class="testimonials-bg"></div>
		<div class="testimonials-author">
			${message(code: 'sms.folderName.' + fieldValue(bean: smsInstance, field: 'folderName') , default: 'folderName')}
			,<span>
				${fieldValue(bean: smsInstance, field: "formatedDate")}
			</span>
		</div>
	</li>
</g:each>
</g:if>
<g:else>
	<div class="notification success closeable" style="margin-top: 20px;text-align: center;">אין הודעות להצגה</div>
</g:else>
<script type="text/javascript">
<!--
$(document).ready(function(){runEmoji();});

jQuery(setHeight());
function setHeight(){
	if(${smsInstanceTotal>0}){		
		jQuery("#content_1").css("height","590px");
	}else{
		jQuery("#content_1").css("height","81px");
	}
}
//-->
</script>