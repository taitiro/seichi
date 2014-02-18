$(document).ready(function() {
	var defworkid = true,defplaceid = true;

	$('#select-workid').select2();
	$('#select-placeid').select2();

	$('#confirm-form').submit(function() {
		/* 関連聖地未入力 */
		if ($('[name=placeid]').val() == '') {
			alert('関連聖地が入力されていません');
			return false;
		}
		/* 関連作品未入力 */
		if ($('[name=workid]').val() == '') {
			alert('関連作品が入力されていません');
			return false;
		}
		/* CAPTCHA未入力 */
		if ($('#input-captcha').val() == '') {
			alert('CAPTCHAが入力されていません');
			return false;
		}

		return true;
	});

	$('#select-workid').change(function() {
		if (defworkid && $('#select-workid').val() != '') {
			$('#select-workid-wrapper').removeClass("has-error");
			$('#select-workid-wrapper').addClass("has-success");
			defworkid = false;
		}
	});


	$('#select-placeid').change(function() {
		if (defplaceid && $('#select-placeid').val() != '') {
			$('#select-placeid-wrapper').removeClass("has-error");
			$('#select-placeid-wrapper').addClass("has-success");
			defplaceid = false;
		}
	});
	
	$('#input-captcha').change(function() {
		if ($('#input-captcha').val() != '') {
			$('#input-captcha-wrapper').removeClass("has-error");
			$('#input-captcha-wrapper').addClass("has-success");
		}
	});

	$('#input-captcha-refresh').click(function() {
		var now = new Date().getTime();
		$('#input-captcha-img').attr('src', 'jcaptcha.jpg?' + now);
	});
});