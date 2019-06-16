<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>
function emojiDialog(id){
	$("#"+id).parent().append('<div class="input-group-prepend"><span class="input-group-text"><i id="edit-show-ico" class="fa fa-fw fa-circle-o"></i></span></div>');
	$("#"+id).parent().append('<span class="btn btn-sm btn-info" onclick="javascript:$(\'#ico-dialog\').modal(\'show\');">选择图标</span>');
	
	$("#"+id).attr("type","hidden");
	$(".fa-emoji").on('click',function(e){
					var ico = $(e.currentTarget).attr('class').split(" ")[1];
					$("#"+id).val(ico);
					emojiUpdate();
				});
}
function emojiUpdate(def){
	if(!def){
		var ico = $("#edit-ico").val();
		if(ico){
			$("#edit-show-ico").attr("class","fa fa-fw "+ico);
		}
	}else{
		$("#edit-show-ico").attr("class","fa fa-fw fa-circle-o");
	}
}
</script>
<link rel="stylesheet" href="${rootUrl}/plugins/edit-md/css/editormd.min.css" />
<div class="modal fade" id="ico-dialog" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content card">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">
					选择图标
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
			</div>
			<div class="modal-body">
				<div class="editormd-tab-box" style="height: 260px; overflow: hidden auto;">
					<div class="editormd-grid-table">
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-glass:" title=":fa-glass:" class="editormd-emoji-btn"><i class="fa fa-glass fa-emoji" title="glass"></i></a>
							<a href="javascript:;" value=":fa-music:" title=":fa-music:" class="editormd-emoji-btn"><i class="fa fa-music fa-emoji" title="music"></i></a>
							<a href="javascript:;" value=":fa-search:" title=":fa-search:" class="editormd-emoji-btn"><i class="fa fa-search fa-emoji" title="search"></i></a>
							<a href="javascript:;" value=":fa-envelope-o:" title=":fa-envelope-o:" class="editormd-emoji-btn"><i class="fa fa-envelope-o fa-emoji" title="envelope-o"></i></a>
							<a href="javascript:;" value=":fa-heart:" title=":fa-heart:" class="editormd-emoji-btn"><i class="fa fa-heart fa-emoji" title="heart"></i></a>
							<a href="javascript:;" value=":fa-star:" title=":fa-star:" class="editormd-emoji-btn"><i class="fa fa-star fa-emoji" title="star"></i></a>
							<a href="javascript:;" value=":fa-star-o:" title=":fa-star-o:" class="editormd-emoji-btn"><i class="fa fa-star-o fa-emoji" title="star-o"></i></a>
							<a href="javascript:;" value=":fa-user:" title=":fa-user:" class="editormd-emoji-btn"><i class="fa fa-user fa-emoji" title="user"></i></a>
							<a href="javascript:;" value=":fa-film:" title=":fa-film:" class="editormd-emoji-btn"><i class="fa fa-film fa-emoji" title="film"></i></a>
							<a href="javascript:;" value=":fa-th-large:" title=":fa-th-large:" class="editormd-emoji-btn"><i class="fa fa-th-large fa-emoji" title="th-large"></i></a>
							<a href="javascript:;" value=":fa-th:" title=":fa-th:" class="editormd-emoji-btn"><i class="fa fa-th fa-emoji" title="th"></i></a>
							<a href="javascript:;" value=":fa-th-list:" title=":fa-th-list:" class="editormd-emoji-btn"><i class="fa fa-th-list fa-emoji" title="th-list"></i></a>
							<a href="javascript:;" value=":fa-check:" title=":fa-check:" class="editormd-emoji-btn"><i class="fa fa-check fa-emoji" title="check"></i></a>
							<a href="javascript:;" value=":fa-times:" title=":fa-times:" class="editormd-emoji-btn"><i class="fa fa-times fa-emoji" title="times"></i></a>
							<a href="javascript:;" value=":fa-search-plus:" title=":fa-search-plus:" class="editormd-emoji-btn"><i class="fa fa-search-plus fa-emoji" title="search-plus"></i></a>
							<a href="javascript:;" value=":fa-search-minus:" title=":fa-search-minus:" class="editormd-emoji-btn"><i class="fa fa-search-minus fa-emoji" title="search-minus"></i></a>
							<a href="javascript:;" value=":fa-power-off:" title=":fa-power-off:" class="editormd-emoji-btn"><i class="fa fa-power-off fa-emoji" title="power-off"></i></a>
							<a href="javascript:;" value=":fa-signal:" title=":fa-signal:" class="editormd-emoji-btn"><i class="fa fa-signal fa-emoji" title="signal"></i></a>
							<a href="javascript:;" value=":fa-cog:" title=":fa-cog:" class="editormd-emoji-btn"><i class="fa fa-cog fa-emoji" title="cog"></i></a>
							<a href="javascript:;" value=":fa-trash-o:" title=":fa-trash-o:" class="editormd-emoji-btn"><i class="fa fa-trash-o fa-emoji" title="trash-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-home:" title=":fa-home:" class="editormd-emoji-btn"><i class="fa fa-home fa-emoji" title="home"></i></a>
							<a href="javascript:;" value=":fa-file-o:" title=":fa-file-o:" class="editormd-emoji-btn"><i class="fa fa-file-o fa-emoji" title="file-o"></i></a>
							<a href="javascript:;" value=":fa-clock-o:" title=":fa-clock-o:" class="editormd-emoji-btn"><i class="fa fa-clock-o fa-emoji" title="clock-o"></i></a>
							<a href="javascript:;" value=":fa-road:" title=":fa-road:" class="editormd-emoji-btn"><i class="fa fa-road fa-emoji" title="road"></i></a>
							<a href="javascript:;" value=":fa-download:" title=":fa-download:" class="editormd-emoji-btn"><i class="fa fa-download fa-emoji" title="download"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-o-down:" title=":fa-arrow-circle-o-down:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-down fa-emoji" title="arrow-circle-o-down"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-o-up:" title=":fa-arrow-circle-o-up:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-up fa-emoji" title="arrow-circle-o-up"></i></a>
							<a href="javascript:;" value=":fa-inbox:" title=":fa-inbox:" class="editormd-emoji-btn"><i class="fa fa-inbox fa-emoji" title="inbox"></i></a>
							<a href="javascript:;" value=":fa-play-circle-o:" title=":fa-play-circle-o:" class="editormd-emoji-btn"><i class="fa fa-play-circle-o fa-emoji" title="play-circle-o"></i></a>
							<a href="javascript:;" value=":fa-repeat:" title=":fa-repeat:" class="editormd-emoji-btn"><i class="fa fa-repeat fa-emoji" title="repeat"></i></a>
							<a href="javascript:;" value=":fa-refresh:" title=":fa-refresh:" class="editormd-emoji-btn"><i class="fa fa-refresh fa-emoji" title="refresh"></i></a>
							<a href="javascript:;" value=":fa-list-alt:" title=":fa-list-alt:" class="editormd-emoji-btn"><i class="fa fa-list-alt fa-emoji" title="list-alt"></i></a>
							<a href="javascript:;" value=":fa-lock:" title=":fa-lock:" class="editormd-emoji-btn"><i class="fa fa-lock fa-emoji" title="lock"></i></a>
							<a href="javascript:;" value=":fa-flag:" title=":fa-flag:" class="editormd-emoji-btn"><i class="fa fa-flag fa-emoji" title="flag"></i></a>
							<a href="javascript:;" value=":fa-headphones:" title=":fa-headphones:" class="editormd-emoji-btn"><i class="fa fa-headphones fa-emoji" title="headphones"></i></a>
							<a href="javascript:;" value=":fa-volume-off:" title=":fa-volume-off:" class="editormd-emoji-btn"><i class="fa fa-volume-off fa-emoji" title="volume-off"></i></a>
							<a href="javascript:;" value=":fa-volume-down:" title=":fa-volume-down:" class="editormd-emoji-btn"><i class="fa fa-volume-down fa-emoji" title="volume-down"></i></a>
							<a href="javascript:;" value=":fa-volume-up:" title=":fa-volume-up:" class="editormd-emoji-btn"><i class="fa fa-volume-up fa-emoji" title="volume-up"></i></a>
							<a href="javascript:;" value=":fa-qrcode:" title=":fa-qrcode:" class="editormd-emoji-btn"><i class="fa fa-qrcode fa-emoji" title="qrcode"></i></a>
							<a href="javascript:;" value=":fa-barcode:" title=":fa-barcode:" class="editormd-emoji-btn"><i class="fa fa-barcode fa-emoji" title="barcode"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-tag:" title=":fa-tag:" class="editormd-emoji-btn"><i class="fa fa-tag fa-emoji" title="tag"></i></a>
							<a href="javascript:;" value=":fa-tags:" title=":fa-tags:" class="editormd-emoji-btn"><i class="fa fa-tags fa-emoji" title="tags"></i></a>
							<a href="javascript:;" value=":fa-book:" title=":fa-book:" class="editormd-emoji-btn"><i class="fa fa-book fa-emoji" title="book"></i></a>
							<a href="javascript:;" value=":fa-bookmark:" title=":fa-bookmark:" class="editormd-emoji-btn"><i class="fa fa-bookmark fa-emoji" title="bookmark"></i></a>
							<a href="javascript:;" value=":fa-print:" title=":fa-print:" class="editormd-emoji-btn"><i class="fa fa-print fa-emoji" title="print"></i></a>
							<a href="javascript:;" value=":fa-camera:" title=":fa-camera:" class="editormd-emoji-btn"><i class="fa fa-camera fa-emoji" title="camera"></i></a>
							<a href="javascript:;" value=":fa-font:" title=":fa-font:" class="editormd-emoji-btn"><i class="fa fa-font fa-emoji" title="font"></i></a>
							<a href="javascript:;" value=":fa-bold:" title=":fa-bold:" class="editormd-emoji-btn"><i class="fa fa-bold fa-emoji" title="bold"></i></a>
							<a href="javascript:;" value=":fa-italic:" title=":fa-italic:" class="editormd-emoji-btn"><i class="fa fa-italic fa-emoji" title="italic"></i></a>
							<a href="javascript:;" value=":fa-text-height:" title=":fa-text-height:" class="editormd-emoji-btn"><i class="fa fa-text-height fa-emoji" title="text-height"></i></a>
							<a href="javascript:;" value=":fa-text-width:" title=":fa-text-width:" class="editormd-emoji-btn"><i class="fa fa-text-width fa-emoji" title="text-width"></i></a>
							<a href="javascript:;" value=":fa-align-left:" title=":fa-align-left:" class="editormd-emoji-btn"><i class="fa fa-align-left fa-emoji" title="align-left"></i></a>
							<a href="javascript:;" value=":fa-align-center:" title=":fa-align-center:" class="editormd-emoji-btn"><i class="fa fa-align-center fa-emoji" title="align-center"></i></a>
							<a href="javascript:;" value=":fa-align-right:" title=":fa-align-right:" class="editormd-emoji-btn"><i class="fa fa-align-right fa-emoji" title="align-right"></i></a>
							<a href="javascript:;" value=":fa-align-justify:" title=":fa-align-justify:" class="editormd-emoji-btn"><i class="fa fa-align-justify fa-emoji" title="align-justify"></i></a>
							<a href="javascript:;" value=":fa-list:" title=":fa-list:" class="editormd-emoji-btn"><i class="fa fa-list fa-emoji" title="list"></i></a>
							<a href="javascript:;" value=":fa-outdent:" title=":fa-outdent:" class="editormd-emoji-btn"><i class="fa fa-outdent fa-emoji" title="outdent"></i></a>
							<a href="javascript:;" value=":fa-indent:" title=":fa-indent:" class="editormd-emoji-btn"><i class="fa fa-indent fa-emoji" title="indent"></i></a>
							<a href="javascript:;" value=":fa-video-camera:" title=":fa-video-camera:" class="editormd-emoji-btn"><i class="fa fa-video-camera fa-emoji" title="video-camera"></i></a>
							<a href="javascript:;" value=":fa-picture-o:" title=":fa-picture-o:" class="editormd-emoji-btn"><i class="fa fa-picture-o fa-emoji" title="picture-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-pencil:" title=":fa-pencil:" class="editormd-emoji-btn"><i class="fa fa-pencil fa-emoji" title="pencil"></i></a>
							<a href="javascript:;" value=":fa-map-marker:" title=":fa-map-marker:" class="editormd-emoji-btn"><i class="fa fa-map-marker fa-emoji" title="map-marker"></i></a>
							<a href="javascript:;" value=":fa-adjust:" title=":fa-adjust:" class="editormd-emoji-btn"><i class="fa fa-adjust fa-emoji" title="adjust"></i></a>
							<a href="javascript:;" value=":fa-tint:" title=":fa-tint:" class="editormd-emoji-btn"><i class="fa fa-tint fa-emoji" title="tint"></i></a>
							<a href="javascript:;" value=":fa-pencil-square-o:" title=":fa-pencil-square-o:" class="editormd-emoji-btn"><i class="fa fa-pencil-square-o fa-emoji" title="pencil-square-o"></i></a>
							<a href="javascript:;" value=":fa-share-square-o:" title=":fa-share-square-o:" class="editormd-emoji-btn"><i class="fa fa-share-square-o fa-emoji" title="share-square-o"></i></a>
							<a href="javascript:;" value=":fa-check-square-o:" title=":fa-check-square-o:" class="editormd-emoji-btn"><i class="fa fa-check-square-o fa-emoji" title="check-square-o"></i></a>
							<a href="javascript:;" value=":fa-arrows:" title=":fa-arrows:" class="editormd-emoji-btn"><i class="fa fa-arrows fa-emoji" title="arrows"></i></a>
							<a href="javascript:;" value=":fa-step-backward:" title=":fa-step-backward:" class="editormd-emoji-btn"><i class="fa fa-step-backward fa-emoji" title="step-backward"></i></a>
							<a href="javascript:;" value=":fa-fast-backward:" title=":fa-fast-backward:" class="editormd-emoji-btn"><i class="fa fa-fast-backward fa-emoji" title="fast-backward"></i></a>
							<a href="javascript:;" value=":fa-backward:" title=":fa-backward:" class="editormd-emoji-btn"><i class="fa fa-backward fa-emoji" title="backward"></i></a>
							<a href="javascript:;" value=":fa-play:" title=":fa-play:" class="editormd-emoji-btn"><i class="fa fa-play fa-emoji" title="play"></i></a>
							<a href="javascript:;" value=":fa-pause:" title=":fa-pause:" class="editormd-emoji-btn"><i class="fa fa-pause fa-emoji" title="pause"></i></a>
							<a href="javascript:;" value=":fa-stop:" title=":fa-stop:" class="editormd-emoji-btn"><i class="fa fa-stop fa-emoji" title="stop"></i></a>
							<a href="javascript:;" value=":fa-forward:" title=":fa-forward:" class="editormd-emoji-btn"><i class="fa fa-forward fa-emoji" title="forward"></i></a>
							<a href="javascript:;" value=":fa-fast-forward:" title=":fa-fast-forward:" class="editormd-emoji-btn"><i class="fa fa-fast-forward fa-emoji" title="fast-forward"></i></a>
							<a href="javascript:;" value=":fa-step-forward:" title=":fa-step-forward:" class="editormd-emoji-btn"><i class="fa fa-step-forward fa-emoji" title="step-forward"></i></a>
							<a href="javascript:;" value=":fa-eject:" title=":fa-eject:" class="editormd-emoji-btn"><i class="fa fa-eject fa-emoji" title="eject"></i></a>
							<a href="javascript:;" value=":fa-chevron-left:" title=":fa-chevron-left:" class="editormd-emoji-btn"><i class="fa fa-chevron-left fa-emoji" title="chevron-left"></i></a>
							<a href="javascript:;" value=":fa-chevron-right:" title=":fa-chevron-right:" class="editormd-emoji-btn"><i class="fa fa-chevron-right fa-emoji" title="chevron-right"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-plus-circle:" title=":fa-plus-circle:" class="editormd-emoji-btn"><i class="fa fa-plus-circle fa-emoji" title="plus-circle"></i></a>
							<a href="javascript:;" value=":fa-minus-circle:" title=":fa-minus-circle:" class="editormd-emoji-btn"><i class="fa fa-minus-circle fa-emoji" title="minus-circle"></i></a>
							<a href="javascript:;" value=":fa-times-circle:" title=":fa-times-circle:" class="editormd-emoji-btn"><i class="fa fa-times-circle fa-emoji" title="times-circle"></i></a>
							<a href="javascript:;" value=":fa-check-circle:" title=":fa-check-circle:" class="editormd-emoji-btn"><i class="fa fa-check-circle fa-emoji" title="check-circle"></i></a>
							<a href="javascript:;" value=":fa-question-circle:" title=":fa-question-circle:" class="editormd-emoji-btn"><i class="fa fa-question-circle fa-emoji" title="question-circle"></i></a>
							<a href="javascript:;" value=":fa-info-circle:" title=":fa-info-circle:" class="editormd-emoji-btn"><i class="fa fa-info-circle fa-emoji" title="info-circle"></i></a>
							<a href="javascript:;" value=":fa-crosshairs:" title=":fa-crosshairs:" class="editormd-emoji-btn"><i class="fa fa-crosshairs fa-emoji" title="crosshairs"></i></a>
							<a href="javascript:;" value=":fa-times-circle-o:" title=":fa-times-circle-o:" class="editormd-emoji-btn"><i class="fa fa-times-circle-o fa-emoji" title="times-circle-o"></i></a>
							<a href="javascript:;" value=":fa-check-circle-o:" title=":fa-check-circle-o:" class="editormd-emoji-btn"><i class="fa fa-check-circle-o fa-emoji" title="check-circle-o"></i></a>
							<a href="javascript:;" value=":fa-ban:" title=":fa-ban:" class="editormd-emoji-btn"><i class="fa fa-ban fa-emoji" title="ban"></i></a>
							<a href="javascript:;" value=":fa-arrow-left:" title=":fa-arrow-left:" class="editormd-emoji-btn"><i class="fa fa-arrow-left fa-emoji" title="arrow-left"></i></a>
							<a href="javascript:;" value=":fa-arrow-right:" title=":fa-arrow-right:" class="editormd-emoji-btn"><i class="fa fa-arrow-right fa-emoji" title="arrow-right"></i></a>
							<a href="javascript:;" value=":fa-arrow-up:" title=":fa-arrow-up:" class="editormd-emoji-btn"><i class="fa fa-arrow-up fa-emoji" title="arrow-up"></i></a>
							<a href="javascript:;" value=":fa-arrow-down:" title=":fa-arrow-down:" class="editormd-emoji-btn"><i class="fa fa-arrow-down fa-emoji" title="arrow-down"></i></a>
							<a href="javascript:;" value=":fa-share:" title=":fa-share:" class="editormd-emoji-btn"><i class="fa fa-share fa-emoji" title="share"></i></a>
							<a href="javascript:;" value=":fa-expand:" title=":fa-expand:" class="editormd-emoji-btn"><i class="fa fa-expand fa-emoji" title="expand"></i></a>
							<a href="javascript:;" value=":fa-compress:" title=":fa-compress:" class="editormd-emoji-btn"><i class="fa fa-compress fa-emoji" title="compress"></i></a>
							<a href="javascript:;" value=":fa-plus:" title=":fa-plus:" class="editormd-emoji-btn"><i class="fa fa-plus fa-emoji" title="plus"></i></a>
							<a href="javascript:;" value=":fa-minus:" title=":fa-minus:" class="editormd-emoji-btn"><i class="fa fa-minus fa-emoji" title="minus"></i></a>
							<a href="javascript:;" value=":fa-asterisk:" title=":fa-asterisk:" class="editormd-emoji-btn"><i class="fa fa-asterisk fa-emoji" title="asterisk"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-exclamation-circle:" title=":fa-exclamation-circle:" class="editormd-emoji-btn"><i class="fa fa-exclamation-circle fa-emoji" title="exclamation-circle"></i></a>
							<a href="javascript:;" value=":fa-gift:" title=":fa-gift:" class="editormd-emoji-btn"><i class="fa fa-gift fa-emoji" title="gift"></i></a>
							<a href="javascript:;" value=":fa-leaf:" title=":fa-leaf:" class="editormd-emoji-btn"><i class="fa fa-leaf fa-emoji" title="leaf"></i></a>
							<a href="javascript:;" value=":fa-fire:" title=":fa-fire:" class="editormd-emoji-btn"><i class="fa fa-fire fa-emoji" title="fire"></i></a>
							<a href="javascript:;" value=":fa-eye:" title=":fa-eye:" class="editormd-emoji-btn"><i class="fa fa-eye fa-emoji" title="eye"></i></a>
							<a href="javascript:;" value=":fa-eye-slash:" title=":fa-eye-slash:" class="editormd-emoji-btn"><i class="fa fa-eye-slash fa-emoji" title="eye-slash"></i></a>
							<a href="javascript:;" value=":fa-exclamation-triangle:" title=":fa-exclamation-triangle:" class="editormd-emoji-btn"><i class="fa fa-exclamation-triangle fa-emoji" title="exclamation-triangle"></i></a>
							<a href="javascript:;" value=":fa-plane:" title=":fa-plane:" class="editormd-emoji-btn"><i class="fa fa-plane fa-emoji" title="plane"></i></a>
							<a href="javascript:;" value=":fa-calendar:" title=":fa-calendar:" class="editormd-emoji-btn"><i class="fa fa-calendar fa-emoji" title="calendar"></i></a>
							<a href="javascript:;" value=":fa-random:" title=":fa-random:" class="editormd-emoji-btn"><i class="fa fa-random fa-emoji" title="random"></i></a>
							<a href="javascript:;" value=":fa-comment:" title=":fa-comment:" class="editormd-emoji-btn"><i class="fa fa-comment fa-emoji" title="comment"></i></a>
							<a href="javascript:;" value=":fa-magnet:" title=":fa-magnet:" class="editormd-emoji-btn"><i class="fa fa-magnet fa-emoji" title="magnet"></i></a>
							<a href="javascript:;" value=":fa-chevron-up:" title=":fa-chevron-up:" class="editormd-emoji-btn"><i class="fa fa-chevron-up fa-emoji" title="chevron-up"></i></a>
							<a href="javascript:;" value=":fa-chevron-down:" title=":fa-chevron-down:" class="editormd-emoji-btn"><i class="fa fa-chevron-down fa-emoji" title="chevron-down"></i></a>
							<a href="javascript:;" value=":fa-retweet:" title=":fa-retweet:" class="editormd-emoji-btn"><i class="fa fa-retweet fa-emoji" title="retweet"></i></a>
							<a href="javascript:;" value=":fa-shopping-cart:" title=":fa-shopping-cart:" class="editormd-emoji-btn"><i class="fa fa-shopping-cart fa-emoji" title="shopping-cart"></i></a>
							<a href="javascript:;" value=":fa-folder:" title=":fa-folder:" class="editormd-emoji-btn"><i class="fa fa-folder fa-emoji" title="folder"></i></a>
							<a href="javascript:;" value=":fa-folder-open:" title=":fa-folder-open:" class="editormd-emoji-btn"><i class="fa fa-folder-open fa-emoji" title="folder-open"></i></a>
							<a href="javascript:;" value=":fa-arrows-v:" title=":fa-arrows-v:" class="editormd-emoji-btn"><i class="fa fa-arrows-v fa-emoji" title="arrows-v"></i></a>
							<a href="javascript:;" value=":fa-arrows-h:" title=":fa-arrows-h:" class="editormd-emoji-btn"><i class="fa fa-arrows-h fa-emoji" title="arrows-h"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-bar-chart:" title=":fa-bar-chart:" class="editormd-emoji-btn"><i class="fa fa-bar-chart fa-emoji" title="bar-chart"></i></a>
							<a href="javascript:;" value=":fa-twitter-square:" title=":fa-twitter-square:" class="editormd-emoji-btn"><i class="fa fa-twitter-square fa-emoji" title="twitter-square"></i></a>
							<a href="javascript:;" value=":fa-facebook-square:" title=":fa-facebook-square:" class="editormd-emoji-btn"><i class="fa fa-facebook-square fa-emoji" title="facebook-square"></i></a>
							<a href="javascript:;" value=":fa-camera-retro:" title=":fa-camera-retro:" class="editormd-emoji-btn"><i class="fa fa-camera-retro fa-emoji" title="camera-retro"></i></a>
							<a href="javascript:;" value=":fa-key:" title=":fa-key:" class="editormd-emoji-btn"><i class="fa fa-key fa-emoji" title="key"></i></a>
							<a href="javascript:;" value=":fa-cogs:" title=":fa-cogs:" class="editormd-emoji-btn"><i class="fa fa-cogs fa-emoji" title="cogs"></i></a>
							<a href="javascript:;" value=":fa-comments:" title=":fa-comments:" class="editormd-emoji-btn"><i class="fa fa-comments fa-emoji" title="comments"></i></a>
							<a href="javascript:;" value=":fa-thumbs-o-up:" title=":fa-thumbs-o-up:" class="editormd-emoji-btn"><i class="fa fa-thumbs-o-up fa-emoji" title="thumbs-o-up"></i></a>
							<a href="javascript:;" value=":fa-thumbs-o-down:" title=":fa-thumbs-o-down:" class="editormd-emoji-btn"><i class="fa fa-thumbs-o-down fa-emoji" title="thumbs-o-down"></i></a>
							<a href="javascript:;" value=":fa-star-half:" title=":fa-star-half:" class="editormd-emoji-btn"><i class="fa fa-star-half fa-emoji" title="star-half"></i></a>
							<a href="javascript:;" value=":fa-heart-o:" title=":fa-heart-o:" class="editormd-emoji-btn"><i class="fa fa-heart-o fa-emoji" title="heart-o"></i></a>
							<a href="javascript:;" value=":fa-sign-out:" title=":fa-sign-out:" class="editormd-emoji-btn"><i class="fa fa-sign-out fa-emoji" title="sign-out"></i></a>
							<a href="javascript:;" value=":fa-linkedin-square:" title=":fa-linkedin-square:" class="editormd-emoji-btn"><i class="fa fa-linkedin-square fa-emoji" title="linkedin-square"></i></a>
							<a href="javascript:;" value=":fa-thumb-tack:" title=":fa-thumb-tack:" class="editormd-emoji-btn"><i class="fa fa-thumb-tack fa-emoji" title="thumb-tack"></i></a>
							<a href="javascript:;" value=":fa-external-link:" title=":fa-external-link:" class="editormd-emoji-btn"><i class="fa fa-external-link fa-emoji" title="external-link"></i></a>
							<a href="javascript:;" value=":fa-sign-in:" title=":fa-sign-in:" class="editormd-emoji-btn"><i class="fa fa-sign-in fa-emoji" title="sign-in"></i></a>
							<a href="javascript:;" value=":fa-trophy:" title=":fa-trophy:" class="editormd-emoji-btn"><i class="fa fa-trophy fa-emoji" title="trophy"></i></a>
							<a href="javascript:;" value=":fa-github-square:" title=":fa-github-square:" class="editormd-emoji-btn"><i class="fa fa-github-square fa-emoji" title="github-square"></i></a>
							<a href="javascript:;" value=":fa-upload:" title=":fa-upload:" class="editormd-emoji-btn"><i class="fa fa-upload fa-emoji" title="upload"></i></a>
							<a href="javascript:;" value=":fa-lemon-o:" title=":fa-lemon-o:" class="editormd-emoji-btn"><i class="fa fa-lemon-o fa-emoji" title="lemon-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-phone:" title=":fa-phone:" class="editormd-emoji-btn"><i class="fa fa-phone fa-emoji" title="phone"></i></a>
							<a href="javascript:;" value=":fa-square-o:" title=":fa-square-o:" class="editormd-emoji-btn"><i class="fa fa-square-o fa-emoji" title="square-o"></i></a>
							<a href="javascript:;" value=":fa-bookmark-o:" title=":fa-bookmark-o:" class="editormd-emoji-btn"><i class="fa fa-bookmark-o fa-emoji" title="bookmark-o"></i></a>
							<a href="javascript:;" value=":fa-phone-square:" title=":fa-phone-square:" class="editormd-emoji-btn"><i class="fa fa-phone-square fa-emoji" title="phone-square"></i></a>
							<a href="javascript:;" value=":fa-twitter:" title=":fa-twitter:" class="editormd-emoji-btn"><i class="fa fa-twitter fa-emoji" title="twitter"></i></a>
							<a href="javascript:;" value=":fa-facebook:" title=":fa-facebook:" class="editormd-emoji-btn"><i class="fa fa-facebook fa-emoji" title="facebook"></i></a>
							<a href="javascript:;" value=":fa-github:" title=":fa-github:" class="editormd-emoji-btn"><i class="fa fa-github fa-emoji" title="github"></i></a>
							<a href="javascript:;" value=":fa-unlock:" title=":fa-unlock:" class="editormd-emoji-btn"><i class="fa fa-unlock fa-emoji" title="unlock"></i></a>
							<a href="javascript:;" value=":fa-credit-card:" title=":fa-credit-card:" class="editormd-emoji-btn"><i class="fa fa-credit-card fa-emoji" title="credit-card"></i></a>
							<a href="javascript:;" value=":fa-rss:" title=":fa-rss:" class="editormd-emoji-btn"><i class="fa fa-rss fa-emoji" title="rss"></i></a>
							<a href="javascript:;" value=":fa-hdd-o:" title=":fa-hdd-o:" class="editormd-emoji-btn"><i class="fa fa-hdd-o fa-emoji" title="hdd-o"></i></a>
							<a href="javascript:;" value=":fa-bullhorn:" title=":fa-bullhorn:" class="editormd-emoji-btn"><i class="fa fa-bullhorn fa-emoji" title="bullhorn"></i></a>
							<a href="javascript:;" value=":fa-bell:" title=":fa-bell:" class="editormd-emoji-btn"><i class="fa fa-bell fa-emoji" title="bell"></i></a>
							<a href="javascript:;" value=":fa-certificate:" title=":fa-certificate:" class="editormd-emoji-btn"><i class="fa fa-certificate fa-emoji" title="certificate"></i></a>
							<a href="javascript:;" value=":fa-hand-o-right:" title=":fa-hand-o-right:" class="editormd-emoji-btn"><i class="fa fa-hand-o-right fa-emoji" title="hand-o-right"></i></a>
							<a href="javascript:;" value=":fa-hand-o-left:" title=":fa-hand-o-left:" class="editormd-emoji-btn"><i class="fa fa-hand-o-left fa-emoji" title="hand-o-left"></i></a>
							<a href="javascript:;" value=":fa-hand-o-up:" title=":fa-hand-o-up:" class="editormd-emoji-btn"><i class="fa fa-hand-o-up fa-emoji" title="hand-o-up"></i></a>
							<a href="javascript:;" value=":fa-hand-o-down:" title=":fa-hand-o-down:" class="editormd-emoji-btn"><i class="fa fa-hand-o-down fa-emoji" title="hand-o-down"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-left:" title=":fa-arrow-circle-left:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-left fa-emoji" title="arrow-circle-left"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-right:" title=":fa-arrow-circle-right:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-right fa-emoji" title="arrow-circle-right"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-arrow-circle-up:" title=":fa-arrow-circle-up:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-up fa-emoji" title="arrow-circle-up"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-down:" title=":fa-arrow-circle-down:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-down fa-emoji" title="arrow-circle-down"></i></a>
							<a href="javascript:;" value=":fa-globe:" title=":fa-globe:" class="editormd-emoji-btn"><i class="fa fa-globe fa-emoji" title="globe"></i></a>
							<a href="javascript:;" value=":fa-wrench:" title=":fa-wrench:" class="editormd-emoji-btn"><i class="fa fa-wrench fa-emoji" title="wrench"></i></a>
							<a href="javascript:;" value=":fa-tasks:" title=":fa-tasks:" class="editormd-emoji-btn"><i class="fa fa-tasks fa-emoji" title="tasks"></i></a>
							<a href="javascript:;" value=":fa-filter:" title=":fa-filter:" class="editormd-emoji-btn"><i class="fa fa-filter fa-emoji" title="filter"></i></a>
							<a href="javascript:;" value=":fa-briefcase:" title=":fa-briefcase:" class="editormd-emoji-btn"><i class="fa fa-briefcase fa-emoji" title="briefcase"></i></a>
							<a href="javascript:;" value=":fa-arrows-alt:" title=":fa-arrows-alt:" class="editormd-emoji-btn"><i class="fa fa-arrows-alt fa-emoji" title="arrows-alt"></i></a>
							<a href="javascript:;" value=":fa-users:" title=":fa-users:" class="editormd-emoji-btn"><i class="fa fa-users fa-emoji" title="users"></i></a>
							<a href="javascript:;" value=":fa-link:" title=":fa-link:" class="editormd-emoji-btn"><i class="fa fa-link fa-emoji" title="link"></i></a>
							<a href="javascript:;" value=":fa-cloud:" title=":fa-cloud:" class="editormd-emoji-btn"><i class="fa fa-cloud fa-emoji" title="cloud"></i></a>
							<a href="javascript:;" value=":fa-flask:" title=":fa-flask:" class="editormd-emoji-btn"><i class="fa fa-flask fa-emoji" title="flask"></i></a>
							<a href="javascript:;" value=":fa-scissors:" title=":fa-scissors:" class="editormd-emoji-btn"><i class="fa fa-scissors fa-emoji" title="scissors"></i></a>
							<a href="javascript:;" value=":fa-files-o:" title=":fa-files-o:" class="editormd-emoji-btn"><i class="fa fa-files-o fa-emoji" title="files-o"></i></a>
							<a href="javascript:;" value=":fa-paperclip:" title=":fa-paperclip:" class="editormd-emoji-btn"><i class="fa fa-paperclip fa-emoji" title="paperclip"></i></a>
							<a href="javascript:;" value=":fa-floppy-o:" title=":fa-floppy-o:" class="editormd-emoji-btn"><i class="fa fa-floppy-o fa-emoji" title="floppy-o"></i></a>
							<a href="javascript:;" value=":fa-square:" title=":fa-square:" class="editormd-emoji-btn"><i class="fa fa-square fa-emoji" title="square"></i></a>
							<a href="javascript:;" value=":fa-bars:" title=":fa-bars:" class="editormd-emoji-btn"><i class="fa fa-bars fa-emoji" title="bars"></i></a>
							<a href="javascript:;" value=":fa-list-ul:" title=":fa-list-ul:" class="editormd-emoji-btn"><i class="fa fa-list-ul fa-emoji" title="list-ul"></i></a>
							<a href="javascript:;" value=":fa-list-ol:" title=":fa-list-ol:" class="editormd-emoji-btn"><i class="fa fa-list-ol fa-emoji" title="list-ol"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-strikethrough:" title=":fa-strikethrough:" class="editormd-emoji-btn"><i class="fa fa-strikethrough fa-emoji" title="strikethrough"></i></a>
							<a href="javascript:;" value=":fa-underline:" title=":fa-underline:" class="editormd-emoji-btn"><i class="fa fa-underline fa-emoji" title="underline"></i></a>
							<a href="javascript:;" value=":fa-table:" title=":fa-table:" class="editormd-emoji-btn"><i class="fa fa-table fa-emoji" title="table"></i></a>
							<a href="javascript:;" value=":fa-magic:" title=":fa-magic:" class="editormd-emoji-btn"><i class="fa fa-magic fa-emoji" title="magic"></i></a>
							<a href="javascript:;" value=":fa-truck:" title=":fa-truck:" class="editormd-emoji-btn"><i class="fa fa-truck fa-emoji" title="truck"></i></a>
							<a href="javascript:;" value=":fa-pinterest:" title=":fa-pinterest:" class="editormd-emoji-btn"><i class="fa fa-pinterest fa-emoji" title="pinterest"></i></a>
							<a href="javascript:;" value=":fa-pinterest-square:" title=":fa-pinterest-square:" class="editormd-emoji-btn"><i class="fa fa-pinterest-square fa-emoji" title="pinterest-square"></i></a>
							<a href="javascript:;" value=":fa-google-plus-square:" title=":fa-google-plus-square:" class="editormd-emoji-btn"><i class="fa fa-google-plus-square fa-emoji" title="google-plus-square"></i></a>
							<a href="javascript:;" value=":fa-google-plus:" title=":fa-google-plus:" class="editormd-emoji-btn"><i class="fa fa-google-plus fa-emoji" title="google-plus"></i></a>
							<a href="javascript:;" value=":fa-money:" title=":fa-money:" class="editormd-emoji-btn"><i class="fa fa-money fa-emoji" title="money"></i></a>
							<a href="javascript:;" value=":fa-caret-down:" title=":fa-caret-down:" class="editormd-emoji-btn"><i class="fa fa-caret-down fa-emoji" title="caret-down"></i></a>
							<a href="javascript:;" value=":fa-caret-up:" title=":fa-caret-up:" class="editormd-emoji-btn"><i class="fa fa-caret-up fa-emoji" title="caret-up"></i></a>
							<a href="javascript:;" value=":fa-caret-left:" title=":fa-caret-left:" class="editormd-emoji-btn"><i class="fa fa-caret-left fa-emoji" title="caret-left"></i></a>
							<a href="javascript:;" value=":fa-caret-right:" title=":fa-caret-right:" class="editormd-emoji-btn"><i class="fa fa-caret-right fa-emoji" title="caret-right"></i></a>
							<a href="javascript:;" value=":fa-columns:" title=":fa-columns:" class="editormd-emoji-btn"><i class="fa fa-columns fa-emoji" title="columns"></i></a>
							<a href="javascript:;" value=":fa-sort:" title=":fa-sort:" class="editormd-emoji-btn"><i class="fa fa-sort fa-emoji" title="sort"></i></a>
							<a href="javascript:;" value=":fa-sort-desc:" title=":fa-sort-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-desc fa-emoji" title="sort-desc"></i></a>
							<a href="javascript:;" value=":fa-sort-asc:" title=":fa-sort-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-asc fa-emoji" title="sort-asc"></i></a>
							<a href="javascript:;" value=":fa-envelope:" title=":fa-envelope:" class="editormd-emoji-btn"><i class="fa fa-envelope fa-emoji" title="envelope"></i></a>
							<a href="javascript:;" value=":fa-linkedin:" title=":fa-linkedin:" class="editormd-emoji-btn"><i class="fa fa-linkedin fa-emoji" title="linkedin"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-undo:" title=":fa-undo:" class="editormd-emoji-btn"><i class="fa fa-undo fa-emoji" title="undo"></i></a>
							<a href="javascript:;" value=":fa-gavel:" title=":fa-gavel:" class="editormd-emoji-btn"><i class="fa fa-gavel fa-emoji" title="gavel"></i></a>
							<a href="javascript:;" value=":fa-tachometer:" title=":fa-tachometer:" class="editormd-emoji-btn"><i class="fa fa-tachometer fa-emoji" title="tachometer"></i></a>
							<a href="javascript:;" value=":fa-comment-o:" title=":fa-comment-o:" class="editormd-emoji-btn"><i class="fa fa-comment-o fa-emoji" title="comment-o"></i></a>
							<a href="javascript:;" value=":fa-comments-o:" title=":fa-comments-o:" class="editormd-emoji-btn"><i class="fa fa-comments-o fa-emoji" title="comments-o"></i></a>
							<a href="javascript:;" value=":fa-bolt:" title=":fa-bolt:" class="editormd-emoji-btn"><i class="fa fa-bolt fa-emoji" title="bolt"></i></a>
							<a href="javascript:;" value=":fa-sitemap:" title=":fa-sitemap:" class="editormd-emoji-btn"><i class="fa fa-sitemap fa-emoji" title="sitemap"></i></a>
							<a href="javascript:;" value=":fa-umbrella:" title=":fa-umbrella:" class="editormd-emoji-btn"><i class="fa fa-umbrella fa-emoji" title="umbrella"></i></a>
							<a href="javascript:;" value=":fa-clipboard:" title=":fa-clipboard:" class="editormd-emoji-btn"><i class="fa fa-clipboard fa-emoji" title="clipboard"></i></a>
							<a href="javascript:;" value=":fa-lightbulb-o:" title=":fa-lightbulb-o:" class="editormd-emoji-btn"><i class="fa fa-lightbulb-o fa-emoji" title="lightbulb-o"></i></a>
							<a href="javascript:;" value=":fa-exchange:" title=":fa-exchange:" class="editormd-emoji-btn"><i class="fa fa-exchange fa-emoji" title="exchange"></i></a>
							<a href="javascript:;" value=":fa-cloud-download:" title=":fa-cloud-download:" class="editormd-emoji-btn"><i class="fa fa-cloud-download fa-emoji" title="cloud-download"></i></a>
							<a href="javascript:;" value=":fa-cloud-upload:" title=":fa-cloud-upload:" class="editormd-emoji-btn"><i class="fa fa-cloud-upload fa-emoji" title="cloud-upload"></i></a>
							<a href="javascript:;" value=":fa-user-md:" title=":fa-user-md:" class="editormd-emoji-btn"><i class="fa fa-user-md fa-emoji" title="user-md"></i></a>
							<a href="javascript:;" value=":fa-stethoscope:" title=":fa-stethoscope:" class="editormd-emoji-btn"><i class="fa fa-stethoscope fa-emoji" title="stethoscope"></i></a>
							<a href="javascript:;" value=":fa-suitcase:" title=":fa-suitcase:" class="editormd-emoji-btn"><i class="fa fa-suitcase fa-emoji" title="suitcase"></i></a>
							<a href="javascript:;" value=":fa-bell-o:" title=":fa-bell-o:" class="editormd-emoji-btn"><i class="fa fa-bell-o fa-emoji" title="bell-o"></i></a>
							<a href="javascript:;" value=":fa-coffee:" title=":fa-coffee:" class="editormd-emoji-btn"><i class="fa fa-coffee fa-emoji" title="coffee"></i></a>
							<a href="javascript:;" value=":fa-cutlery:" title=":fa-cutlery:" class="editormd-emoji-btn"><i class="fa fa-cutlery fa-emoji" title="cutlery"></i></a>
							<a href="javascript:;" value=":fa-file-text-o:" title=":fa-file-text-o:" class="editormd-emoji-btn"><i class="fa fa-file-text-o fa-emoji" title="file-text-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-building-o:" title=":fa-building-o:" class="editormd-emoji-btn"><i class="fa fa-building-o fa-emoji" title="building-o"></i></a>
							<a href="javascript:;" value=":fa-hospital-o:" title=":fa-hospital-o:" class="editormd-emoji-btn"><i class="fa fa-hospital-o fa-emoji" title="hospital-o"></i></a>
							<a href="javascript:;" value=":fa-ambulance:" title=":fa-ambulance:" class="editormd-emoji-btn"><i class="fa fa-ambulance fa-emoji" title="ambulance"></i></a>
							<a href="javascript:;" value=":fa-medkit:" title=":fa-medkit:" class="editormd-emoji-btn"><i class="fa fa-medkit fa-emoji" title="medkit"></i></a>
							<a href="javascript:;" value=":fa-fighter-jet:" title=":fa-fighter-jet:" class="editormd-emoji-btn"><i class="fa fa-fighter-jet fa-emoji" title="fighter-jet"></i></a>
							<a href="javascript:;" value=":fa-beer:" title=":fa-beer:" class="editormd-emoji-btn"><i class="fa fa-beer fa-emoji" title="beer"></i></a>
							<a href="javascript:;" value=":fa-h-square:" title=":fa-h-square:" class="editormd-emoji-btn"><i class="fa fa-h-square fa-emoji" title="h-square"></i></a>
							<a href="javascript:;" value=":fa-plus-square:" title=":fa-plus-square:" class="editormd-emoji-btn"><i class="fa fa-plus-square fa-emoji" title="plus-square"></i></a>
							<a href="javascript:;" value=":fa-angle-double-left:" title=":fa-angle-double-left:" class="editormd-emoji-btn"><i class="fa fa-angle-double-left fa-emoji" title="angle-double-left"></i></a>
							<a href="javascript:;" value=":fa-angle-double-right:" title=":fa-angle-double-right:" class="editormd-emoji-btn"><i class="fa fa-angle-double-right fa-emoji" title="angle-double-right"></i></a>
							<a href="javascript:;" value=":fa-angle-double-up:" title=":fa-angle-double-up:" class="editormd-emoji-btn"><i class="fa fa-angle-double-up fa-emoji" title="angle-double-up"></i></a>
							<a href="javascript:;" value=":fa-angle-double-down:" title=":fa-angle-double-down:" class="editormd-emoji-btn"><i class="fa fa-angle-double-down fa-emoji" title="angle-double-down"></i></a>
							<a href="javascript:;" value=":fa-angle-left:" title=":fa-angle-left:" class="editormd-emoji-btn"><i class="fa fa-angle-left fa-emoji" title="angle-left"></i></a>
							<a href="javascript:;" value=":fa-angle-right:" title=":fa-angle-right:" class="editormd-emoji-btn"><i class="fa fa-angle-right fa-emoji" title="angle-right"></i></a>
							<a href="javascript:;" value=":fa-angle-up:" title=":fa-angle-up:" class="editormd-emoji-btn"><i class="fa fa-angle-up fa-emoji" title="angle-up"></i></a>
							<a href="javascript:;" value=":fa-angle-down:" title=":fa-angle-down:" class="editormd-emoji-btn"><i class="fa fa-angle-down fa-emoji" title="angle-down"></i></a>
							<a href="javascript:;" value=":fa-desktop:" title=":fa-desktop:" class="editormd-emoji-btn"><i class="fa fa-desktop fa-emoji" title="desktop"></i></a>
							<a href="javascript:;" value=":fa-laptop:" title=":fa-laptop:" class="editormd-emoji-btn"><i class="fa fa-laptop fa-emoji" title="laptop"></i></a>
							<a href="javascript:;" value=":fa-tablet:" title=":fa-tablet:" class="editormd-emoji-btn"><i class="fa fa-tablet fa-emoji" title="tablet"></i></a>
							<a href="javascript:;" value=":fa-mobile:" title=":fa-mobile:" class="editormd-emoji-btn"><i class="fa fa-mobile fa-emoji" title="mobile"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-circle-o:" title=":fa-circle-o:" class="editormd-emoji-btn"><i class="fa fa-circle-o fa-emoji" title="circle-o"></i></a>
							<a href="javascript:;" value=":fa-quote-left:" title=":fa-quote-left:" class="editormd-emoji-btn"><i class="fa fa-quote-left fa-emoji" title="quote-left"></i></a>
							<a href="javascript:;" value=":fa-quote-right:" title=":fa-quote-right:" class="editormd-emoji-btn"><i class="fa fa-quote-right fa-emoji" title="quote-right"></i></a>
							<a href="javascript:;" value=":fa-spinner:" title=":fa-spinner:" class="editormd-emoji-btn"><i class="fa fa-spinner fa-emoji" title="spinner"></i></a>
							<a href="javascript:;" value=":fa-circle:" title=":fa-circle:" class="editormd-emoji-btn"><i class="fa fa-circle fa-emoji" title="circle"></i></a>
							<a href="javascript:;" value=":fa-reply:" title=":fa-reply:" class="editormd-emoji-btn"><i class="fa fa-reply fa-emoji" title="reply"></i></a>
							<a href="javascript:;" value=":fa-github-alt:" title=":fa-github-alt:" class="editormd-emoji-btn"><i class="fa fa-github-alt fa-emoji" title="github-alt"></i></a>
							<a href="javascript:;" value=":fa-folder-o:" title=":fa-folder-o:" class="editormd-emoji-btn"><i class="fa fa-folder-o fa-emoji" title="folder-o"></i></a>
							<a href="javascript:;" value=":fa-folder-open-o:" title=":fa-folder-open-o:" class="editormd-emoji-btn"><i class="fa fa-folder-open-o fa-emoji" title="folder-open-o"></i></a>
							<a href="javascript:;" value=":fa-smile-o:" title=":fa-smile-o:" class="editormd-emoji-btn"><i class="fa fa-smile-o fa-emoji" title="smile-o"></i></a>
							<a href="javascript:;" value=":fa-frown-o:" title=":fa-frown-o:" class="editormd-emoji-btn"><i class="fa fa-frown-o fa-emoji" title="frown-o"></i></a>
							<a href="javascript:;" value=":fa-meh-o:" title=":fa-meh-o:" class="editormd-emoji-btn"><i class="fa fa-meh-o fa-emoji" title="meh-o"></i></a>
							<a href="javascript:;" value=":fa-gamepad:" title=":fa-gamepad:" class="editormd-emoji-btn"><i class="fa fa-gamepad fa-emoji" title="gamepad"></i></a>
							<a href="javascript:;" value=":fa-keyboard-o:" title=":fa-keyboard-o:" class="editormd-emoji-btn"><i class="fa fa-keyboard-o fa-emoji" title="keyboard-o"></i></a>
							<a href="javascript:;" value=":fa-flag-o:" title=":fa-flag-o:" class="editormd-emoji-btn"><i class="fa fa-flag-o fa-emoji" title="flag-o"></i></a>
							<a href="javascript:;" value=":fa-flag-checkered:" title=":fa-flag-checkered:" class="editormd-emoji-btn"><i class="fa fa-flag-checkered fa-emoji" title="flag-checkered"></i></a>
							<a href="javascript:;" value=":fa-terminal:" title=":fa-terminal:" class="editormd-emoji-btn"><i class="fa fa-terminal fa-emoji" title="terminal"></i></a>
							<a href="javascript:;" value=":fa-code:" title=":fa-code:" class="editormd-emoji-btn"><i class="fa fa-code fa-emoji" title="code"></i></a>
							<a href="javascript:;" value=":fa-reply-all:" title=":fa-reply-all:" class="editormd-emoji-btn"><i class="fa fa-reply-all fa-emoji" title="reply-all"></i></a>
							<a href="javascript:;" value=":fa-star-half-o:" title=":fa-star-half-o:" class="editormd-emoji-btn"><i class="fa fa-star-half-o fa-emoji" title="star-half-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-location-arrow:" title=":fa-location-arrow:" class="editormd-emoji-btn"><i class="fa fa-location-arrow fa-emoji" title="location-arrow"></i></a>
							<a href="javascript:;" value=":fa-crop:" title=":fa-crop:" class="editormd-emoji-btn"><i class="fa fa-crop fa-emoji" title="crop"></i></a>
							<a href="javascript:;" value=":fa-code-fork:" title=":fa-code-fork:" class="editormd-emoji-btn"><i class="fa fa-code-fork fa-emoji" title="code-fork"></i></a>
							<a href="javascript:;" value=":fa-chain-broken:" title=":fa-chain-broken:" class="editormd-emoji-btn"><i class="fa fa-chain-broken fa-emoji" title="chain-broken"></i></a>
							<a href="javascript:;" value=":fa-question:" title=":fa-question:" class="editormd-emoji-btn"><i class="fa fa-question fa-emoji" title="question"></i></a>
							<a href="javascript:;" value=":fa-info:" title=":fa-info:" class="editormd-emoji-btn"><i class="fa fa-info fa-emoji" title="info"></i></a>
							<a href="javascript:;" value=":fa-exclamation:" title=":fa-exclamation:" class="editormd-emoji-btn"><i class="fa fa-exclamation fa-emoji" title="exclamation"></i></a>
							<a href="javascript:;" value=":fa-superscript:" title=":fa-superscript:" class="editormd-emoji-btn"><i class="fa fa-superscript fa-emoji" title="superscript"></i></a>
							<a href="javascript:;" value=":fa-subscript:" title=":fa-subscript:" class="editormd-emoji-btn"><i class="fa fa-subscript fa-emoji" title="subscript"></i></a>
							<a href="javascript:;" value=":fa-eraser:" title=":fa-eraser:" class="editormd-emoji-btn"><i class="fa fa-eraser fa-emoji" title="eraser"></i></a>
							<a href="javascript:;" value=":fa-puzzle-piece:" title=":fa-puzzle-piece:" class="editormd-emoji-btn"><i class="fa fa-puzzle-piece fa-emoji" title="puzzle-piece"></i></a>
							<a href="javascript:;" value=":fa-microphone:" title=":fa-microphone:" class="editormd-emoji-btn"><i class="fa fa-microphone fa-emoji" title="microphone"></i></a>
							<a href="javascript:;" value=":fa-microphone-slash:" title=":fa-microphone-slash:" class="editormd-emoji-btn"><i class="fa fa-microphone-slash fa-emoji" title="microphone-slash"></i></a>
							<a href="javascript:;" value=":fa-shield:" title=":fa-shield:" class="editormd-emoji-btn"><i class="fa fa-shield fa-emoji" title="shield"></i></a>
							<a href="javascript:;" value=":fa-calendar-o:" title=":fa-calendar-o:" class="editormd-emoji-btn"><i class="fa fa-calendar-o fa-emoji" title="calendar-o"></i></a>
							<a href="javascript:;" value=":fa-fire-extinguisher:" title=":fa-fire-extinguisher:" class="editormd-emoji-btn"><i class="fa fa-fire-extinguisher fa-emoji" title="fire-extinguisher"></i></a>
							<a href="javascript:;" value=":fa-rocket:" title=":fa-rocket:" class="editormd-emoji-btn"><i class="fa fa-rocket fa-emoji" title="rocket"></i></a>
							<a href="javascript:;" value=":fa-maxcdn:" title=":fa-maxcdn:" class="editormd-emoji-btn"><i class="fa fa-maxcdn fa-emoji" title="maxcdn"></i></a>
							<a href="javascript:;" value=":fa-chevron-circle-left:" title=":fa-chevron-circle-left:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-left fa-emoji" title="chevron-circle-left"></i></a>
							<a href="javascript:;" value=":fa-chevron-circle-right:" title=":fa-chevron-circle-right:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-right fa-emoji" title="chevron-circle-right"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-chevron-circle-up:" title=":fa-chevron-circle-up:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-up fa-emoji" title="chevron-circle-up"></i></a>
							<a href="javascript:;" value=":fa-chevron-circle-down:" title=":fa-chevron-circle-down:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-down fa-emoji" title="chevron-circle-down"></i></a>
							<a href="javascript:;" value=":fa-html5:" title=":fa-html5:" class="editormd-emoji-btn"><i class="fa fa-html5 fa-emoji" title="html5"></i></a>
							<a href="javascript:;" value=":fa-css3:" title=":fa-css3:" class="editormd-emoji-btn"><i class="fa fa-css3 fa-emoji" title="css3"></i></a>
							<a href="javascript:;" value=":fa-anchor:" title=":fa-anchor:" class="editormd-emoji-btn"><i class="fa fa-anchor fa-emoji" title="anchor"></i></a>
							<a href="javascript:;" value=":fa-unlock-alt:" title=":fa-unlock-alt:" class="editormd-emoji-btn"><i class="fa fa-unlock-alt fa-emoji" title="unlock-alt"></i></a>
							<a href="javascript:;" value=":fa-bullseye:" title=":fa-bullseye:" class="editormd-emoji-btn"><i class="fa fa-bullseye fa-emoji" title="bullseye"></i></a>
							<a href="javascript:;" value=":fa-ellipsis-h:" title=":fa-ellipsis-h:" class="editormd-emoji-btn"><i class="fa fa-ellipsis-h fa-emoji" title="ellipsis-h"></i></a>
							<a href="javascript:;" value=":fa-ellipsis-v:" title=":fa-ellipsis-v:" class="editormd-emoji-btn"><i class="fa fa-ellipsis-v fa-emoji" title="ellipsis-v"></i></a>
							<a href="javascript:;" value=":fa-rss-square:" title=":fa-rss-square:" class="editormd-emoji-btn"><i class="fa fa-rss-square fa-emoji" title="rss-square"></i></a>
							<a href="javascript:;" value=":fa-play-circle:" title=":fa-play-circle:" class="editormd-emoji-btn"><i class="fa fa-play-circle fa-emoji" title="play-circle"></i></a>
							<a href="javascript:;" value=":fa-ticket:" title=":fa-ticket:" class="editormd-emoji-btn"><i class="fa fa-ticket fa-emoji" title="ticket"></i></a>
							<a href="javascript:;" value=":fa-minus-square:" title=":fa-minus-square:" class="editormd-emoji-btn"><i class="fa fa-minus-square fa-emoji" title="minus-square"></i></a>
							<a href="javascript:;" value=":fa-minus-square-o:" title=":fa-minus-square-o:" class="editormd-emoji-btn"><i class="fa fa-minus-square-o fa-emoji" title="minus-square-o"></i></a>
							<a href="javascript:;" value=":fa-level-up:" title=":fa-level-up:" class="editormd-emoji-btn"><i class="fa fa-level-up fa-emoji" title="level-up"></i></a>
							<a href="javascript:;" value=":fa-level-down:" title=":fa-level-down:" class="editormd-emoji-btn"><i class="fa fa-level-down fa-emoji" title="level-down"></i></a>
							<a href="javascript:;" value=":fa-check-square:" title=":fa-check-square:" class="editormd-emoji-btn"><i class="fa fa-check-square fa-emoji" title="check-square"></i></a>
							<a href="javascript:;" value=":fa-pencil-square:" title=":fa-pencil-square:" class="editormd-emoji-btn"><i class="fa fa-pencil-square fa-emoji" title="pencil-square"></i></a>
							<a href="javascript:;" value=":fa-share-square:" title=":fa-share-square:" class="editormd-emoji-btn"><i class="fa fa-share-square fa-emoji" title="share-square"></i></a>
							<a href="javascript:;" value=":fa-compass:" title=":fa-compass:" class="editormd-emoji-btn"><i class="fa fa-compass fa-emoji" title="compass"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-caret-square-o-down:" title=":fa-caret-square-o-down:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-down fa-emoji" title="caret-square-o-down"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-up:" title=":fa-caret-square-o-up:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-up fa-emoji" title="caret-square-o-up"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-right:" title=":fa-caret-square-o-right:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-right fa-emoji" title="caret-square-o-right"></i></a>
							<a href="javascript:;" value=":fa-eur:" title=":fa-eur:" class="editormd-emoji-btn"><i class="fa fa-eur fa-emoji" title="eur"></i></a>
							<a href="javascript:;" value=":fa-gbp:" title=":fa-gbp:" class="editormd-emoji-btn"><i class="fa fa-gbp fa-emoji" title="gbp"></i></a>
							<a href="javascript:;" value=":fa-usd:" title=":fa-usd:" class="editormd-emoji-btn"><i class="fa fa-usd fa-emoji" title="usd"></i></a>
							<a href="javascript:;" value=":fa-inr:" title=":fa-inr:" class="editormd-emoji-btn"><i class="fa fa-inr fa-emoji" title="inr"></i></a>
							<a href="javascript:;" value=":fa-jpy:" title=":fa-jpy:" class="editormd-emoji-btn"><i class="fa fa-jpy fa-emoji" title="jpy"></i></a>
							<a href="javascript:;" value=":fa-rub:" title=":fa-rub:" class="editormd-emoji-btn"><i class="fa fa-rub fa-emoji" title="rub"></i></a>
							<a href="javascript:;" value=":fa-krw:" title=":fa-krw:" class="editormd-emoji-btn"><i class="fa fa-krw fa-emoji" title="krw"></i></a>
							<a href="javascript:;" value=":fa-btc:" title=":fa-btc:" class="editormd-emoji-btn"><i class="fa fa-btc fa-emoji" title="btc"></i></a>
							<a href="javascript:;" value=":fa-file:" title=":fa-file:" class="editormd-emoji-btn"><i class="fa fa-file fa-emoji" title="file"></i></a>
							<a href="javascript:;" value=":fa-file-text:" title=":fa-file-text:" class="editormd-emoji-btn"><i class="fa fa-file-text fa-emoji" title="file-text"></i></a>
							<a href="javascript:;" value=":fa-sort-alpha-asc:" title=":fa-sort-alpha-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-alpha-asc fa-emoji" title="sort-alpha-asc"></i></a>
							<a href="javascript:;" value=":fa-sort-alpha-desc:" title=":fa-sort-alpha-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-alpha-desc fa-emoji" title="sort-alpha-desc"></i></a>
							<a href="javascript:;" value=":fa-sort-amount-asc:" title=":fa-sort-amount-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-amount-asc fa-emoji" title="sort-amount-asc"></i></a>
							<a href="javascript:;" value=":fa-sort-amount-desc:" title=":fa-sort-amount-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-amount-desc fa-emoji" title="sort-amount-desc"></i></a>
							<a href="javascript:;" value=":fa-sort-numeric-asc:" title=":fa-sort-numeric-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-numeric-asc fa-emoji" title="sort-numeric-asc"></i></a>
							<a href="javascript:;" value=":fa-sort-numeric-desc:" title=":fa-sort-numeric-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-numeric-desc fa-emoji" title="sort-numeric-desc"></i></a>
							<a href="javascript:;" value=":fa-thumbs-up:" title=":fa-thumbs-up:" class="editormd-emoji-btn"><i class="fa fa-thumbs-up fa-emoji" title="thumbs-up"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-thumbs-down:" title=":fa-thumbs-down:" class="editormd-emoji-btn"><i class="fa fa-thumbs-down fa-emoji" title="thumbs-down"></i></a>
							<a href="javascript:;" value=":fa-youtube-square:" title=":fa-youtube-square:" class="editormd-emoji-btn"><i class="fa fa-youtube-square fa-emoji" title="youtube-square"></i></a>
							<a href="javascript:;" value=":fa-youtube:" title=":fa-youtube:" class="editormd-emoji-btn"><i class="fa fa-youtube fa-emoji" title="youtube"></i></a>
							<a href="javascript:;" value=":fa-xing:" title=":fa-xing:" class="editormd-emoji-btn"><i class="fa fa-xing fa-emoji" title="xing"></i></a>
							<a href="javascript:;" value=":fa-xing-square:" title=":fa-xing-square:" class="editormd-emoji-btn"><i class="fa fa-xing-square fa-emoji" title="xing-square"></i></a>
							<a href="javascript:;" value=":fa-youtube-play:" title=":fa-youtube-play:" class="editormd-emoji-btn"><i class="fa fa-youtube-play fa-emoji" title="youtube-play"></i></a>
							<a href="javascript:;" value=":fa-dropbox:" title=":fa-dropbox:" class="editormd-emoji-btn"><i class="fa fa-dropbox fa-emoji" title="dropbox"></i></a>
							<a href="javascript:;" value=":fa-stack-overflow:" title=":fa-stack-overflow:" class="editormd-emoji-btn"><i class="fa fa-stack-overflow fa-emoji" title="stack-overflow"></i></a>
							<a href="javascript:;" value=":fa-instagram:" title=":fa-instagram:" class="editormd-emoji-btn"><i class="fa fa-instagram fa-emoji" title="instagram"></i></a>
							<a href="javascript:;" value=":fa-flickr:" title=":fa-flickr:" class="editormd-emoji-btn"><i class="fa fa-flickr fa-emoji" title="flickr"></i></a>
							<a href="javascript:;" value=":fa-adn:" title=":fa-adn:" class="editormd-emoji-btn"><i class="fa fa-adn fa-emoji" title="adn"></i></a>
							<a href="javascript:;" value=":fa-bitbucket:" title=":fa-bitbucket:" class="editormd-emoji-btn"><i class="fa fa-bitbucket fa-emoji" title="bitbucket"></i></a>
							<a href="javascript:;" value=":fa-bitbucket-square:" title=":fa-bitbucket-square:" class="editormd-emoji-btn"><i class="fa fa-bitbucket-square fa-emoji" title="bitbucket-square"></i></a>
							<a href="javascript:;" value=":fa-tumblr:" title=":fa-tumblr:" class="editormd-emoji-btn"><i class="fa fa-tumblr fa-emoji" title="tumblr"></i></a>
							<a href="javascript:;" value=":fa-tumblr-square:" title=":fa-tumblr-square:" class="editormd-emoji-btn"><i class="fa fa-tumblr-square fa-emoji" title="tumblr-square"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-down:" title=":fa-long-arrow-down:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-down fa-emoji" title="long-arrow-down"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-up:" title=":fa-long-arrow-up:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-up fa-emoji" title="long-arrow-up"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-left:" title=":fa-long-arrow-left:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-left fa-emoji" title="long-arrow-left"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-right:" title=":fa-long-arrow-right:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-right fa-emoji" title="long-arrow-right"></i></a>
							<a href="javascript:;" value=":fa-apple:" title=":fa-apple:" class="editormd-emoji-btn"><i class="fa fa-apple fa-emoji" title="apple"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-windows:" title=":fa-windows:" class="editormd-emoji-btn"><i class="fa fa-windows fa-emoji" title="windows"></i></a>
							<a href="javascript:;" value=":fa-android:" title=":fa-android:" class="editormd-emoji-btn"><i class="fa fa-android fa-emoji" title="android"></i></a>
							<a href="javascript:;" value=":fa-linux:" title=":fa-linux:" class="editormd-emoji-btn"><i class="fa fa-linux fa-emoji" title="linux"></i></a>
							<a href="javascript:;" value=":fa-dribbble:" title=":fa-dribbble:" class="editormd-emoji-btn"><i class="fa fa-dribbble fa-emoji" title="dribbble"></i></a>
							<a href="javascript:;" value=":fa-skype:" title=":fa-skype:" class="editormd-emoji-btn"><i class="fa fa-skype fa-emoji" title="skype"></i></a>
							<a href="javascript:;" value=":fa-foursquare:" title=":fa-foursquare:" class="editormd-emoji-btn"><i class="fa fa-foursquare fa-emoji" title="foursquare"></i></a>
							<a href="javascript:;" value=":fa-trello:" title=":fa-trello:" class="editormd-emoji-btn"><i class="fa fa-trello fa-emoji" title="trello"></i></a>
							<a href="javascript:;" value=":fa-female:" title=":fa-female:" class="editormd-emoji-btn"><i class="fa fa-female fa-emoji" title="female"></i></a>
							<a href="javascript:;" value=":fa-male:" title=":fa-male:" class="editormd-emoji-btn"><i class="fa fa-male fa-emoji" title="male"></i></a>
							<a href="javascript:;" value=":fa-gratipay:" title=":fa-gratipay:" class="editormd-emoji-btn"><i class="fa fa-gratipay fa-emoji" title="gratipay"></i></a>
							<a href="javascript:;" value=":fa-sun-o:" title=":fa-sun-o:" class="editormd-emoji-btn"><i class="fa fa-sun-o fa-emoji" title="sun-o"></i></a>
							<a href="javascript:;" value=":fa-moon-o:" title=":fa-moon-o:" class="editormd-emoji-btn"><i class="fa fa-moon-o fa-emoji" title="moon-o"></i></a>
							<a href="javascript:;" value=":fa-archive:" title=":fa-archive:" class="editormd-emoji-btn"><i class="fa fa-archive fa-emoji" title="archive"></i></a>
							<a href="javascript:;" value=":fa-bug:" title=":fa-bug:" class="editormd-emoji-btn"><i class="fa fa-bug fa-emoji" title="bug"></i></a>
							<a href="javascript:;" value=":fa-vk:" title=":fa-vk:" class="editormd-emoji-btn"><i class="fa fa-vk fa-emoji" title="vk"></i></a>
							<a href="javascript:;" value=":fa-weibo:" title=":fa-weibo:" class="editormd-emoji-btn"><i class="fa fa-weibo fa-emoji" title="weibo"></i></a>
							<a href="javascript:;" value=":fa-renren:" title=":fa-renren:" class="editormd-emoji-btn"><i class="fa fa-renren fa-emoji" title="renren"></i></a>
							<a href="javascript:;" value=":fa-pagelines:" title=":fa-pagelines:" class="editormd-emoji-btn"><i class="fa fa-pagelines fa-emoji" title="pagelines"></i></a>
							<a href="javascript:;" value=":fa-stack-exchange:" title=":fa-stack-exchange:" class="editormd-emoji-btn"><i class="fa fa-stack-exchange fa-emoji" title="stack-exchange"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-o-right:" title=":fa-arrow-circle-o-right:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-right fa-emoji" title="arrow-circle-o-right"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-arrow-circle-o-left:" title=":fa-arrow-circle-o-left:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-left fa-emoji" title="arrow-circle-o-left"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-left:" title=":fa-caret-square-o-left:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-left fa-emoji" title="caret-square-o-left"></i></a>
							<a href="javascript:;" value=":fa-dot-circle-o:" title=":fa-dot-circle-o:" class="editormd-emoji-btn"><i class="fa fa-dot-circle-o fa-emoji" title="dot-circle-o"></i></a>
							<a href="javascript:;" value=":fa-wheelchair:" title=":fa-wheelchair:" class="editormd-emoji-btn"><i class="fa fa-wheelchair fa-emoji" title="wheelchair"></i></a>
							<a href="javascript:;" value=":fa-vimeo-square:" title=":fa-vimeo-square:" class="editormd-emoji-btn"><i class="fa fa-vimeo-square fa-emoji" title="vimeo-square"></i></a>
							<a href="javascript:;" value=":fa-try:" title=":fa-try:" class="editormd-emoji-btn"><i class="fa fa-try fa-emoji" title="try"></i></a>
							<a href="javascript:;" value=":fa-plus-square-o:" title=":fa-plus-square-o:" class="editormd-emoji-btn"><i class="fa fa-plus-square-o fa-emoji" title="plus-square-o"></i></a>
							<a href="javascript:;" value=":fa-space-shuttle:" title=":fa-space-shuttle:" class="editormd-emoji-btn"><i class="fa fa-space-shuttle fa-emoji" title="space-shuttle"></i></a>
							<a href="javascript:;" value=":fa-slack:" title=":fa-slack:" class="editormd-emoji-btn"><i class="fa fa-slack fa-emoji" title="slack"></i></a>
							<a href="javascript:;" value=":fa-envelope-square:" title=":fa-envelope-square:" class="editormd-emoji-btn"><i class="fa fa-envelope-square fa-emoji" title="envelope-square"></i></a>
							<a href="javascript:;" value=":fa-wordpress:" title=":fa-wordpress:" class="editormd-emoji-btn"><i class="fa fa-wordpress fa-emoji" title="wordpress"></i></a>
							<a href="javascript:;" value=":fa-openid:" title=":fa-openid:" class="editormd-emoji-btn"><i class="fa fa-openid fa-emoji" title="openid"></i></a>
							<a href="javascript:;" value=":fa-university:" title=":fa-university:" class="editormd-emoji-btn"><i class="fa fa-university fa-emoji" title="university"></i></a>
							<a href="javascript:;" value=":fa-graduation-cap:" title=":fa-graduation-cap:" class="editormd-emoji-btn"><i class="fa fa-graduation-cap fa-emoji" title="graduation-cap"></i></a>
							<a href="javascript:;" value=":fa-yahoo:" title=":fa-yahoo:" class="editormd-emoji-btn"><i class="fa fa-yahoo fa-emoji" title="yahoo"></i></a>
							<a href="javascript:;" value=":fa-google:" title=":fa-google:" class="editormd-emoji-btn"><i class="fa fa-google fa-emoji" title="google"></i></a>
							<a href="javascript:;" value=":fa-reddit:" title=":fa-reddit:" class="editormd-emoji-btn"><i class="fa fa-reddit fa-emoji" title="reddit"></i></a>
							<a href="javascript:;" value=":fa-reddit-square:" title=":fa-reddit-square:" class="editormd-emoji-btn"><i class="fa fa-reddit-square fa-emoji" title="reddit-square"></i></a>
							<a href="javascript:;" value=":fa-stumbleupon-circle:" title=":fa-stumbleupon-circle:" class="editormd-emoji-btn"><i class="fa fa-stumbleupon-circle fa-emoji" title="stumbleupon-circle"></i></a>
							<a href="javascript:;" value=":fa-stumbleupon:" title=":fa-stumbleupon:" class="editormd-emoji-btn"><i class="fa fa-stumbleupon fa-emoji" title="stumbleupon"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-delicious:" title=":fa-delicious:" class="editormd-emoji-btn"><i class="fa fa-delicious fa-emoji" title="delicious"></i></a>
							<a href="javascript:;" value=":fa-digg:" title=":fa-digg:" class="editormd-emoji-btn"><i class="fa fa-digg fa-emoji" title="digg"></i></a>
							<a href="javascript:;" value=":fa-pied-piper:" title=":fa-pied-piper:" class="editormd-emoji-btn"><i class="fa fa-pied-piper fa-emoji" title="pied-piper"></i></a>
							<a href="javascript:;" value=":fa-pied-piper-alt:" title=":fa-pied-piper-alt:" class="editormd-emoji-btn"><i class="fa fa-pied-piper-alt fa-emoji" title="pied-piper-alt"></i></a>
							<a href="javascript:;" value=":fa-drupal:" title=":fa-drupal:" class="editormd-emoji-btn"><i class="fa fa-drupal fa-emoji" title="drupal"></i></a>
							<a href="javascript:;" value=":fa-joomla:" title=":fa-joomla:" class="editormd-emoji-btn"><i class="fa fa-joomla fa-emoji" title="joomla"></i></a>
							<a href="javascript:;" value=":fa-language:" title=":fa-language:" class="editormd-emoji-btn"><i class="fa fa-language fa-emoji" title="language"></i></a>
							<a href="javascript:;" value=":fa-fax:" title=":fa-fax:" class="editormd-emoji-btn"><i class="fa fa-fax fa-emoji" title="fax"></i></a>
							<a href="javascript:;" value=":fa-building:" title=":fa-building:" class="editormd-emoji-btn"><i class="fa fa-building fa-emoji" title="building"></i></a>
							<a href="javascript:;" value=":fa-child:" title=":fa-child:" class="editormd-emoji-btn"><i class="fa fa-child fa-emoji" title="child"></i></a>
							<a href="javascript:;" value=":fa-paw:" title=":fa-paw:" class="editormd-emoji-btn"><i class="fa fa-paw fa-emoji" title="paw"></i></a>
							<a href="javascript:;" value=":fa-spoon:" title=":fa-spoon:" class="editormd-emoji-btn"><i class="fa fa-spoon fa-emoji" title="spoon"></i></a>
							<a href="javascript:;" value=":fa-cube:" title=":fa-cube:" class="editormd-emoji-btn"><i class="fa fa-cube fa-emoji" title="cube"></i></a>
							<a href="javascript:;" value=":fa-cubes:" title=":fa-cubes:" class="editormd-emoji-btn"><i class="fa fa-cubes fa-emoji" title="cubes"></i></a>
							<a href="javascript:;" value=":fa-behance:" title=":fa-behance:" class="editormd-emoji-btn"><i class="fa fa-behance fa-emoji" title="behance"></i></a>
							<a href="javascript:;" value=":fa-behance-square:" title=":fa-behance-square:" class="editormd-emoji-btn"><i class="fa fa-behance-square fa-emoji" title="behance-square"></i></a>
							<a href="javascript:;" value=":fa-steam:" title=":fa-steam:" class="editormd-emoji-btn"><i class="fa fa-steam fa-emoji" title="steam"></i></a>
							<a href="javascript:;" value=":fa-steam-square:" title=":fa-steam-square:" class="editormd-emoji-btn"><i class="fa fa-steam-square fa-emoji" title="steam-square"></i></a>
							<a href="javascript:;" value=":fa-recycle:" title=":fa-recycle:" class="editormd-emoji-btn"><i class="fa fa-recycle fa-emoji" title="recycle"></i></a>
							<a href="javascript:;" value=":fa-car:" title=":fa-car:" class="editormd-emoji-btn"><i class="fa fa-car fa-emoji" title="car"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-taxi:" title=":fa-taxi:" class="editormd-emoji-btn"><i class="fa fa-taxi fa-emoji" title="taxi"></i></a>
							<a href="javascript:;" value=":fa-tree:" title=":fa-tree:" class="editormd-emoji-btn"><i class="fa fa-tree fa-emoji" title="tree"></i></a>
							<a href="javascript:;" value=":fa-spotify:" title=":fa-spotify:" class="editormd-emoji-btn"><i class="fa fa-spotify fa-emoji" title="spotify"></i></a>
							<a href="javascript:;" value=":fa-deviantart:" title=":fa-deviantart:" class="editormd-emoji-btn"><i class="fa fa-deviantart fa-emoji" title="deviantart"></i></a>
							<a href="javascript:;" value=":fa-soundcloud:" title=":fa-soundcloud:" class="editormd-emoji-btn"><i class="fa fa-soundcloud fa-emoji" title="soundcloud"></i></a>
							<a href="javascript:;" value=":fa-database:" title=":fa-database:" class="editormd-emoji-btn"><i class="fa fa-database fa-emoji" title="database"></i></a>
							<a href="javascript:;" value=":fa-file-pdf-o:" title=":fa-file-pdf-o:" class="editormd-emoji-btn"><i class="fa fa-file-pdf-o fa-emoji" title="file-pdf-o"></i></a>
							<a href="javascript:;" value=":fa-file-word-o:" title=":fa-file-word-o:" class="editormd-emoji-btn"><i class="fa fa-file-word-o fa-emoji" title="file-word-o"></i></a>
							<a href="javascript:;" value=":fa-file-excel-o:" title=":fa-file-excel-o:" class="editormd-emoji-btn"><i class="fa fa-file-excel-o fa-emoji" title="file-excel-o"></i></a>
							<a href="javascript:;" value=":fa-file-powerpoint-o:" title=":fa-file-powerpoint-o:" class="editormd-emoji-btn"><i class="fa fa-file-powerpoint-o fa-emoji" title="file-powerpoint-o"></i></a>
							<a href="javascript:;" value=":fa-file-image-o:" title=":fa-file-image-o:" class="editormd-emoji-btn"><i class="fa fa-file-image-o fa-emoji" title="file-image-o"></i></a>
							<a href="javascript:;" value=":fa-file-archive-o:" title=":fa-file-archive-o:" class="editormd-emoji-btn"><i class="fa fa-file-archive-o fa-emoji" title="file-archive-o"></i></a>
							<a href="javascript:;" value=":fa-file-audio-o:" title=":fa-file-audio-o:" class="editormd-emoji-btn"><i class="fa fa-file-audio-o fa-emoji" title="file-audio-o"></i></a>
							<a href="javascript:;" value=":fa-file-video-o:" title=":fa-file-video-o:" class="editormd-emoji-btn"><i class="fa fa-file-video-o fa-emoji" title="file-video-o"></i></a>
							<a href="javascript:;" value=":fa-file-code-o:" title=":fa-file-code-o:" class="editormd-emoji-btn"><i class="fa fa-file-code-o fa-emoji" title="file-code-o"></i></a>
							<a href="javascript:;" value=":fa-vine:" title=":fa-vine:" class="editormd-emoji-btn"><i class="fa fa-vine fa-emoji" title="vine"></i></a>
							<a href="javascript:;" value=":fa-codepen:" title=":fa-codepen:" class="editormd-emoji-btn"><i class="fa fa-codepen fa-emoji" title="codepen"></i></a>
							<a href="javascript:;" value=":fa-jsfiddle:" title=":fa-jsfiddle:" class="editormd-emoji-btn"><i class="fa fa-jsfiddle fa-emoji" title="jsfiddle"></i></a>
							<a href="javascript:;" value=":fa-life-ring:" title=":fa-life-ring:" class="editormd-emoji-btn"><i class="fa fa-life-ring fa-emoji" title="life-ring"></i></a>
							<a href="javascript:;" value=":fa-circle-o-notch:" title=":fa-circle-o-notch:" class="editormd-emoji-btn"><i class="fa fa-circle-o-notch fa-emoji" title="circle-o-notch"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-rebel:" title=":fa-rebel:" class="editormd-emoji-btn"><i class="fa fa-rebel fa-emoji" title="rebel"></i></a>
							<a href="javascript:;" value=":fa-empire:" title=":fa-empire:" class="editormd-emoji-btn"><i class="fa fa-empire fa-emoji" title="empire"></i></a>
							<a href="javascript:;" value=":fa-git-square:" title=":fa-git-square:" class="editormd-emoji-btn"><i class="fa fa-git-square fa-emoji" title="git-square"></i></a>
							<a href="javascript:;" value=":fa-git:" title=":fa-git:" class="editormd-emoji-btn"><i class="fa fa-git fa-emoji" title="git"></i></a>
							<a href="javascript:;" value=":fa-hacker-news:" title=":fa-hacker-news:" class="editormd-emoji-btn"><i class="fa fa-hacker-news fa-emoji" title="hacker-news"></i></a>
							<a href="javascript:;" value=":fa-tencent-weibo:" title=":fa-tencent-weibo:" class="editormd-emoji-btn"><i class="fa fa-tencent-weibo fa-emoji" title="tencent-weibo"></i></a>
							<a href="javascript:;" value=":fa-qq:" title=":fa-qq:" class="editormd-emoji-btn"><i class="fa fa-qq fa-emoji" title="qq"></i></a>
							<a href="javascript:;" value=":fa-weixin:" title=":fa-weixin:" class="editormd-emoji-btn"><i class="fa fa-weixin fa-emoji" title="weixin"></i></a>
							<a href="javascript:;" value=":fa-paper-plane:" title=":fa-paper-plane:" class="editormd-emoji-btn"><i class="fa fa-paper-plane fa-emoji" title="paper-plane"></i></a>
							<a href="javascript:;" value=":fa-paper-plane-o:" title=":fa-paper-plane-o:" class="editormd-emoji-btn"><i class="fa fa-paper-plane-o fa-emoji" title="paper-plane-o"></i></a>
							<a href="javascript:;" value=":fa-history:" title=":fa-history:" class="editormd-emoji-btn"><i class="fa fa-history fa-emoji" title="history"></i></a>
							<a href="javascript:;" value=":fa-circle-thin:" title=":fa-circle-thin:" class="editormd-emoji-btn"><i class="fa fa-circle-thin fa-emoji" title="circle-thin"></i></a>
							<a href="javascript:;" value=":fa-header:" title=":fa-header:" class="editormd-emoji-btn"><i class="fa fa-header fa-emoji" title="header"></i></a>
							<a href="javascript:;" value=":fa-paragraph:" title=":fa-paragraph:" class="editormd-emoji-btn"><i class="fa fa-paragraph fa-emoji" title="paragraph"></i></a>
							<a href="javascript:;" value=":fa-sliders:" title=":fa-sliders:" class="editormd-emoji-btn"><i class="fa fa-sliders fa-emoji" title="sliders"></i></a>
							<a href="javascript:;" value=":fa-share-alt:" title=":fa-share-alt:" class="editormd-emoji-btn"><i class="fa fa-share-alt fa-emoji" title="share-alt"></i></a>
							<a href="javascript:;" value=":fa-share-alt-square:" title=":fa-share-alt-square:" class="editormd-emoji-btn"><i class="fa fa-share-alt-square fa-emoji" title="share-alt-square"></i></a>
							<a href="javascript:;" value=":fa-bomb:" title=":fa-bomb:" class="editormd-emoji-btn"><i class="fa fa-bomb fa-emoji" title="bomb"></i></a>
							<a href="javascript:;" value=":fa-futbol-o:" title=":fa-futbol-o:" class="editormd-emoji-btn"><i class="fa fa-futbol-o fa-emoji" title="futbol-o"></i></a>
							<a href="javascript:;" value=":fa-tty:" title=":fa-tty:" class="editormd-emoji-btn"><i class="fa fa-tty fa-emoji" title="tty"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-binoculars:" title=":fa-binoculars:" class="editormd-emoji-btn"><i class="fa fa-binoculars fa-emoji" title="binoculars"></i></a>
							<a href="javascript:;" value=":fa-plug:" title=":fa-plug:" class="editormd-emoji-btn"><i class="fa fa-plug fa-emoji" title="plug"></i></a>
							<a href="javascript:;" value=":fa-slideshare:" title=":fa-slideshare:" class="editormd-emoji-btn"><i class="fa fa-slideshare fa-emoji" title="slideshare"></i></a>
							<a href="javascript:;" value=":fa-twitch:" title=":fa-twitch:" class="editormd-emoji-btn"><i class="fa fa-twitch fa-emoji" title="twitch"></i></a>
							<a href="javascript:;" value=":fa-yelp:" title=":fa-yelp:" class="editormd-emoji-btn"><i class="fa fa-yelp fa-emoji" title="yelp"></i></a>
							<a href="javascript:;" value=":fa-newspaper-o:" title=":fa-newspaper-o:" class="editormd-emoji-btn"><i class="fa fa-newspaper-o fa-emoji" title="newspaper-o"></i></a>
							<a href="javascript:;" value=":fa-wifi:" title=":fa-wifi:" class="editormd-emoji-btn"><i class="fa fa-wifi fa-emoji" title="wifi"></i></a>
							<a href="javascript:;" value=":fa-calculator:" title=":fa-calculator:" class="editormd-emoji-btn"><i class="fa fa-calculator fa-emoji" title="calculator"></i></a>
							<a href="javascript:;" value=":fa-paypal:" title=":fa-paypal:" class="editormd-emoji-btn"><i class="fa fa-paypal fa-emoji" title="paypal"></i></a>
							<a href="javascript:;" value=":fa-google-wallet:" title=":fa-google-wallet:" class="editormd-emoji-btn"><i class="fa fa-google-wallet fa-emoji" title="google-wallet"></i></a>
							<a href="javascript:;" value=":fa-cc-visa:" title=":fa-cc-visa:" class="editormd-emoji-btn"><i class="fa fa-cc-visa fa-emoji" title="cc-visa"></i></a>
							<a href="javascript:;" value=":fa-cc-mastercard:" title=":fa-cc-mastercard:" class="editormd-emoji-btn"><i class="fa fa-cc-mastercard fa-emoji" title="cc-mastercard"></i></a>
							<a href="javascript:;" value=":fa-cc-discover:" title=":fa-cc-discover:" class="editormd-emoji-btn"><i class="fa fa-cc-discover fa-emoji" title="cc-discover"></i></a>
							<a href="javascript:;" value=":fa-cc-amex:" title=":fa-cc-amex:" class="editormd-emoji-btn"><i class="fa fa-cc-amex fa-emoji" title="cc-amex"></i></a>
							<a href="javascript:;" value=":fa-cc-paypal:" title=":fa-cc-paypal:" class="editormd-emoji-btn"><i class="fa fa-cc-paypal fa-emoji" title="cc-paypal"></i></a>
							<a href="javascript:;" value=":fa-cc-stripe:" title=":fa-cc-stripe:" class="editormd-emoji-btn"><i class="fa fa-cc-stripe fa-emoji" title="cc-stripe"></i></a>
							<a href="javascript:;" value=":fa-bell-slash:" title=":fa-bell-slash:" class="editormd-emoji-btn"><i class="fa fa-bell-slash fa-emoji" title="bell-slash"></i></a>
							<a href="javascript:;" value=":fa-bell-slash-o:" title=":fa-bell-slash-o:" class="editormd-emoji-btn"><i class="fa fa-bell-slash-o fa-emoji" title="bell-slash-o"></i></a>
							<a href="javascript:;" value=":fa-trash:" title=":fa-trash:" class="editormd-emoji-btn"><i class="fa fa-trash fa-emoji" title="trash"></i></a>
							<a href="javascript:;" value=":fa-copyright:" title=":fa-copyright:" class="editormd-emoji-btn"><i class="fa fa-copyright fa-emoji" title="copyright"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-at:" title=":fa-at:" class="editormd-emoji-btn"><i class="fa fa-at fa-emoji" title="at"></i></a>
							<a href="javascript:;" value=":fa-eyedropper:" title=":fa-eyedropper:" class="editormd-emoji-btn"><i class="fa fa-eyedropper fa-emoji" title="eyedropper"></i></a>
							<a href="javascript:;" value=":fa-paint-brush:" title=":fa-paint-brush:" class="editormd-emoji-btn"><i class="fa fa-paint-brush fa-emoji" title="paint-brush"></i></a>
							<a href="javascript:;" value=":fa-birthday-cake:" title=":fa-birthday-cake:" class="editormd-emoji-btn"><i class="fa fa-birthday-cake fa-emoji" title="birthday-cake"></i></a>
							<a href="javascript:;" value=":fa-area-chart:" title=":fa-area-chart:" class="editormd-emoji-btn"><i class="fa fa-area-chart fa-emoji" title="area-chart"></i></a>
							<a href="javascript:;" value=":fa-pie-chart:" title=":fa-pie-chart:" class="editormd-emoji-btn"><i class="fa fa-pie-chart fa-emoji" title="pie-chart"></i></a>
							<a href="javascript:;" value=":fa-line-chart:" title=":fa-line-chart:" class="editormd-emoji-btn"><i class="fa fa-line-chart fa-emoji" title="line-chart"></i></a>
							<a href="javascript:;" value=":fa-lastfm:" title=":fa-lastfm:" class="editormd-emoji-btn"><i class="fa fa-lastfm fa-emoji" title="lastfm"></i></a>
							<a href="javascript:;" value=":fa-lastfm-square:" title=":fa-lastfm-square:" class="editormd-emoji-btn"><i class="fa fa-lastfm-square fa-emoji" title="lastfm-square"></i></a>
							<a href="javascript:;" value=":fa-toggle-off:" title=":fa-toggle-off:" class="editormd-emoji-btn"><i class="fa fa-toggle-off fa-emoji" title="toggle-off"></i></a>
							<a href="javascript:;" value=":fa-toggle-on:" title=":fa-toggle-on:" class="editormd-emoji-btn"><i class="fa fa-toggle-on fa-emoji" title="toggle-on"></i></a>
							<a href="javascript:;" value=":fa-bicycle:" title=":fa-bicycle:" class="editormd-emoji-btn"><i class="fa fa-bicycle fa-emoji" title="bicycle"></i></a>
							<a href="javascript:;" value=":fa-bus:" title=":fa-bus:" class="editormd-emoji-btn"><i class="fa fa-bus fa-emoji" title="bus"></i></a>
							<a href="javascript:;" value=":fa-ioxhost:" title=":fa-ioxhost:" class="editormd-emoji-btn"><i class="fa fa-ioxhost fa-emoji" title="ioxhost"></i></a>
							<a href="javascript:;" value=":fa-angellist:" title=":fa-angellist:" class="editormd-emoji-btn"><i class="fa fa-angellist fa-emoji" title="angellist"></i></a>
							<a href="javascript:;" value=":fa-cc:" title=":fa-cc:" class="editormd-emoji-btn"><i class="fa fa-cc fa-emoji" title="cc"></i></a>
							<a href="javascript:;" value=":fa-ils:" title=":fa-ils:" class="editormd-emoji-btn"><i class="fa fa-ils fa-emoji" title="ils"></i></a>
							<a href="javascript:;" value=":fa-meanpath:" title=":fa-meanpath:" class="editormd-emoji-btn"><i class="fa fa-meanpath fa-emoji" title="meanpath"></i></a>
							<a href="javascript:;" value=":fa-buysellads:" title=":fa-buysellads:" class="editormd-emoji-btn"><i class="fa fa-buysellads fa-emoji" title="buysellads"></i></a>
							<a href="javascript:;" value=":fa-connectdevelop:" title=":fa-connectdevelop:" class="editormd-emoji-btn"><i class="fa fa-connectdevelop fa-emoji" title="connectdevelop"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-dashcube:" title=":fa-dashcube:" class="editormd-emoji-btn"><i class="fa fa-dashcube fa-emoji" title="dashcube"></i></a>
							<a href="javascript:;" value=":fa-forumbee:" title=":fa-forumbee:" class="editormd-emoji-btn"><i class="fa fa-forumbee fa-emoji" title="forumbee"></i></a>
							<a href="javascript:;" value=":fa-leanpub:" title=":fa-leanpub:" class="editormd-emoji-btn"><i class="fa fa-leanpub fa-emoji" title="leanpub"></i></a>
							<a href="javascript:;" value=":fa-sellsy:" title=":fa-sellsy:" class="editormd-emoji-btn"><i class="fa fa-sellsy fa-emoji" title="sellsy"></i></a>
							<a href="javascript:;" value=":fa-shirtsinbulk:" title=":fa-shirtsinbulk:" class="editormd-emoji-btn"><i class="fa fa-shirtsinbulk fa-emoji" title="shirtsinbulk"></i></a>
							<a href="javascript:;" value=":fa-simplybuilt:" title=":fa-simplybuilt:" class="editormd-emoji-btn"><i class="fa fa-simplybuilt fa-emoji" title="simplybuilt"></i></a>
							<a href="javascript:;" value=":fa-skyatlas:" title=":fa-skyatlas:" class="editormd-emoji-btn"><i class="fa fa-skyatlas fa-emoji" title="skyatlas"></i></a>
							<a href="javascript:;" value=":fa-cart-plus:" title=":fa-cart-plus:" class="editormd-emoji-btn"><i class="fa fa-cart-plus fa-emoji" title="cart-plus"></i></a>
							<a href="javascript:;" value=":fa-cart-arrow-down:" title=":fa-cart-arrow-down:" class="editormd-emoji-btn"><i class="fa fa-cart-arrow-down fa-emoji" title="cart-arrow-down"></i></a>
							<a href="javascript:;" value=":fa-diamond:" title=":fa-diamond:" class="editormd-emoji-btn"><i class="fa fa-diamond fa-emoji" title="diamond"></i></a>
							<a href="javascript:;" value=":fa-ship:" title=":fa-ship:" class="editormd-emoji-btn"><i class="fa fa-ship fa-emoji" title="ship"></i></a>
							<a href="javascript:;" value=":fa-user-secret:" title=":fa-user-secret:" class="editormd-emoji-btn"><i class="fa fa-user-secret fa-emoji" title="user-secret"></i></a>
							<a href="javascript:;" value=":fa-motorcycle:" title=":fa-motorcycle:" class="editormd-emoji-btn"><i class="fa fa-motorcycle fa-emoji" title="motorcycle"></i></a>
							<a href="javascript:;" value=":fa-street-view:" title=":fa-street-view:" class="editormd-emoji-btn"><i class="fa fa-street-view fa-emoji" title="street-view"></i></a>
							<a href="javascript:;" value=":fa-heartbeat:" title=":fa-heartbeat:" class="editormd-emoji-btn"><i class="fa fa-heartbeat fa-emoji" title="heartbeat"></i></a>
							<a href="javascript:;" value=":fa-venus:" title=":fa-venus:" class="editormd-emoji-btn"><i class="fa fa-venus fa-emoji" title="venus"></i></a>
							<a href="javascript:;" value=":fa-mars:" title=":fa-mars:" class="editormd-emoji-btn"><i class="fa fa-mars fa-emoji" title="mars"></i></a>
							<a href="javascript:;" value=":fa-mercury:" title=":fa-mercury:" class="editormd-emoji-btn"><i class="fa fa-mercury fa-emoji" title="mercury"></i></a>
							<a href="javascript:;" value=":fa-transgender:" title=":fa-transgender:" class="editormd-emoji-btn"><i class="fa fa-transgender fa-emoji" title="transgender"></i></a>
							<a href="javascript:;" value=":fa-transgender-alt:" title=":fa-transgender-alt:" class="editormd-emoji-btn"><i class="fa fa-transgender-alt fa-emoji" title="transgender-alt"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-venus-double:" title=":fa-venus-double:" class="editormd-emoji-btn"><i class="fa fa-venus-double fa-emoji" title="venus-double"></i></a>
							<a href="javascript:;" value=":fa-mars-double:" title=":fa-mars-double:" class="editormd-emoji-btn"><i class="fa fa-mars-double fa-emoji" title="mars-double"></i></a>
							<a href="javascript:;" value=":fa-venus-mars:" title=":fa-venus-mars:" class="editormd-emoji-btn"><i class="fa fa-venus-mars fa-emoji" title="venus-mars"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke:" title=":fa-mars-stroke:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke fa-emoji" title="mars-stroke"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke-v:" title=":fa-mars-stroke-v:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke-v fa-emoji" title="mars-stroke-v"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke-h:" title=":fa-mars-stroke-h:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke-h fa-emoji" title="mars-stroke-h"></i></a>
							<a href="javascript:;" value=":fa-neuter:" title=":fa-neuter:" class="editormd-emoji-btn"><i class="fa fa-neuter fa-emoji" title="neuter"></i></a>
							<a href="javascript:;" value=":fa-facebook-official:" title=":fa-facebook-official:" class="editormd-emoji-btn"><i class="fa fa-facebook-official fa-emoji" title="facebook-official"></i></a>
							<a href="javascript:;" value=":fa-pinterest-p:" title=":fa-pinterest-p:" class="editormd-emoji-btn"><i class="fa fa-pinterest-p fa-emoji" title="pinterest-p"></i></a>
							<a href="javascript:;" value=":fa-whatsapp:" title=":fa-whatsapp:" class="editormd-emoji-btn"><i class="fa fa-whatsapp fa-emoji" title="whatsapp"></i></a>
							<a href="javascript:;" value=":fa-server:" title=":fa-server:" class="editormd-emoji-btn"><i class="fa fa-server fa-emoji" title="server"></i></a>
							<a href="javascript:;" value=":fa-user-plus:" title=":fa-user-plus:" class="editormd-emoji-btn"><i class="fa fa-user-plus fa-emoji" title="user-plus"></i></a>
							<a href="javascript:;" value=":fa-user-times:" title=":fa-user-times:" class="editormd-emoji-btn"><i class="fa fa-user-times fa-emoji" title="user-times"></i></a>
							<a href="javascript:;" value=":fa-bed:" title=":fa-bed:" class="editormd-emoji-btn"><i class="fa fa-bed fa-emoji" title="bed"></i></a>
							<a href="javascript:;" value=":fa-viacoin:" title=":fa-viacoin:" class="editormd-emoji-btn"><i class="fa fa-viacoin fa-emoji" title="viacoin"></i></a>
							<a href="javascript:;" value=":fa-train:" title=":fa-train:" class="editormd-emoji-btn"><i class="fa fa-train fa-emoji" title="train"></i></a>
							<a href="javascript:;" value=":fa-subway:" title=":fa-subway:" class="editormd-emoji-btn"><i class="fa fa-subway fa-emoji" title="subway"></i></a>
							<a href="javascript:;" value=":fa-medium:" title=":fa-medium:" class="editormd-emoji-btn"><i class="fa fa-medium fa-emoji" title="medium"></i></a>
							<a href="javascript:;" value=":fa-GitHub:" title=":fa-GitHub:" class="editormd-emoji-btn"><i class="fa fa-GitHub fa-emoji" title="GitHub"></i></a>
							<a href="javascript:;" value=":fa-bed:" title=":fa-bed:" class="editormd-emoji-btn"><i class="fa fa-bed fa-emoji" title="bed"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-buysellads:" title=":fa-buysellads:" class="editormd-emoji-btn"><i class="fa fa-buysellads fa-emoji" title="buysellads"></i></a>
							<a href="javascript:;" value=":fa-cart-arrow-down:" title=":fa-cart-arrow-down:" class="editormd-emoji-btn"><i class="fa fa-cart-arrow-down fa-emoji" title="cart-arrow-down"></i></a>
							<a href="javascript:;" value=":fa-cart-plus:" title=":fa-cart-plus:" class="editormd-emoji-btn"><i class="fa fa-cart-plus fa-emoji" title="cart-plus"></i></a>
							<a href="javascript:;" value=":fa-connectdevelop:" title=":fa-connectdevelop:" class="editormd-emoji-btn"><i class="fa fa-connectdevelop fa-emoji" title="connectdevelop"></i></a>
							<a href="javascript:;" value=":fa-dashcube:" title=":fa-dashcube:" class="editormd-emoji-btn"><i class="fa fa-dashcube fa-emoji" title="dashcube"></i></a>
							<a href="javascript:;" value=":fa-diamond:" title=":fa-diamond:" class="editormd-emoji-btn"><i class="fa fa-diamond fa-emoji" title="diamond"></i></a>
							<a href="javascript:;" value=":fa-facebook-official:" title=":fa-facebook-official:" class="editormd-emoji-btn"><i class="fa fa-facebook-official fa-emoji" title="facebook-official"></i></a>
							<a href="javascript:;" value=":fa-forumbee:" title=":fa-forumbee:" class="editormd-emoji-btn"><i class="fa fa-forumbee fa-emoji" title="forumbee"></i></a>
							<a href="javascript:;" value=":fa-heartbeat:" title=":fa-heartbeat:" class="editormd-emoji-btn"><i class="fa fa-heartbeat fa-emoji" title="heartbeat"></i></a>
							<a href="javascript:;" value=":fa-hotel:" title=":fa-hotel:" class="editormd-emoji-btn"><i class="fa fa-hotel fa-emoji" title="hotel"></i></a>
							<a href="javascript:;" value=":fa-leanpub:" title=":fa-leanpub:" class="editormd-emoji-btn"><i class="fa fa-leanpub fa-emoji" title="leanpub"></i></a>
							<a href="javascript:;" value=":fa-mars:" title=":fa-mars:" class="editormd-emoji-btn"><i class="fa fa-mars fa-emoji" title="mars"></i></a>
							<a href="javascript:;" value=":fa-mars-double:" title=":fa-mars-double:" class="editormd-emoji-btn"><i class="fa fa-mars-double fa-emoji" title="mars-double"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke:" title=":fa-mars-stroke:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke fa-emoji" title="mars-stroke"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke-h:" title=":fa-mars-stroke-h:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke-h fa-emoji" title="mars-stroke-h"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke-v:" title=":fa-mars-stroke-v:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke-v fa-emoji" title="mars-stroke-v"></i></a>
							<a href="javascript:;" value=":fa-medium:" title=":fa-medium:" class="editormd-emoji-btn"><i class="fa fa-medium fa-emoji" title="medium"></i></a>
							<a href="javascript:;" value=":fa-mercury:" title=":fa-mercury:" class="editormd-emoji-btn"><i class="fa fa-mercury fa-emoji" title="mercury"></i></a>
							<a href="javascript:;" value=":fa-motorcycle:" title=":fa-motorcycle:" class="editormd-emoji-btn"><i class="fa fa-motorcycle fa-emoji" title="motorcycle"></i></a>
							<a href="javascript:;" value=":fa-neuter:" title=":fa-neuter:" class="editormd-emoji-btn"><i class="fa fa-neuter fa-emoji" title="neuter"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-pinterest-p:" title=":fa-pinterest-p:" class="editormd-emoji-btn"><i class="fa fa-pinterest-p fa-emoji" title="pinterest-p"></i></a>
							<a href="javascript:;" value=":fa-sellsy:" title=":fa-sellsy:" class="editormd-emoji-btn"><i class="fa fa-sellsy fa-emoji" title="sellsy"></i></a>
							<a href="javascript:;" value=":fa-server:" title=":fa-server:" class="editormd-emoji-btn"><i class="fa fa-server fa-emoji" title="server"></i></a>
							<a href="javascript:;" value=":fa-ship:" title=":fa-ship:" class="editormd-emoji-btn"><i class="fa fa-ship fa-emoji" title="ship"></i></a>
							<a href="javascript:;" value=":fa-shirtsinbulk:" title=":fa-shirtsinbulk:" class="editormd-emoji-btn"><i class="fa fa-shirtsinbulk fa-emoji" title="shirtsinbulk"></i></a>
							<a href="javascript:;" value=":fa-simplybuilt:" title=":fa-simplybuilt:" class="editormd-emoji-btn"><i class="fa fa-simplybuilt fa-emoji" title="simplybuilt"></i></a>
							<a href="javascript:;" value=":fa-skyatlas:" title=":fa-skyatlas:" class="editormd-emoji-btn"><i class="fa fa-skyatlas fa-emoji" title="skyatlas"></i></a>
							<a href="javascript:;" value=":fa-street-view:" title=":fa-street-view:" class="editormd-emoji-btn"><i class="fa fa-street-view fa-emoji" title="street-view"></i></a>
							<a href="javascript:;" value=":fa-subway:" title=":fa-subway:" class="editormd-emoji-btn"><i class="fa fa-subway fa-emoji" title="subway"></i></a>
							<a href="javascript:;" value=":fa-train:" title=":fa-train:" class="editormd-emoji-btn"><i class="fa fa-train fa-emoji" title="train"></i></a>
							<a href="javascript:;" value=":fa-transgender:" title=":fa-transgender:" class="editormd-emoji-btn"><i class="fa fa-transgender fa-emoji" title="transgender"></i></a>
							<a href="javascript:;" value=":fa-transgender-alt:" title=":fa-transgender-alt:" class="editormd-emoji-btn"><i class="fa fa-transgender-alt fa-emoji" title="transgender-alt"></i></a>
							<a href="javascript:;" value=":fa-user-plus:" title=":fa-user-plus:" class="editormd-emoji-btn"><i class="fa fa-user-plus fa-emoji" title="user-plus"></i></a>
							<a href="javascript:;" value=":fa-user-secret:" title=":fa-user-secret:" class="editormd-emoji-btn"><i class="fa fa-user-secret fa-emoji" title="user-secret"></i></a>
							<a href="javascript:;" value=":fa-user-times:" title=":fa-user-times:" class="editormd-emoji-btn"><i class="fa fa-user-times fa-emoji" title="user-times"></i></a>
							<a href="javascript:;" value=":fa-venus:" title=":fa-venus:" class="editormd-emoji-btn"><i class="fa fa-venus fa-emoji" title="venus"></i></a>
							<a href="javascript:;" value=":fa-venus-double:" title=":fa-venus-double:" class="editormd-emoji-btn"><i class="fa fa-venus-double fa-emoji" title="venus-double"></i></a>
							<a href="javascript:;" value=":fa-venus-mars:" title=":fa-venus-mars:" class="editormd-emoji-btn"><i class="fa fa-venus-mars fa-emoji" title="venus-mars"></i></a>
							<a href="javascript:;" value=":fa-viacoin:" title=":fa-viacoin:" class="editormd-emoji-btn"><i class="fa fa-viacoin fa-emoji" title="viacoin"></i></a>
							<a href="javascript:;" value=":fa-whatsapp:" title=":fa-whatsapp:" class="editormd-emoji-btn"><i class="fa fa-whatsapp fa-emoji" title="whatsapp"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-adjust:" title=":fa-adjust:" class="editormd-emoji-btn"><i class="fa fa-adjust fa-emoji" title="adjust"></i></a>
							<a href="javascript:;" value=":fa-anchor:" title=":fa-anchor:" class="editormd-emoji-btn"><i class="fa fa-anchor fa-emoji" title="anchor"></i></a>
							<a href="javascript:;" value=":fa-archive:" title=":fa-archive:" class="editormd-emoji-btn"><i class="fa fa-archive fa-emoji" title="archive"></i></a>
							<a href="javascript:;" value=":fa-area-chart:" title=":fa-area-chart:" class="editormd-emoji-btn"><i class="fa fa-area-chart fa-emoji" title="area-chart"></i></a>
							<a href="javascript:;" value=":fa-arrows:" title=":fa-arrows:" class="editormd-emoji-btn"><i class="fa fa-arrows fa-emoji" title="arrows"></i></a>
							<a href="javascript:;" value=":fa-arrows-h:" title=":fa-arrows-h:" class="editormd-emoji-btn"><i class="fa fa-arrows-h fa-emoji" title="arrows-h"></i></a>
							<a href="javascript:;" value=":fa-arrows-v:" title=":fa-arrows-v:" class="editormd-emoji-btn"><i class="fa fa-arrows-v fa-emoji" title="arrows-v"></i></a>
							<a href="javascript:;" value=":fa-asterisk:" title=":fa-asterisk:" class="editormd-emoji-btn"><i class="fa fa-asterisk fa-emoji" title="asterisk"></i></a>
							<a href="javascript:;" value=":fa-at:" title=":fa-at:" class="editormd-emoji-btn"><i class="fa fa-at fa-emoji" title="at"></i></a>
							<a href="javascript:;" value=":fa-automobile:" title=":fa-automobile:" class="editormd-emoji-btn"><i class="fa fa-automobile fa-emoji" title="automobile"></i></a>
							<a href="javascript:;" value=":fa-ban:" title=":fa-ban:" class="editormd-emoji-btn"><i class="fa fa-ban fa-emoji" title="ban"></i></a>
							<a href="javascript:;" value=":fa-bank:" title=":fa-bank:" class="editormd-emoji-btn"><i class="fa fa-bank fa-emoji" title="bank"></i></a>
							<a href="javascript:;" value=":fa-bar-chart:" title=":fa-bar-chart:" class="editormd-emoji-btn"><i class="fa fa-bar-chart fa-emoji" title="bar-chart"></i></a>
							<a href="javascript:;" value=":fa-bar-chart-o:" title=":fa-bar-chart-o:" class="editormd-emoji-btn"><i class="fa fa-bar-chart-o fa-emoji" title="bar-chart-o"></i></a>
							<a href="javascript:;" value=":fa-barcode:" title=":fa-barcode:" class="editormd-emoji-btn"><i class="fa fa-barcode fa-emoji" title="barcode"></i></a>
							<a href="javascript:;" value=":fa-bars:" title=":fa-bars:" class="editormd-emoji-btn"><i class="fa fa-bars fa-emoji" title="bars"></i></a>
							<a href="javascript:;" value=":fa-bed:" title=":fa-bed:" class="editormd-emoji-btn"><i class="fa fa-bed fa-emoji" title="bed"></i></a>
							<a href="javascript:;" value=":fa-beer:" title=":fa-beer:" class="editormd-emoji-btn"><i class="fa fa-beer fa-emoji" title="beer"></i></a>
							<a href="javascript:;" value=":fa-bell:" title=":fa-bell:" class="editormd-emoji-btn"><i class="fa fa-bell fa-emoji" title="bell"></i></a>
							<a href="javascript:;" value=":fa-bell-o:" title=":fa-bell-o:" class="editormd-emoji-btn"><i class="fa fa-bell-o fa-emoji" title="bell-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-bell-slash:" title=":fa-bell-slash:" class="editormd-emoji-btn"><i class="fa fa-bell-slash fa-emoji" title="bell-slash"></i></a>
							<a href="javascript:;" value=":fa-bell-slash-o:" title=":fa-bell-slash-o:" class="editormd-emoji-btn"><i class="fa fa-bell-slash-o fa-emoji" title="bell-slash-o"></i></a>
							<a href="javascript:;" value=":fa-bicycle:" title=":fa-bicycle:" class="editormd-emoji-btn"><i class="fa fa-bicycle fa-emoji" title="bicycle"></i></a>
							<a href="javascript:;" value=":fa-binoculars:" title=":fa-binoculars:" class="editormd-emoji-btn"><i class="fa fa-binoculars fa-emoji" title="binoculars"></i></a>
							<a href="javascript:;" value=":fa-birthday-cake:" title=":fa-birthday-cake:" class="editormd-emoji-btn"><i class="fa fa-birthday-cake fa-emoji" title="birthday-cake"></i></a>
							<a href="javascript:;" value=":fa-bolt:" title=":fa-bolt:" class="editormd-emoji-btn"><i class="fa fa-bolt fa-emoji" title="bolt"></i></a>
							<a href="javascript:;" value=":fa-bomb:" title=":fa-bomb:" class="editormd-emoji-btn"><i class="fa fa-bomb fa-emoji" title="bomb"></i></a>
							<a href="javascript:;" value=":fa-book:" title=":fa-book:" class="editormd-emoji-btn"><i class="fa fa-book fa-emoji" title="book"></i></a>
							<a href="javascript:;" value=":fa-bookmark:" title=":fa-bookmark:" class="editormd-emoji-btn"><i class="fa fa-bookmark fa-emoji" title="bookmark"></i></a>
							<a href="javascript:;" value=":fa-bookmark-o:" title=":fa-bookmark-o:" class="editormd-emoji-btn"><i class="fa fa-bookmark-o fa-emoji" title="bookmark-o"></i></a>
							<a href="javascript:;" value=":fa-briefcase:" title=":fa-briefcase:" class="editormd-emoji-btn"><i class="fa fa-briefcase fa-emoji" title="briefcase"></i></a>
							<a href="javascript:;" value=":fa-bug:" title=":fa-bug:" class="editormd-emoji-btn"><i class="fa fa-bug fa-emoji" title="bug"></i></a>
							<a href="javascript:;" value=":fa-building:" title=":fa-building:" class="editormd-emoji-btn"><i class="fa fa-building fa-emoji" title="building"></i></a>
							<a href="javascript:;" value=":fa-building-o:" title=":fa-building-o:" class="editormd-emoji-btn"><i class="fa fa-building-o fa-emoji" title="building-o"></i></a>
							<a href="javascript:;" value=":fa-bullhorn:" title=":fa-bullhorn:" class="editormd-emoji-btn"><i class="fa fa-bullhorn fa-emoji" title="bullhorn"></i></a>
							<a href="javascript:;" value=":fa-bullseye:" title=":fa-bullseye:" class="editormd-emoji-btn"><i class="fa fa-bullseye fa-emoji" title="bullseye"></i></a>
							<a href="javascript:;" value=":fa-bus:" title=":fa-bus:" class="editormd-emoji-btn"><i class="fa fa-bus fa-emoji" title="bus"></i></a>
							<a href="javascript:;" value=":fa-cab:" title=":fa-cab:" class="editormd-emoji-btn"><i class="fa fa-cab fa-emoji" title="cab"></i></a>
							<a href="javascript:;" value=":fa-calculator:" title=":fa-calculator:" class="editormd-emoji-btn"><i class="fa fa-calculator fa-emoji" title="calculator"></i></a>
							<a href="javascript:;" value=":fa-calendar:" title=":fa-calendar:" class="editormd-emoji-btn"><i class="fa fa-calendar fa-emoji" title="calendar"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-calendar-o:" title=":fa-calendar-o:" class="editormd-emoji-btn"><i class="fa fa-calendar-o fa-emoji" title="calendar-o"></i></a>
							<a href="javascript:;" value=":fa-camera:" title=":fa-camera:" class="editormd-emoji-btn"><i class="fa fa-camera fa-emoji" title="camera"></i></a>
							<a href="javascript:;" value=":fa-camera-retro:" title=":fa-camera-retro:" class="editormd-emoji-btn"><i class="fa fa-camera-retro fa-emoji" title="camera-retro"></i></a>
							<a href="javascript:;" value=":fa-car:" title=":fa-car:" class="editormd-emoji-btn"><i class="fa fa-car fa-emoji" title="car"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-down:" title=":fa-caret-square-o-down:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-down fa-emoji" title="caret-square-o-down"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-left:" title=":fa-caret-square-o-left:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-left fa-emoji" title="caret-square-o-left"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-right:" title=":fa-caret-square-o-right:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-right fa-emoji" title="caret-square-o-right"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-up:" title=":fa-caret-square-o-up:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-up fa-emoji" title="caret-square-o-up"></i></a>
							<a href="javascript:;" value=":fa-cart-arrow-down:" title=":fa-cart-arrow-down:" class="editormd-emoji-btn"><i class="fa fa-cart-arrow-down fa-emoji" title="cart-arrow-down"></i></a>
							<a href="javascript:;" value=":fa-cart-plus:" title=":fa-cart-plus:" class="editormd-emoji-btn"><i class="fa fa-cart-plus fa-emoji" title="cart-plus"></i></a>
							<a href="javascript:;" value=":fa-cc:" title=":fa-cc:" class="editormd-emoji-btn"><i class="fa fa-cc fa-emoji" title="cc"></i></a>
							<a href="javascript:;" value=":fa-certificate:" title=":fa-certificate:" class="editormd-emoji-btn"><i class="fa fa-certificate fa-emoji" title="certificate"></i></a>
							<a href="javascript:;" value=":fa-check:" title=":fa-check:" class="editormd-emoji-btn"><i class="fa fa-check fa-emoji" title="check"></i></a>
							<a href="javascript:;" value=":fa-check-circle:" title=":fa-check-circle:" class="editormd-emoji-btn"><i class="fa fa-check-circle fa-emoji" title="check-circle"></i></a>
							<a href="javascript:;" value=":fa-check-circle-o:" title=":fa-check-circle-o:" class="editormd-emoji-btn"><i class="fa fa-check-circle-o fa-emoji" title="check-circle-o"></i></a>
							<a href="javascript:;" value=":fa-check-square:" title=":fa-check-square:" class="editormd-emoji-btn"><i class="fa fa-check-square fa-emoji" title="check-square"></i></a>
							<a href="javascript:;" value=":fa-check-square-o:" title=":fa-check-square-o:" class="editormd-emoji-btn"><i class="fa fa-check-square-o fa-emoji" title="check-square-o"></i></a>
							<a href="javascript:;" value=":fa-child:" title=":fa-child:" class="editormd-emoji-btn"><i class="fa fa-child fa-emoji" title="child"></i></a>
							<a href="javascript:;" value=":fa-circle:" title=":fa-circle:" class="editormd-emoji-btn"><i class="fa fa-circle fa-emoji" title="circle"></i></a>
							<a href="javascript:;" value=":fa-circle-o:" title=":fa-circle-o:" class="editormd-emoji-btn"><i class="fa fa-circle-o fa-emoji" title="circle-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-circle-o-notch:" title=":fa-circle-o-notch:" class="editormd-emoji-btn"><i class="fa fa-circle-o-notch fa-emoji" title="circle-o-notch"></i></a>
							<a href="javascript:;" value=":fa-circle-thin:" title=":fa-circle-thin:" class="editormd-emoji-btn"><i class="fa fa-circle-thin fa-emoji" title="circle-thin"></i></a>
							<a href="javascript:;" value=":fa-clock-o:" title=":fa-clock-o:" class="editormd-emoji-btn"><i class="fa fa-clock-o fa-emoji" title="clock-o"></i></a>
							<a href="javascript:;" value=":fa-close:" title=":fa-close:" class="editormd-emoji-btn"><i class="fa fa-close fa-emoji" title="close"></i></a>
							<a href="javascript:;" value=":fa-cloud:" title=":fa-cloud:" class="editormd-emoji-btn"><i class="fa fa-cloud fa-emoji" title="cloud"></i></a>
							<a href="javascript:;" value=":fa-cloud-download:" title=":fa-cloud-download:" class="editormd-emoji-btn"><i class="fa fa-cloud-download fa-emoji" title="cloud-download"></i></a>
							<a href="javascript:;" value=":fa-cloud-upload:" title=":fa-cloud-upload:" class="editormd-emoji-btn"><i class="fa fa-cloud-upload fa-emoji" title="cloud-upload"></i></a>
							<a href="javascript:;" value=":fa-code:" title=":fa-code:" class="editormd-emoji-btn"><i class="fa fa-code fa-emoji" title="code"></i></a>
							<a href="javascript:;" value=":fa-code-fork:" title=":fa-code-fork:" class="editormd-emoji-btn"><i class="fa fa-code-fork fa-emoji" title="code-fork"></i></a>
							<a href="javascript:;" value=":fa-coffee:" title=":fa-coffee:" class="editormd-emoji-btn"><i class="fa fa-coffee fa-emoji" title="coffee"></i></a>
							<a href="javascript:;" value=":fa-cog:" title=":fa-cog:" class="editormd-emoji-btn"><i class="fa fa-cog fa-emoji" title="cog"></i></a>
							<a href="javascript:;" value=":fa-cogs:" title=":fa-cogs:" class="editormd-emoji-btn"><i class="fa fa-cogs fa-emoji" title="cogs"></i></a>
							<a href="javascript:;" value=":fa-comment:" title=":fa-comment:" class="editormd-emoji-btn"><i class="fa fa-comment fa-emoji" title="comment"></i></a>
							<a href="javascript:;" value=":fa-comment-o:" title=":fa-comment-o:" class="editormd-emoji-btn"><i class="fa fa-comment-o fa-emoji" title="comment-o"></i></a>
							<a href="javascript:;" value=":fa-comments:" title=":fa-comments:" class="editormd-emoji-btn"><i class="fa fa-comments fa-emoji" title="comments"></i></a>
							<a href="javascript:;" value=":fa-comments-o:" title=":fa-comments-o:" class="editormd-emoji-btn"><i class="fa fa-comments-o fa-emoji" title="comments-o"></i></a>
							<a href="javascript:;" value=":fa-compass:" title=":fa-compass:" class="editormd-emoji-btn"><i class="fa fa-compass fa-emoji" title="compass"></i></a>
							<a href="javascript:;" value=":fa-copyright:" title=":fa-copyright:" class="editormd-emoji-btn"><i class="fa fa-copyright fa-emoji" title="copyright"></i></a>
							<a href="javascript:;" value=":fa-credit-card:" title=":fa-credit-card:" class="editormd-emoji-btn"><i class="fa fa-credit-card fa-emoji" title="credit-card"></i></a>
							<a href="javascript:;" value=":fa-crop:" title=":fa-crop:" class="editormd-emoji-btn"><i class="fa fa-crop fa-emoji" title="crop"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-crosshairs:" title=":fa-crosshairs:" class="editormd-emoji-btn"><i class="fa fa-crosshairs fa-emoji" title="crosshairs"></i></a>
							<a href="javascript:;" value=":fa-cube:" title=":fa-cube:" class="editormd-emoji-btn"><i class="fa fa-cube fa-emoji" title="cube"></i></a>
							<a href="javascript:;" value=":fa-cubes:" title=":fa-cubes:" class="editormd-emoji-btn"><i class="fa fa-cubes fa-emoji" title="cubes"></i></a>
							<a href="javascript:;" value=":fa-cutlery:" title=":fa-cutlery:" class="editormd-emoji-btn"><i class="fa fa-cutlery fa-emoji" title="cutlery"></i></a>
							<a href="javascript:;" value=":fa-dashboard:" title=":fa-dashboard:" class="editormd-emoji-btn"><i class="fa fa-dashboard fa-emoji" title="dashboard"></i></a>
							<a href="javascript:;" value=":fa-database:" title=":fa-database:" class="editormd-emoji-btn"><i class="fa fa-database fa-emoji" title="database"></i></a>
							<a href="javascript:;" value=":fa-desktop:" title=":fa-desktop:" class="editormd-emoji-btn"><i class="fa fa-desktop fa-emoji" title="desktop"></i></a>
							<a href="javascript:;" value=":fa-diamond:" title=":fa-diamond:" class="editormd-emoji-btn"><i class="fa fa-diamond fa-emoji" title="diamond"></i></a>
							<a href="javascript:;" value=":fa-dot-circle-o:" title=":fa-dot-circle-o:" class="editormd-emoji-btn"><i class="fa fa-dot-circle-o fa-emoji" title="dot-circle-o"></i></a>
							<a href="javascript:;" value=":fa-download:" title=":fa-download:" class="editormd-emoji-btn"><i class="fa fa-download fa-emoji" title="download"></i></a>
							<a href="javascript:;" value=":fa-edit:" title=":fa-edit:" class="editormd-emoji-btn"><i class="fa fa-edit fa-emoji" title="edit"></i></a>
							<a href="javascript:;" value=":fa-ellipsis-h:" title=":fa-ellipsis-h:" class="editormd-emoji-btn"><i class="fa fa-ellipsis-h fa-emoji" title="ellipsis-h"></i></a>
							<a href="javascript:;" value=":fa-ellipsis-v:" title=":fa-ellipsis-v:" class="editormd-emoji-btn"><i class="fa fa-ellipsis-v fa-emoji" title="ellipsis-v"></i></a>
							<a href="javascript:;" value=":fa-envelope:" title=":fa-envelope:" class="editormd-emoji-btn"><i class="fa fa-envelope fa-emoji" title="envelope"></i></a>
							<a href="javascript:;" value=":fa-envelope-o:" title=":fa-envelope-o:" class="editormd-emoji-btn"><i class="fa fa-envelope-o fa-emoji" title="envelope-o"></i></a>
							<a href="javascript:;" value=":fa-envelope-square:" title=":fa-envelope-square:" class="editormd-emoji-btn"><i class="fa fa-envelope-square fa-emoji" title="envelope-square"></i></a>
							<a href="javascript:;" value=":fa-eraser:" title=":fa-eraser:" class="editormd-emoji-btn"><i class="fa fa-eraser fa-emoji" title="eraser"></i></a>
							<a href="javascript:;" value=":fa-exchange:" title=":fa-exchange:" class="editormd-emoji-btn"><i class="fa fa-exchange fa-emoji" title="exchange"></i></a>
							<a href="javascript:;" value=":fa-exclamation:" title=":fa-exclamation:" class="editormd-emoji-btn"><i class="fa fa-exclamation fa-emoji" title="exclamation"></i></a>
							<a href="javascript:;" value=":fa-exclamation-circle:" title=":fa-exclamation-circle:" class="editormd-emoji-btn"><i class="fa fa-exclamation-circle fa-emoji" title="exclamation-circle"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-exclamation-triangle:" title=":fa-exclamation-triangle:" class="editormd-emoji-btn"><i class="fa fa-exclamation-triangle fa-emoji" title="exclamation-triangle"></i></a>
							<a href="javascript:;" value=":fa-external-link:" title=":fa-external-link:" class="editormd-emoji-btn"><i class="fa fa-external-link fa-emoji" title="external-link"></i></a>
							<a href="javascript:;" value=":fa-external-link-square:" title=":fa-external-link-square:" class="editormd-emoji-btn"><i class="fa fa-external-link-square fa-emoji" title="external-link-square"></i></a>
							<a href="javascript:;" value=":fa-eye:" title=":fa-eye:" class="editormd-emoji-btn"><i class="fa fa-eye fa-emoji" title="eye"></i></a>
							<a href="javascript:;" value=":fa-eye-slash:" title=":fa-eye-slash:" class="editormd-emoji-btn"><i class="fa fa-eye-slash fa-emoji" title="eye-slash"></i></a>
							<a href="javascript:;" value=":fa-eyedropper:" title=":fa-eyedropper:" class="editormd-emoji-btn"><i class="fa fa-eyedropper fa-emoji" title="eyedropper"></i></a>
							<a href="javascript:;" value=":fa-fax:" title=":fa-fax:" class="editormd-emoji-btn"><i class="fa fa-fax fa-emoji" title="fax"></i></a>
							<a href="javascript:;" value=":fa-female:" title=":fa-female:" class="editormd-emoji-btn"><i class="fa fa-female fa-emoji" title="female"></i></a>
							<a href="javascript:;" value=":fa-fighter-jet:" title=":fa-fighter-jet:" class="editormd-emoji-btn"><i class="fa fa-fighter-jet fa-emoji" title="fighter-jet"></i></a>
							<a href="javascript:;" value=":fa-file-archive-o:" title=":fa-file-archive-o:" class="editormd-emoji-btn"><i class="fa fa-file-archive-o fa-emoji" title="file-archive-o"></i></a>
							<a href="javascript:;" value=":fa-file-audio-o:" title=":fa-file-audio-o:" class="editormd-emoji-btn"><i class="fa fa-file-audio-o fa-emoji" title="file-audio-o"></i></a>
							<a href="javascript:;" value=":fa-file-code-o:" title=":fa-file-code-o:" class="editormd-emoji-btn"><i class="fa fa-file-code-o fa-emoji" title="file-code-o"></i></a>
							<a href="javascript:;" value=":fa-file-excel-o:" title=":fa-file-excel-o:" class="editormd-emoji-btn"><i class="fa fa-file-excel-o fa-emoji" title="file-excel-o"></i></a>
							<a href="javascript:;" value=":fa-file-image-o:" title=":fa-file-image-o:" class="editormd-emoji-btn"><i class="fa fa-file-image-o fa-emoji" title="file-image-o"></i></a>
							<a href="javascript:;" value=":fa-file-movie-o:" title=":fa-file-movie-o:" class="editormd-emoji-btn"><i class="fa fa-file-movie-o fa-emoji" title="file-movie-o"></i></a>
							<a href="javascript:;" value=":fa-file-pdf-o:" title=":fa-file-pdf-o:" class="editormd-emoji-btn"><i class="fa fa-file-pdf-o fa-emoji" title="file-pdf-o"></i></a>
							<a href="javascript:;" value=":fa-file-photo-o:" title=":fa-file-photo-o:" class="editormd-emoji-btn"><i class="fa fa-file-photo-o fa-emoji" title="file-photo-o"></i></a>
							<a href="javascript:;" value=":fa-file-picture-o:" title=":fa-file-picture-o:" class="editormd-emoji-btn"><i class="fa fa-file-picture-o fa-emoji" title="file-picture-o"></i></a>
							<a href="javascript:;" value=":fa-file-powerpoint-o:" title=":fa-file-powerpoint-o:" class="editormd-emoji-btn"><i class="fa fa-file-powerpoint-o fa-emoji" title="file-powerpoint-o"></i></a>
							<a href="javascript:;" value=":fa-file-sound-o:" title=":fa-file-sound-o:" class="editormd-emoji-btn"><i class="fa fa-file-sound-o fa-emoji" title="file-sound-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-file-video-o:" title=":fa-file-video-o:" class="editormd-emoji-btn"><i class="fa fa-file-video-o fa-emoji" title="file-video-o"></i></a>
							<a href="javascript:;" value=":fa-file-word-o:" title=":fa-file-word-o:" class="editormd-emoji-btn"><i class="fa fa-file-word-o fa-emoji" title="file-word-o"></i></a>
							<a href="javascript:;" value=":fa-file-zip-o:" title=":fa-file-zip-o:" class="editormd-emoji-btn"><i class="fa fa-file-zip-o fa-emoji" title="file-zip-o"></i></a>
							<a href="javascript:;" value=":fa-film:" title=":fa-film:" class="editormd-emoji-btn"><i class="fa fa-film fa-emoji" title="film"></i></a>
							<a href="javascript:;" value=":fa-filter:" title=":fa-filter:" class="editormd-emoji-btn"><i class="fa fa-filter fa-emoji" title="filter"></i></a>
							<a href="javascript:;" value=":fa-fire:" title=":fa-fire:" class="editormd-emoji-btn"><i class="fa fa-fire fa-emoji" title="fire"></i></a>
							<a href="javascript:;" value=":fa-fire-extinguisher:" title=":fa-fire-extinguisher:" class="editormd-emoji-btn"><i class="fa fa-fire-extinguisher fa-emoji" title="fire-extinguisher"></i></a>
							<a href="javascript:;" value=":fa-flag:" title=":fa-flag:" class="editormd-emoji-btn"><i class="fa fa-flag fa-emoji" title="flag"></i></a>
							<a href="javascript:;" value=":fa-flag-checkered:" title=":fa-flag-checkered:" class="editormd-emoji-btn"><i class="fa fa-flag-checkered fa-emoji" title="flag-checkered"></i></a>
							<a href="javascript:;" value=":fa-flag-o:" title=":fa-flag-o:" class="editormd-emoji-btn"><i class="fa fa-flag-o fa-emoji" title="flag-o"></i></a>
							<a href="javascript:;" value=":fa-flash:" title=":fa-flash:" class="editormd-emoji-btn"><i class="fa fa-flash fa-emoji" title="flash"></i></a>
							<a href="javascript:;" value=":fa-flask:" title=":fa-flask:" class="editormd-emoji-btn"><i class="fa fa-flask fa-emoji" title="flask"></i></a>
							<a href="javascript:;" value=":fa-folder:" title=":fa-folder:" class="editormd-emoji-btn"><i class="fa fa-folder fa-emoji" title="folder"></i></a>
							<a href="javascript:;" value=":fa-folder-o:" title=":fa-folder-o:" class="editormd-emoji-btn"><i class="fa fa-folder-o fa-emoji" title="folder-o"></i></a>
							<a href="javascript:;" value=":fa-folder-open:" title=":fa-folder-open:" class="editormd-emoji-btn"><i class="fa fa-folder-open fa-emoji" title="folder-open"></i></a>
							<a href="javascript:;" value=":fa-folder-open-o:" title=":fa-folder-open-o:" class="editormd-emoji-btn"><i class="fa fa-folder-open-o fa-emoji" title="folder-open-o"></i></a>
							<a href="javascript:;" value=":fa-frown-o:" title=":fa-frown-o:" class="editormd-emoji-btn"><i class="fa fa-frown-o fa-emoji" title="frown-o"></i></a>
							<a href="javascript:;" value=":fa-futbol-o:" title=":fa-futbol-o:" class="editormd-emoji-btn"><i class="fa fa-futbol-o fa-emoji" title="futbol-o"></i></a>
							<a href="javascript:;" value=":fa-gamepad:" title=":fa-gamepad:" class="editormd-emoji-btn"><i class="fa fa-gamepad fa-emoji" title="gamepad"></i></a>
							<a href="javascript:;" value=":fa-gavel:" title=":fa-gavel:" class="editormd-emoji-btn"><i class="fa fa-gavel fa-emoji" title="gavel"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-gear:" title=":fa-gear:" class="editormd-emoji-btn"><i class="fa fa-gear fa-emoji" title="gear"></i></a>
							<a href="javascript:;" value=":fa-gears:" title=":fa-gears:" class="editormd-emoji-btn"><i class="fa fa-gears fa-emoji" title="gears"></i></a>
							<a href="javascript:;" value=":fa-genderless:" title=":fa-genderless:" class="editormd-emoji-btn"><i class="fa fa-genderless fa-emoji" title="genderless"></i></a>
							<a href="javascript:;" value=":fa-gift:" title=":fa-gift:" class="editormd-emoji-btn"><i class="fa fa-gift fa-emoji" title="gift"></i></a>
							<a href="javascript:;" value=":fa-glass:" title=":fa-glass:" class="editormd-emoji-btn"><i class="fa fa-glass fa-emoji" title="glass"></i></a>
							<a href="javascript:;" value=":fa-globe:" title=":fa-globe:" class="editormd-emoji-btn"><i class="fa fa-globe fa-emoji" title="globe"></i></a>
							<a href="javascript:;" value=":fa-graduation-cap:" title=":fa-graduation-cap:" class="editormd-emoji-btn"><i class="fa fa-graduation-cap fa-emoji" title="graduation-cap"></i></a>
							<a href="javascript:;" value=":fa-group:" title=":fa-group:" class="editormd-emoji-btn"><i class="fa fa-group fa-emoji" title="group"></i></a>
							<a href="javascript:;" value=":fa-hdd-o:" title=":fa-hdd-o:" class="editormd-emoji-btn"><i class="fa fa-hdd-o fa-emoji" title="hdd-o"></i></a>
							<a href="javascript:;" value=":fa-headphones:" title=":fa-headphones:" class="editormd-emoji-btn"><i class="fa fa-headphones fa-emoji" title="headphones"></i></a>
							<a href="javascript:;" value=":fa-heart:" title=":fa-heart:" class="editormd-emoji-btn"><i class="fa fa-heart fa-emoji" title="heart"></i></a>
							<a href="javascript:;" value=":fa-heart-o:" title=":fa-heart-o:" class="editormd-emoji-btn"><i class="fa fa-heart-o fa-emoji" title="heart-o"></i></a>
							<a href="javascript:;" value=":fa-heartbeat:" title=":fa-heartbeat:" class="editormd-emoji-btn"><i class="fa fa-heartbeat fa-emoji" title="heartbeat"></i></a>
							<a href="javascript:;" value=":fa-history:" title=":fa-history:" class="editormd-emoji-btn"><i class="fa fa-history fa-emoji" title="history"></i></a>
							<a href="javascript:;" value=":fa-home:" title=":fa-home:" class="editormd-emoji-btn"><i class="fa fa-home fa-emoji" title="home"></i></a>
							<a href="javascript:;" value=":fa-hotel:" title=":fa-hotel:" class="editormd-emoji-btn"><i class="fa fa-hotel fa-emoji" title="hotel"></i></a>
							<a href="javascript:;" value=":fa-image:" title=":fa-image:" class="editormd-emoji-btn"><i class="fa fa-image fa-emoji" title="image"></i></a>
							<a href="javascript:;" value=":fa-inbox:" title=":fa-inbox:" class="editormd-emoji-btn"><i class="fa fa-inbox fa-emoji" title="inbox"></i></a>
							<a href="javascript:;" value=":fa-info:" title=":fa-info:" class="editormd-emoji-btn"><i class="fa fa-info fa-emoji" title="info"></i></a>
							<a href="javascript:;" value=":fa-info-circle:" title=":fa-info-circle:" class="editormd-emoji-btn"><i class="fa fa-info-circle fa-emoji" title="info-circle"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-institution:" title=":fa-institution:" class="editormd-emoji-btn"><i class="fa fa-institution fa-emoji" title="institution"></i></a>
							<a href="javascript:;" value=":fa-key:" title=":fa-key:" class="editormd-emoji-btn"><i class="fa fa-key fa-emoji" title="key"></i></a>
							<a href="javascript:;" value=":fa-keyboard-o:" title=":fa-keyboard-o:" class="editormd-emoji-btn"><i class="fa fa-keyboard-o fa-emoji" title="keyboard-o"></i></a>
							<a href="javascript:;" value=":fa-language:" title=":fa-language:" class="editormd-emoji-btn"><i class="fa fa-language fa-emoji" title="language"></i></a>
							<a href="javascript:;" value=":fa-laptop:" title=":fa-laptop:" class="editormd-emoji-btn"><i class="fa fa-laptop fa-emoji" title="laptop"></i></a>
							<a href="javascript:;" value=":fa-leaf:" title=":fa-leaf:" class="editormd-emoji-btn"><i class="fa fa-leaf fa-emoji" title="leaf"></i></a>
							<a href="javascript:;" value=":fa-legal:" title=":fa-legal:" class="editormd-emoji-btn"><i class="fa fa-legal fa-emoji" title="legal"></i></a>
							<a href="javascript:;" value=":fa-lemon-o:" title=":fa-lemon-o:" class="editormd-emoji-btn"><i class="fa fa-lemon-o fa-emoji" title="lemon-o"></i></a>
							<a href="javascript:;" value=":fa-level-down:" title=":fa-level-down:" class="editormd-emoji-btn"><i class="fa fa-level-down fa-emoji" title="level-down"></i></a>
							<a href="javascript:;" value=":fa-level-up:" title=":fa-level-up:" class="editormd-emoji-btn"><i class="fa fa-level-up fa-emoji" title="level-up"></i></a>
							<a href="javascript:;" value=":fa-life-bouy:" title=":fa-life-bouy:" class="editormd-emoji-btn"><i class="fa fa-life-bouy fa-emoji" title="life-bouy"></i></a>
							<a href="javascript:;" value=":fa-life-buoy:" title=":fa-life-buoy:" class="editormd-emoji-btn"><i class="fa fa-life-buoy fa-emoji" title="life-buoy"></i></a>
							<a href="javascript:;" value=":fa-life-ring:" title=":fa-life-ring:" class="editormd-emoji-btn"><i class="fa fa-life-ring fa-emoji" title="life-ring"></i></a>
							<a href="javascript:;" value=":fa-life-saver:" title=":fa-life-saver:" class="editormd-emoji-btn"><i class="fa fa-life-saver fa-emoji" title="life-saver"></i></a>
							<a href="javascript:;" value=":fa-lightbulb-o:" title=":fa-lightbulb-o:" class="editormd-emoji-btn"><i class="fa fa-lightbulb-o fa-emoji" title="lightbulb-o"></i></a>
							<a href="javascript:;" value=":fa-line-chart:" title=":fa-line-chart:" class="editormd-emoji-btn"><i class="fa fa-line-chart fa-emoji" title="line-chart"></i></a>
							<a href="javascript:;" value=":fa-location-arrow:" title=":fa-location-arrow:" class="editormd-emoji-btn"><i class="fa fa-location-arrow fa-emoji" title="location-arrow"></i></a>
							<a href="javascript:;" value=":fa-lock:" title=":fa-lock:" class="editormd-emoji-btn"><i class="fa fa-lock fa-emoji" title="lock"></i></a>
							<a href="javascript:;" value=":fa-magic:" title=":fa-magic:" class="editormd-emoji-btn"><i class="fa fa-magic fa-emoji" title="magic"></i></a>
							<a href="javascript:;" value=":fa-magnet:" title=":fa-magnet:" class="editormd-emoji-btn"><i class="fa fa-magnet fa-emoji" title="magnet"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-mail-forward:" title=":fa-mail-forward:" class="editormd-emoji-btn"><i class="fa fa-mail-forward fa-emoji" title="mail-forward"></i></a>
							<a href="javascript:;" value=":fa-mail-reply:" title=":fa-mail-reply:" class="editormd-emoji-btn"><i class="fa fa-mail-reply fa-emoji" title="mail-reply"></i></a>
							<a href="javascript:;" value=":fa-mail-reply-all:" title=":fa-mail-reply-all:" class="editormd-emoji-btn"><i class="fa fa-mail-reply-all fa-emoji" title="mail-reply-all"></i></a>
							<a href="javascript:;" value=":fa-male:" title=":fa-male:" class="editormd-emoji-btn"><i class="fa fa-male fa-emoji" title="male"></i></a>
							<a href="javascript:;" value=":fa-map-marker:" title=":fa-map-marker:" class="editormd-emoji-btn"><i class="fa fa-map-marker fa-emoji" title="map-marker"></i></a>
							<a href="javascript:;" value=":fa-meh-o:" title=":fa-meh-o:" class="editormd-emoji-btn"><i class="fa fa-meh-o fa-emoji" title="meh-o"></i></a>
							<a href="javascript:;" value=":fa-microphone:" title=":fa-microphone:" class="editormd-emoji-btn"><i class="fa fa-microphone fa-emoji" title="microphone"></i></a>
							<a href="javascript:;" value=":fa-microphone-slash:" title=":fa-microphone-slash:" class="editormd-emoji-btn"><i class="fa fa-microphone-slash fa-emoji" title="microphone-slash"></i></a>
							<a href="javascript:;" value=":fa-minus:" title=":fa-minus:" class="editormd-emoji-btn"><i class="fa fa-minus fa-emoji" title="minus"></i></a>
							<a href="javascript:;" value=":fa-minus-circle:" title=":fa-minus-circle:" class="editormd-emoji-btn"><i class="fa fa-minus-circle fa-emoji" title="minus-circle"></i></a>
							<a href="javascript:;" value=":fa-minus-square:" title=":fa-minus-square:" class="editormd-emoji-btn"><i class="fa fa-minus-square fa-emoji" title="minus-square"></i></a>
							<a href="javascript:;" value=":fa-minus-square-o:" title=":fa-minus-square-o:" class="editormd-emoji-btn"><i class="fa fa-minus-square-o fa-emoji" title="minus-square-o"></i></a>
							<a href="javascript:;" value=":fa-mobile:" title=":fa-mobile:" class="editormd-emoji-btn"><i class="fa fa-mobile fa-emoji" title="mobile"></i></a>
							<a href="javascript:;" value=":fa-mobile-phone:" title=":fa-mobile-phone:" class="editormd-emoji-btn"><i class="fa fa-mobile-phone fa-emoji" title="mobile-phone"></i></a>
							<a href="javascript:;" value=":fa-money:" title=":fa-money:" class="editormd-emoji-btn"><i class="fa fa-money fa-emoji" title="money"></i></a>
							<a href="javascript:;" value=":fa-moon-o:" title=":fa-moon-o:" class="editormd-emoji-btn"><i class="fa fa-moon-o fa-emoji" title="moon-o"></i></a>
							<a href="javascript:;" value=":fa-mortar-board:" title=":fa-mortar-board:" class="editormd-emoji-btn"><i class="fa fa-mortar-board fa-emoji" title="mortar-board"></i></a>
							<a href="javascript:;" value=":fa-motorcycle:" title=":fa-motorcycle:" class="editormd-emoji-btn"><i class="fa fa-motorcycle fa-emoji" title="motorcycle"></i></a>
							<a href="javascript:;" value=":fa-music:" title=":fa-music:" class="editormd-emoji-btn"><i class="fa fa-music fa-emoji" title="music"></i></a>
							<a href="javascript:;" value=":fa-navicon:" title=":fa-navicon:" class="editormd-emoji-btn"><i class="fa fa-navicon fa-emoji" title="navicon"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-newspaper-o:" title=":fa-newspaper-o:" class="editormd-emoji-btn"><i class="fa fa-newspaper-o fa-emoji" title="newspaper-o"></i></a>
							<a href="javascript:;" value=":fa-paint-brush:" title=":fa-paint-brush:" class="editormd-emoji-btn"><i class="fa fa-paint-brush fa-emoji" title="paint-brush"></i></a>
							<a href="javascript:;" value=":fa-paper-plane:" title=":fa-paper-plane:" class="editormd-emoji-btn"><i class="fa fa-paper-plane fa-emoji" title="paper-plane"></i></a>
							<a href="javascript:;" value=":fa-paper-plane-o:" title=":fa-paper-plane-o:" class="editormd-emoji-btn"><i class="fa fa-paper-plane-o fa-emoji" title="paper-plane-o"></i></a>
							<a href="javascript:;" value=":fa-paw:" title=":fa-paw:" class="editormd-emoji-btn"><i class="fa fa-paw fa-emoji" title="paw"></i></a>
							<a href="javascript:;" value=":fa-pencil:" title=":fa-pencil:" class="editormd-emoji-btn"><i class="fa fa-pencil fa-emoji" title="pencil"></i></a>
							<a href="javascript:;" value=":fa-pencil-square:" title=":fa-pencil-square:" class="editormd-emoji-btn"><i class="fa fa-pencil-square fa-emoji" title="pencil-square"></i></a>
							<a href="javascript:;" value=":fa-pencil-square-o:" title=":fa-pencil-square-o:" class="editormd-emoji-btn"><i class="fa fa-pencil-square-o fa-emoji" title="pencil-square-o"></i></a>
							<a href="javascript:;" value=":fa-phone:" title=":fa-phone:" class="editormd-emoji-btn"><i class="fa fa-phone fa-emoji" title="phone"></i></a>
							<a href="javascript:;" value=":fa-phone-square:" title=":fa-phone-square:" class="editormd-emoji-btn"><i class="fa fa-phone-square fa-emoji" title="phone-square"></i></a>
							<a href="javascript:;" value=":fa-photo:" title=":fa-photo:" class="editormd-emoji-btn"><i class="fa fa-photo fa-emoji" title="photo"></i></a>
							<a href="javascript:;" value=":fa-picture-o:" title=":fa-picture-o:" class="editormd-emoji-btn"><i class="fa fa-picture-o fa-emoji" title="picture-o"></i></a>
							<a href="javascript:;" value=":fa-pie-chart:" title=":fa-pie-chart:" class="editormd-emoji-btn"><i class="fa fa-pie-chart fa-emoji" title="pie-chart"></i></a>
							<a href="javascript:;" value=":fa-plane:" title=":fa-plane:" class="editormd-emoji-btn"><i class="fa fa-plane fa-emoji" title="plane"></i></a>
							<a href="javascript:;" value=":fa-plug:" title=":fa-plug:" class="editormd-emoji-btn"><i class="fa fa-plug fa-emoji" title="plug"></i></a>
							<a href="javascript:;" value=":fa-plus:" title=":fa-plus:" class="editormd-emoji-btn"><i class="fa fa-plus fa-emoji" title="plus"></i></a>
							<a href="javascript:;" value=":fa-plus-circle:" title=":fa-plus-circle:" class="editormd-emoji-btn"><i class="fa fa-plus-circle fa-emoji" title="plus-circle"></i></a>
							<a href="javascript:;" value=":fa-plus-square:" title=":fa-plus-square:" class="editormd-emoji-btn"><i class="fa fa-plus-square fa-emoji" title="plus-square"></i></a>
							<a href="javascript:;" value=":fa-plus-square-o:" title=":fa-plus-square-o:" class="editormd-emoji-btn"><i class="fa fa-plus-square-o fa-emoji" title="plus-square-o"></i></a>
							<a href="javascript:;" value=":fa-power-off:" title=":fa-power-off:" class="editormd-emoji-btn"><i class="fa fa-power-off fa-emoji" title="power-off"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-print:" title=":fa-print:" class="editormd-emoji-btn"><i class="fa fa-print fa-emoji" title="print"></i></a>
							<a href="javascript:;" value=":fa-puzzle-piece:" title=":fa-puzzle-piece:" class="editormd-emoji-btn"><i class="fa fa-puzzle-piece fa-emoji" title="puzzle-piece"></i></a>
							<a href="javascript:;" value=":fa-qrcode:" title=":fa-qrcode:" class="editormd-emoji-btn"><i class="fa fa-qrcode fa-emoji" title="qrcode"></i></a>
							<a href="javascript:;" value=":fa-question:" title=":fa-question:" class="editormd-emoji-btn"><i class="fa fa-question fa-emoji" title="question"></i></a>
							<a href="javascript:;" value=":fa-question-circle:" title=":fa-question-circle:" class="editormd-emoji-btn"><i class="fa fa-question-circle fa-emoji" title="question-circle"></i></a>
							<a href="javascript:;" value=":fa-quote-left:" title=":fa-quote-left:" class="editormd-emoji-btn"><i class="fa fa-quote-left fa-emoji" title="quote-left"></i></a>
							<a href="javascript:;" value=":fa-quote-right:" title=":fa-quote-right:" class="editormd-emoji-btn"><i class="fa fa-quote-right fa-emoji" title="quote-right"></i></a>
							<a href="javascript:;" value=":fa-random:" title=":fa-random:" class="editormd-emoji-btn"><i class="fa fa-random fa-emoji" title="random"></i></a>
							<a href="javascript:;" value=":fa-recycle:" title=":fa-recycle:" class="editormd-emoji-btn"><i class="fa fa-recycle fa-emoji" title="recycle"></i></a>
							<a href="javascript:;" value=":fa-refresh:" title=":fa-refresh:" class="editormd-emoji-btn"><i class="fa fa-refresh fa-emoji" title="refresh"></i></a>
							<a href="javascript:;" value=":fa-remove:" title=":fa-remove:" class="editormd-emoji-btn"><i class="fa fa-remove fa-emoji" title="remove"></i></a>
							<a href="javascript:;" value=":fa-reorder:" title=":fa-reorder:" class="editormd-emoji-btn"><i class="fa fa-reorder fa-emoji" title="reorder"></i></a>
							<a href="javascript:;" value=":fa-reply:" title=":fa-reply:" class="editormd-emoji-btn"><i class="fa fa-reply fa-emoji" title="reply"></i></a>
							<a href="javascript:;" value=":fa-reply-all:" title=":fa-reply-all:" class="editormd-emoji-btn"><i class="fa fa-reply-all fa-emoji" title="reply-all"></i></a>
							<a href="javascript:;" value=":fa-retweet:" title=":fa-retweet:" class="editormd-emoji-btn"><i class="fa fa-retweet fa-emoji" title="retweet"></i></a>
							<a href="javascript:;" value=":fa-road:" title=":fa-road:" class="editormd-emoji-btn"><i class="fa fa-road fa-emoji" title="road"></i></a>
							<a href="javascript:;" value=":fa-rocket:" title=":fa-rocket:" class="editormd-emoji-btn"><i class="fa fa-rocket fa-emoji" title="rocket"></i></a>
							<a href="javascript:;" value=":fa-rss:" title=":fa-rss:" class="editormd-emoji-btn"><i class="fa fa-rss fa-emoji" title="rss"></i></a>
							<a href="javascript:;" value=":fa-rss-square:" title=":fa-rss-square:" class="editormd-emoji-btn"><i class="fa fa-rss-square fa-emoji" title="rss-square"></i></a>
							<a href="javascript:;" value=":fa-search:" title=":fa-search:" class="editormd-emoji-btn"><i class="fa fa-search fa-emoji" title="search"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-search-minus:" title=":fa-search-minus:" class="editormd-emoji-btn"><i class="fa fa-search-minus fa-emoji" title="search-minus"></i></a>
							<a href="javascript:;" value=":fa-search-plus:" title=":fa-search-plus:" class="editormd-emoji-btn"><i class="fa fa-search-plus fa-emoji" title="search-plus"></i></a>
							<a href="javascript:;" value=":fa-send:" title=":fa-send:" class="editormd-emoji-btn"><i class="fa fa-send fa-emoji" title="send"></i></a>
							<a href="javascript:;" value=":fa-send-o:" title=":fa-send-o:" class="editormd-emoji-btn"><i class="fa fa-send-o fa-emoji" title="send-o"></i></a>
							<a href="javascript:;" value=":fa-server:" title=":fa-server:" class="editormd-emoji-btn"><i class="fa fa-server fa-emoji" title="server"></i></a>
							<a href="javascript:;" value=":fa-share:" title=":fa-share:" class="editormd-emoji-btn"><i class="fa fa-share fa-emoji" title="share"></i></a>
							<a href="javascript:;" value=":fa-share-alt:" title=":fa-share-alt:" class="editormd-emoji-btn"><i class="fa fa-share-alt fa-emoji" title="share-alt"></i></a>
							<a href="javascript:;" value=":fa-share-alt-square:" title=":fa-share-alt-square:" class="editormd-emoji-btn"><i class="fa fa-share-alt-square fa-emoji" title="share-alt-square"></i></a>
							<a href="javascript:;" value=":fa-share-square:" title=":fa-share-square:" class="editormd-emoji-btn"><i class="fa fa-share-square fa-emoji" title="share-square"></i></a>
							<a href="javascript:;" value=":fa-share-square-o:" title=":fa-share-square-o:" class="editormd-emoji-btn"><i class="fa fa-share-square-o fa-emoji" title="share-square-o"></i></a>
							<a href="javascript:;" value=":fa-shield:" title=":fa-shield:" class="editormd-emoji-btn"><i class="fa fa-shield fa-emoji" title="shield"></i></a>
							<a href="javascript:;" value=":fa-ship:" title=":fa-ship:" class="editormd-emoji-btn"><i class="fa fa-ship fa-emoji" title="ship"></i></a>
							<a href="javascript:;" value=":fa-shopping-cart:" title=":fa-shopping-cart:" class="editormd-emoji-btn"><i class="fa fa-shopping-cart fa-emoji" title="shopping-cart"></i></a>
							<a href="javascript:;" value=":fa-sign-in:" title=":fa-sign-in:" class="editormd-emoji-btn"><i class="fa fa-sign-in fa-emoji" title="sign-in"></i></a>
							<a href="javascript:;" value=":fa-sign-out:" title=":fa-sign-out:" class="editormd-emoji-btn"><i class="fa fa-sign-out fa-emoji" title="sign-out"></i></a>
							<a href="javascript:;" value=":fa-signal:" title=":fa-signal:" class="editormd-emoji-btn"><i class="fa fa-signal fa-emoji" title="signal"></i></a>
							<a href="javascript:;" value=":fa-sitemap:" title=":fa-sitemap:" class="editormd-emoji-btn"><i class="fa fa-sitemap fa-emoji" title="sitemap"></i></a>
							<a href="javascript:;" value=":fa-sliders:" title=":fa-sliders:" class="editormd-emoji-btn"><i class="fa fa-sliders fa-emoji" title="sliders"></i></a>
							<a href="javascript:;" value=":fa-smile-o:" title=":fa-smile-o:" class="editormd-emoji-btn"><i class="fa fa-smile-o fa-emoji" title="smile-o"></i></a>
							<a href="javascript:;" value=":fa-soccer-ball-o:" title=":fa-soccer-ball-o:" class="editormd-emoji-btn"><i class="fa fa-soccer-ball-o fa-emoji" title="soccer-ball-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-sort:" title=":fa-sort:" class="editormd-emoji-btn"><i class="fa fa-sort fa-emoji" title="sort"></i></a>
							<a href="javascript:;" value=":fa-sort-alpha-asc:" title=":fa-sort-alpha-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-alpha-asc fa-emoji" title="sort-alpha-asc"></i></a>
							<a href="javascript:;" value=":fa-sort-alpha-desc:" title=":fa-sort-alpha-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-alpha-desc fa-emoji" title="sort-alpha-desc"></i></a>
							<a href="javascript:;" value=":fa-sort-amount-asc:" title=":fa-sort-amount-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-amount-asc fa-emoji" title="sort-amount-asc"></i></a>
							<a href="javascript:;" value=":fa-sort-amount-desc:" title=":fa-sort-amount-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-amount-desc fa-emoji" title="sort-amount-desc"></i></a>
							<a href="javascript:;" value=":fa-sort-asc:" title=":fa-sort-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-asc fa-emoji" title="sort-asc"></i></a>
							<a href="javascript:;" value=":fa-sort-desc:" title=":fa-sort-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-desc fa-emoji" title="sort-desc"></i></a>
							<a href="javascript:;" value=":fa-sort-down:" title=":fa-sort-down:" class="editormd-emoji-btn"><i class="fa fa-sort-down fa-emoji" title="sort-down"></i></a>
							<a href="javascript:;" value=":fa-sort-numeric-asc:" title=":fa-sort-numeric-asc:" class="editormd-emoji-btn"><i class="fa fa-sort-numeric-asc fa-emoji" title="sort-numeric-asc"></i></a>
							<a href="javascript:;" value=":fa-sort-numeric-desc:" title=":fa-sort-numeric-desc:" class="editormd-emoji-btn"><i class="fa fa-sort-numeric-desc fa-emoji" title="sort-numeric-desc"></i></a>
							<a href="javascript:;" value=":fa-sort-up:" title=":fa-sort-up:" class="editormd-emoji-btn"><i class="fa fa-sort-up fa-emoji" title="sort-up"></i></a>
							<a href="javascript:;" value=":fa-space-shuttle:" title=":fa-space-shuttle:" class="editormd-emoji-btn"><i class="fa fa-space-shuttle fa-emoji" title="space-shuttle"></i></a>
							<a href="javascript:;" value=":fa-spinner:" title=":fa-spinner:" class="editormd-emoji-btn"><i class="fa fa-spinner fa-emoji" title="spinner"></i></a>
							<a href="javascript:;" value=":fa-spoon:" title=":fa-spoon:" class="editormd-emoji-btn"><i class="fa fa-spoon fa-emoji" title="spoon"></i></a>
							<a href="javascript:;" value=":fa-square:" title=":fa-square:" class="editormd-emoji-btn"><i class="fa fa-square fa-emoji" title="square"></i></a>
							<a href="javascript:;" value=":fa-square-o:" title=":fa-square-o:" class="editormd-emoji-btn"><i class="fa fa-square-o fa-emoji" title="square-o"></i></a>
							<a href="javascript:;" value=":fa-star:" title=":fa-star:" class="editormd-emoji-btn"><i class="fa fa-star fa-emoji" title="star"></i></a>
							<a href="javascript:;" value=":fa-star-half:" title=":fa-star-half:" class="editormd-emoji-btn"><i class="fa fa-star-half fa-emoji" title="star-half"></i></a>
							<a href="javascript:;" value=":fa-star-half-empty:" title=":fa-star-half-empty:" class="editormd-emoji-btn"><i class="fa fa-star-half-empty fa-emoji" title="star-half-empty"></i></a>
							<a href="javascript:;" value=":fa-star-half-full:" title=":fa-star-half-full:" class="editormd-emoji-btn"><i class="fa fa-star-half-full fa-emoji" title="star-half-full"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-star-half-o:" title=":fa-star-half-o:" class="editormd-emoji-btn"><i class="fa fa-star-half-o fa-emoji" title="star-half-o"></i></a>
							<a href="javascript:;" value=":fa-star-o:" title=":fa-star-o:" class="editormd-emoji-btn"><i class="fa fa-star-o fa-emoji" title="star-o"></i></a>
							<a href="javascript:;" value=":fa-street-view:" title=":fa-street-view:" class="editormd-emoji-btn"><i class="fa fa-street-view fa-emoji" title="street-view"></i></a>
							<a href="javascript:;" value=":fa-suitcase:" title=":fa-suitcase:" class="editormd-emoji-btn"><i class="fa fa-suitcase fa-emoji" title="suitcase"></i></a>
							<a href="javascript:;" value=":fa-sun-o:" title=":fa-sun-o:" class="editormd-emoji-btn"><i class="fa fa-sun-o fa-emoji" title="sun-o"></i></a>
							<a href="javascript:;" value=":fa-support:" title=":fa-support:" class="editormd-emoji-btn"><i class="fa fa-support fa-emoji" title="support"></i></a>
							<a href="javascript:;" value=":fa-tablet:" title=":fa-tablet:" class="editormd-emoji-btn"><i class="fa fa-tablet fa-emoji" title="tablet"></i></a>
							<a href="javascript:;" value=":fa-tachometer:" title=":fa-tachometer:" class="editormd-emoji-btn"><i class="fa fa-tachometer fa-emoji" title="tachometer"></i></a>
							<a href="javascript:;" value=":fa-tag:" title=":fa-tag:" class="editormd-emoji-btn"><i class="fa fa-tag fa-emoji" title="tag"></i></a>
							<a href="javascript:;" value=":fa-tags:" title=":fa-tags:" class="editormd-emoji-btn"><i class="fa fa-tags fa-emoji" title="tags"></i></a>
							<a href="javascript:;" value=":fa-tasks:" title=":fa-tasks:" class="editormd-emoji-btn"><i class="fa fa-tasks fa-emoji" title="tasks"></i></a>
							<a href="javascript:;" value=":fa-taxi:" title=":fa-taxi:" class="editormd-emoji-btn"><i class="fa fa-taxi fa-emoji" title="taxi"></i></a>
							<a href="javascript:;" value=":fa-terminal:" title=":fa-terminal:" class="editormd-emoji-btn"><i class="fa fa-terminal fa-emoji" title="terminal"></i></a>
							<a href="javascript:;" value=":fa-thumb-tack:" title=":fa-thumb-tack:" class="editormd-emoji-btn"><i class="fa fa-thumb-tack fa-emoji" title="thumb-tack"></i></a>
							<a href="javascript:;" value=":fa-thumbs-down:" title=":fa-thumbs-down:" class="editormd-emoji-btn"><i class="fa fa-thumbs-down fa-emoji" title="thumbs-down"></i></a>
							<a href="javascript:;" value=":fa-thumbs-o-down:" title=":fa-thumbs-o-down:" class="editormd-emoji-btn"><i class="fa fa-thumbs-o-down fa-emoji" title="thumbs-o-down"></i></a>
							<a href="javascript:;" value=":fa-thumbs-o-up:" title=":fa-thumbs-o-up:" class="editormd-emoji-btn"><i class="fa fa-thumbs-o-up fa-emoji" title="thumbs-o-up"></i></a>
							<a href="javascript:;" value=":fa-thumbs-up:" title=":fa-thumbs-up:" class="editormd-emoji-btn"><i class="fa fa-thumbs-up fa-emoji" title="thumbs-up"></i></a>
							<a href="javascript:;" value=":fa-ticket:" title=":fa-ticket:" class="editormd-emoji-btn"><i class="fa fa-ticket fa-emoji" title="ticket"></i></a>
							<a href="javascript:;" value=":fa-times:" title=":fa-times:" class="editormd-emoji-btn"><i class="fa fa-times fa-emoji" title="times"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-times-circle:" title=":fa-times-circle:" class="editormd-emoji-btn"><i class="fa fa-times-circle fa-emoji" title="times-circle"></i></a>
							<a href="javascript:;" value=":fa-times-circle-o:" title=":fa-times-circle-o:" class="editormd-emoji-btn"><i class="fa fa-times-circle-o fa-emoji" title="times-circle-o"></i></a>
							<a href="javascript:;" value=":fa-tint:" title=":fa-tint:" class="editormd-emoji-btn"><i class="fa fa-tint fa-emoji" title="tint"></i></a>
							<a href="javascript:;" value=":fa-toggle-down:" title=":fa-toggle-down:" class="editormd-emoji-btn"><i class="fa fa-toggle-down fa-emoji" title="toggle-down"></i></a>
							<a href="javascript:;" value=":fa-toggle-left:" title=":fa-toggle-left:" class="editormd-emoji-btn"><i class="fa fa-toggle-left fa-emoji" title="toggle-left"></i></a>
							<a href="javascript:;" value=":fa-toggle-off:" title=":fa-toggle-off:" class="editormd-emoji-btn"><i class="fa fa-toggle-off fa-emoji" title="toggle-off"></i></a>
							<a href="javascript:;" value=":fa-toggle-on:" title=":fa-toggle-on:" class="editormd-emoji-btn"><i class="fa fa-toggle-on fa-emoji" title="toggle-on"></i></a>
							<a href="javascript:;" value=":fa-toggle-right:" title=":fa-toggle-right:" class="editormd-emoji-btn"><i class="fa fa-toggle-right fa-emoji" title="toggle-right"></i></a>
							<a href="javascript:;" value=":fa-toggle-up:" title=":fa-toggle-up:" class="editormd-emoji-btn"><i class="fa fa-toggle-up fa-emoji" title="toggle-up"></i></a>
							<a href="javascript:;" value=":fa-trash:" title=":fa-trash:" class="editormd-emoji-btn"><i class="fa fa-trash fa-emoji" title="trash"></i></a>
							<a href="javascript:;" value=":fa-trash-o:" title=":fa-trash-o:" class="editormd-emoji-btn"><i class="fa fa-trash-o fa-emoji" title="trash-o"></i></a>
							<a href="javascript:;" value=":fa-tree:" title=":fa-tree:" class="editormd-emoji-btn"><i class="fa fa-tree fa-emoji" title="tree"></i></a>
							<a href="javascript:;" value=":fa-trophy:" title=":fa-trophy:" class="editormd-emoji-btn"><i class="fa fa-trophy fa-emoji" title="trophy"></i></a>
							<a href="javascript:;" value=":fa-truck:" title=":fa-truck:" class="editormd-emoji-btn"><i class="fa fa-truck fa-emoji" title="truck"></i></a>
							<a href="javascript:;" value=":fa-tty:" title=":fa-tty:" class="editormd-emoji-btn"><i class="fa fa-tty fa-emoji" title="tty"></i></a>
							<a href="javascript:;" value=":fa-umbrella:" title=":fa-umbrella:" class="editormd-emoji-btn"><i class="fa fa-umbrella fa-emoji" title="umbrella"></i></a>
							<a href="javascript:;" value=":fa-university:" title=":fa-university:" class="editormd-emoji-btn"><i class="fa fa-university fa-emoji" title="university"></i></a>
							<a href="javascript:;" value=":fa-unlock:" title=":fa-unlock:" class="editormd-emoji-btn"><i class="fa fa-unlock fa-emoji" title="unlock"></i></a>
							<a href="javascript:;" value=":fa-unlock-alt:" title=":fa-unlock-alt:" class="editormd-emoji-btn"><i class="fa fa-unlock-alt fa-emoji" title="unlock-alt"></i></a>
							<a href="javascript:;" value=":fa-unsorted:" title=":fa-unsorted:" class="editormd-emoji-btn"><i class="fa fa-unsorted fa-emoji" title="unsorted"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-upload:" title=":fa-upload:" class="editormd-emoji-btn"><i class="fa fa-upload fa-emoji" title="upload"></i></a>
							<a href="javascript:;" value=":fa-user:" title=":fa-user:" class="editormd-emoji-btn"><i class="fa fa-user fa-emoji" title="user"></i></a>
							<a href="javascript:;" value=":fa-user-plus:" title=":fa-user-plus:" class="editormd-emoji-btn"><i class="fa fa-user-plus fa-emoji" title="user-plus"></i></a>
							<a href="javascript:;" value=":fa-user-secret:" title=":fa-user-secret:" class="editormd-emoji-btn"><i class="fa fa-user-secret fa-emoji" title="user-secret"></i></a>
							<a href="javascript:;" value=":fa-user-times:" title=":fa-user-times:" class="editormd-emoji-btn"><i class="fa fa-user-times fa-emoji" title="user-times"></i></a>
							<a href="javascript:;" value=":fa-users:" title=":fa-users:" class="editormd-emoji-btn"><i class="fa fa-users fa-emoji" title="users"></i></a>
							<a href="javascript:;" value=":fa-video-camera:" title=":fa-video-camera:" class="editormd-emoji-btn"><i class="fa fa-video-camera fa-emoji" title="video-camera"></i></a>
							<a href="javascript:;" value=":fa-volume-down:" title=":fa-volume-down:" class="editormd-emoji-btn"><i class="fa fa-volume-down fa-emoji" title="volume-down"></i></a>
							<a href="javascript:;" value=":fa-volume-off:" title=":fa-volume-off:" class="editormd-emoji-btn"><i class="fa fa-volume-off fa-emoji" title="volume-off"></i></a>
							<a href="javascript:;" value=":fa-volume-up:" title=":fa-volume-up:" class="editormd-emoji-btn"><i class="fa fa-volume-up fa-emoji" title="volume-up"></i></a>
							<a href="javascript:;" value=":fa-warning:" title=":fa-warning:" class="editormd-emoji-btn"><i class="fa fa-warning fa-emoji" title="warning"></i></a>
							<a href="javascript:;" value=":fa-wheelchair:" title=":fa-wheelchair:" class="editormd-emoji-btn"><i class="fa fa-wheelchair fa-emoji" title="wheelchair"></i></a>
							<a href="javascript:;" value=":fa-wifi:" title=":fa-wifi:" class="editormd-emoji-btn"><i class="fa fa-wifi fa-emoji" title="wifi"></i></a>
							<a href="javascript:;" value=":fa-wrench:" title=":fa-wrench:" class="editormd-emoji-btn"><i class="fa fa-wrench fa-emoji" title="wrench"></i></a>
							<a href="javascript:;" value=":fa-ambulance:" title=":fa-ambulance:" class="editormd-emoji-btn"><i class="fa fa-ambulance fa-emoji" title="ambulance"></i></a>
							<a href="javascript:;" value=":fa-automobile:" title=":fa-automobile:" class="editormd-emoji-btn"><i class="fa fa-automobile fa-emoji" title="automobile"></i></a>
							<a href="javascript:;" value=":fa-bicycle:" title=":fa-bicycle:" class="editormd-emoji-btn"><i class="fa fa-bicycle fa-emoji" title="bicycle"></i></a>
							<a href="javascript:;" value=":fa-bus:" title=":fa-bus:" class="editormd-emoji-btn"><i class="fa fa-bus fa-emoji" title="bus"></i></a>
							<a href="javascript:;" value=":fa-cab:" title=":fa-cab:" class="editormd-emoji-btn"><i class="fa fa-cab fa-emoji" title="cab"></i></a>
							<a href="javascript:;" value=":fa-car:" title=":fa-car:" class="editormd-emoji-btn"><i class="fa fa-car fa-emoji" title="car"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-fighter-jet:" title=":fa-fighter-jet:" class="editormd-emoji-btn"><i class="fa fa-fighter-jet fa-emoji" title="fighter-jet"></i></a>
							<a href="javascript:;" value=":fa-motorcycle:" title=":fa-motorcycle:" class="editormd-emoji-btn"><i class="fa fa-motorcycle fa-emoji" title="motorcycle"></i></a>
							<a href="javascript:;" value=":fa-plane:" title=":fa-plane:" class="editormd-emoji-btn"><i class="fa fa-plane fa-emoji" title="plane"></i></a>
							<a href="javascript:;" value=":fa-rocket:" title=":fa-rocket:" class="editormd-emoji-btn"><i class="fa fa-rocket fa-emoji" title="rocket"></i></a>
							<a href="javascript:;" value=":fa-ship:" title=":fa-ship:" class="editormd-emoji-btn"><i class="fa fa-ship fa-emoji" title="ship"></i></a>
							<a href="javascript:;" value=":fa-space-shuttle:" title=":fa-space-shuttle:" class="editormd-emoji-btn"><i class="fa fa-space-shuttle fa-emoji" title="space-shuttle"></i></a>
							<a href="javascript:;" value=":fa-subway:" title=":fa-subway:" class="editormd-emoji-btn"><i class="fa fa-subway fa-emoji" title="subway"></i></a>
							<a href="javascript:;" value=":fa-taxi:" title=":fa-taxi:" class="editormd-emoji-btn"><i class="fa fa-taxi fa-emoji" title="taxi"></i></a>
							<a href="javascript:;" value=":fa-train:" title=":fa-train:" class="editormd-emoji-btn"><i class="fa fa-train fa-emoji" title="train"></i></a>
							<a href="javascript:;" value=":fa-truck:" title=":fa-truck:" class="editormd-emoji-btn"><i class="fa fa-truck fa-emoji" title="truck"></i></a>
							<a href="javascript:;" value=":fa-wheelchair:" title=":fa-wheelchair:" class="editormd-emoji-btn"><i class="fa fa-wheelchair fa-emoji" title="wheelchair"></i></a>
							<a href="javascript:;" value=":fa-circle-thin:" title=":fa-circle-thin:" class="editormd-emoji-btn"><i class="fa fa-circle-thin fa-emoji" title="circle-thin"></i></a>
							<a href="javascript:;" value=":fa-genderless:" title=":fa-genderless:" class="editormd-emoji-btn"><i class="fa fa-genderless fa-emoji" title="genderless"></i></a>
							<a href="javascript:;" value=":fa-mars:" title=":fa-mars:" class="editormd-emoji-btn"><i class="fa fa-mars fa-emoji" title="mars"></i></a>
							<a href="javascript:;" value=":fa-mars-double:" title=":fa-mars-double:" class="editormd-emoji-btn"><i class="fa fa-mars-double fa-emoji" title="mars-double"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke:" title=":fa-mars-stroke:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke fa-emoji" title="mars-stroke"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke-h:" title=":fa-mars-stroke-h:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke-h fa-emoji" title="mars-stroke-h"></i></a>
							<a href="javascript:;" value=":fa-mars-stroke-v:" title=":fa-mars-stroke-v:" class="editormd-emoji-btn"><i class="fa fa-mars-stroke-v fa-emoji" title="mars-stroke-v"></i></a>
							<a href="javascript:;" value=":fa-mercury:" title=":fa-mercury:" class="editormd-emoji-btn"><i class="fa fa-mercury fa-emoji" title="mercury"></i></a>
							<a href="javascript:;" value=":fa-neuter:" title=":fa-neuter:" class="editormd-emoji-btn"><i class="fa fa-neuter fa-emoji" title="neuter"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-transgender:" title=":fa-transgender:" class="editormd-emoji-btn"><i class="fa fa-transgender fa-emoji" title="transgender"></i></a>
							<a href="javascript:;" value=":fa-transgender-alt:" title=":fa-transgender-alt:" class="editormd-emoji-btn"><i class="fa fa-transgender-alt fa-emoji" title="transgender-alt"></i></a>
							<a href="javascript:;" value=":fa-venus:" title=":fa-venus:" class="editormd-emoji-btn"><i class="fa fa-venus fa-emoji" title="venus"></i></a>
							<a href="javascript:;" value=":fa-venus-double:" title=":fa-venus-double:" class="editormd-emoji-btn"><i class="fa fa-venus-double fa-emoji" title="venus-double"></i></a>
							<a href="javascript:;" value=":fa-venus-mars:" title=":fa-venus-mars:" class="editormd-emoji-btn"><i class="fa fa-venus-mars fa-emoji" title="venus-mars"></i></a>
							<a href="javascript:;" value=":fa-file:" title=":fa-file:" class="editormd-emoji-btn"><i class="fa fa-file fa-emoji" title="file"></i></a>
							<a href="javascript:;" value=":fa-file-archive-o:" title=":fa-file-archive-o:" class="editormd-emoji-btn"><i class="fa fa-file-archive-o fa-emoji" title="file-archive-o"></i></a>
							<a href="javascript:;" value=":fa-file-audio-o:" title=":fa-file-audio-o:" class="editormd-emoji-btn"><i class="fa fa-file-audio-o fa-emoji" title="file-audio-o"></i></a>
							<a href="javascript:;" value=":fa-file-code-o:" title=":fa-file-code-o:" class="editormd-emoji-btn"><i class="fa fa-file-code-o fa-emoji" title="file-code-o"></i></a>
							<a href="javascript:;" value=":fa-file-excel-o:" title=":fa-file-excel-o:" class="editormd-emoji-btn"><i class="fa fa-file-excel-o fa-emoji" title="file-excel-o"></i></a>
							<a href="javascript:;" value=":fa-file-image-o:" title=":fa-file-image-o:" class="editormd-emoji-btn"><i class="fa fa-file-image-o fa-emoji" title="file-image-o"></i></a>
							<a href="javascript:;" value=":fa-file-movie-o:" title=":fa-file-movie-o:" class="editormd-emoji-btn"><i class="fa fa-file-movie-o fa-emoji" title="file-movie-o"></i></a>
							<a href="javascript:;" value=":fa-file-o:" title=":fa-file-o:" class="editormd-emoji-btn"><i class="fa fa-file-o fa-emoji" title="file-o"></i></a>
							<a href="javascript:;" value=":fa-file-pdf-o:" title=":fa-file-pdf-o:" class="editormd-emoji-btn"><i class="fa fa-file-pdf-o fa-emoji" title="file-pdf-o"></i></a>
							<a href="javascript:;" value=":fa-file-photo-o:" title=":fa-file-photo-o:" class="editormd-emoji-btn"><i class="fa fa-file-photo-o fa-emoji" title="file-photo-o"></i></a>
							<a href="javascript:;" value=":fa-file-picture-o:" title=":fa-file-picture-o:" class="editormd-emoji-btn"><i class="fa fa-file-picture-o fa-emoji" title="file-picture-o"></i></a>
							<a href="javascript:;" value=":fa-file-powerpoint-o:" title=":fa-file-powerpoint-o:" class="editormd-emoji-btn"><i class="fa fa-file-powerpoint-o fa-emoji" title="file-powerpoint-o"></i></a>
							<a href="javascript:;" value=":fa-file-sound-o:" title=":fa-file-sound-o:" class="editormd-emoji-btn"><i class="fa fa-file-sound-o fa-emoji" title="file-sound-o"></i></a>
							<a href="javascript:;" value=":fa-file-text:" title=":fa-file-text:" class="editormd-emoji-btn"><i class="fa fa-file-text fa-emoji" title="file-text"></i></a>
							<a href="javascript:;" value=":fa-file-text-o:" title=":fa-file-text-o:" class="editormd-emoji-btn"><i class="fa fa-file-text-o fa-emoji" title="file-text-o"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-file-video-o:" title=":fa-file-video-o:" class="editormd-emoji-btn"><i class="fa fa-file-video-o fa-emoji" title="file-video-o"></i></a>
							<a href="javascript:;" value=":fa-file-word-o:" title=":fa-file-word-o:" class="editormd-emoji-btn"><i class="fa fa-file-word-o fa-emoji" title="file-word-o"></i></a>
							<a href="javascript:;" value=":fa-file-zip-o:" title=":fa-file-zip-o:" class="editormd-emoji-btn"><i class="fa fa-file-zip-o fa-emoji" title="file-zip-o"></i></a>
							<a href="javascript:;" value=":fa-circle-o-notch:" title=":fa-circle-o-notch:" class="editormd-emoji-btn"><i class="fa fa-circle-o-notch fa-emoji" title="circle-o-notch"></i></a>
							<a href="javascript:;" value=":fa-cog:" title=":fa-cog:" class="editormd-emoji-btn"><i class="fa fa-cog fa-emoji" title="cog"></i></a>
							<a href="javascript:;" value=":fa-gear:" title=":fa-gear:" class="editormd-emoji-btn"><i class="fa fa-gear fa-emoji" title="gear"></i></a>
							<a href="javascript:;" value=":fa-refresh:" title=":fa-refresh:" class="editormd-emoji-btn"><i class="fa fa-refresh fa-emoji" title="refresh"></i></a>
							<a href="javascript:;" value=":fa-spinner:" title=":fa-spinner:" class="editormd-emoji-btn"><i class="fa fa-spinner fa-emoji" title="spinner"></i></a>
							<a href="javascript:;" value=":fa-check-square:" title=":fa-check-square:" class="editormd-emoji-btn"><i class="fa fa-check-square fa-emoji" title="check-square"></i></a>
							<a href="javascript:;" value=":fa-check-square-o:" title=":fa-check-square-o:" class="editormd-emoji-btn"><i class="fa fa-check-square-o fa-emoji" title="check-square-o"></i></a>
							<a href="javascript:;" value=":fa-circle:" title=":fa-circle:" class="editormd-emoji-btn"><i class="fa fa-circle fa-emoji" title="circle"></i></a>
							<a href="javascript:;" value=":fa-circle-o:" title=":fa-circle-o:" class="editormd-emoji-btn"><i class="fa fa-circle-o fa-emoji" title="circle-o"></i></a>
							<a href="javascript:;" value=":fa-dot-circle-o:" title=":fa-dot-circle-o:" class="editormd-emoji-btn"><i class="fa fa-dot-circle-o fa-emoji" title="dot-circle-o"></i></a>
							<a href="javascript:;" value=":fa-minus-square:" title=":fa-minus-square:" class="editormd-emoji-btn"><i class="fa fa-minus-square fa-emoji" title="minus-square"></i></a>
							<a href="javascript:;" value=":fa-minus-square-o:" title=":fa-minus-square-o:" class="editormd-emoji-btn"><i class="fa fa-minus-square-o fa-emoji" title="minus-square-o"></i></a>
							<a href="javascript:;" value=":fa-plus-square:" title=":fa-plus-square:" class="editormd-emoji-btn"><i class="fa fa-plus-square fa-emoji" title="plus-square"></i></a>
							<a href="javascript:;" value=":fa-plus-square-o:" title=":fa-plus-square-o:" class="editormd-emoji-btn"><i class="fa fa-plus-square-o fa-emoji" title="plus-square-o"></i></a>
							<a href="javascript:;" value=":fa-square:" title=":fa-square:" class="editormd-emoji-btn"><i class="fa fa-square fa-emoji" title="square"></i></a>
							<a href="javascript:;" value=":fa-square-o:" title=":fa-square-o:" class="editormd-emoji-btn"><i class="fa fa-square-o fa-emoji" title="square-o"></i></a>
							<a href="javascript:;" value=":fa-cc-amex:" title=":fa-cc-amex:" class="editormd-emoji-btn"><i class="fa fa-cc-amex fa-emoji" title="cc-amex"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-cc-discover:" title=":fa-cc-discover:" class="editormd-emoji-btn"><i class="fa fa-cc-discover fa-emoji" title="cc-discover"></i></a>
							<a href="javascript:;" value=":fa-cc-mastercard:" title=":fa-cc-mastercard:" class="editormd-emoji-btn"><i class="fa fa-cc-mastercard fa-emoji" title="cc-mastercard"></i></a>
							<a href="javascript:;" value=":fa-cc-paypal:" title=":fa-cc-paypal:" class="editormd-emoji-btn"><i class="fa fa-cc-paypal fa-emoji" title="cc-paypal"></i></a>
							<a href="javascript:;" value=":fa-cc-stripe:" title=":fa-cc-stripe:" class="editormd-emoji-btn"><i class="fa fa-cc-stripe fa-emoji" title="cc-stripe"></i></a>
							<a href="javascript:;" value=":fa-cc-visa:" title=":fa-cc-visa:" class="editormd-emoji-btn"><i class="fa fa-cc-visa fa-emoji" title="cc-visa"></i></a>
							<a href="javascript:;" value=":fa-credit-card:" title=":fa-credit-card:" class="editormd-emoji-btn"><i class="fa fa-credit-card fa-emoji" title="credit-card"></i></a>
							<a href="javascript:;" value=":fa-google-wallet:" title=":fa-google-wallet:" class="editormd-emoji-btn"><i class="fa fa-google-wallet fa-emoji" title="google-wallet"></i></a>
							<a href="javascript:;" value=":fa-paypal:" title=":fa-paypal:" class="editormd-emoji-btn"><i class="fa fa-paypal fa-emoji" title="paypal"></i></a>
							<a href="javascript:;" value=":fa-area-chart:" title=":fa-area-chart:" class="editormd-emoji-btn"><i class="fa fa-area-chart fa-emoji" title="area-chart"></i></a>
							<a href="javascript:;" value=":fa-bar-chart:" title=":fa-bar-chart:" class="editormd-emoji-btn"><i class="fa fa-bar-chart fa-emoji" title="bar-chart"></i></a>
							<a href="javascript:;" value=":fa-bar-chart-o:" title=":fa-bar-chart-o:" class="editormd-emoji-btn"><i class="fa fa-bar-chart-o fa-emoji" title="bar-chart-o"></i></a>
							<a href="javascript:;" value=":fa-line-chart:" title=":fa-line-chart:" class="editormd-emoji-btn"><i class="fa fa-line-chart fa-emoji" title="line-chart"></i></a>
							<a href="javascript:;" value=":fa-pie-chart:" title=":fa-pie-chart:" class="editormd-emoji-btn"><i class="fa fa-pie-chart fa-emoji" title="pie-chart"></i></a>
							<a href="javascript:;" value=":fa-bitcoin:" title=":fa-bitcoin:" class="editormd-emoji-btn"><i class="fa fa-bitcoin fa-emoji" title="bitcoin"></i></a>
							<a href="javascript:;" value=":fa-btc:" title=":fa-btc:" class="editormd-emoji-btn"><i class="fa fa-btc fa-emoji" title="btc"></i></a>
							<a href="javascript:;" value=":fa-cny:" title=":fa-cny:" class="editormd-emoji-btn"><i class="fa fa-cny fa-emoji" title="cny"></i></a>
							<a href="javascript:;" value=":fa-dollar:" title=":fa-dollar:" class="editormd-emoji-btn"><i class="fa fa-dollar fa-emoji" title="dollar"></i></a>
							<a href="javascript:;" value=":fa-eur:" title=":fa-eur:" class="editormd-emoji-btn"><i class="fa fa-eur fa-emoji" title="eur"></i></a>
							<a href="javascript:;" value=":fa-euro:" title=":fa-euro:" class="editormd-emoji-btn"><i class="fa fa-euro fa-emoji" title="euro"></i></a>
							<a href="javascript:;" value=":fa-gbp:" title=":fa-gbp:" class="editormd-emoji-btn"><i class="fa fa-gbp fa-emoji" title="gbp"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-ils:" title=":fa-ils:" class="editormd-emoji-btn"><i class="fa fa-ils fa-emoji" title="ils"></i></a>
							<a href="javascript:;" value=":fa-inr:" title=":fa-inr:" class="editormd-emoji-btn"><i class="fa fa-inr fa-emoji" title="inr"></i></a>
							<a href="javascript:;" value=":fa-jpy:" title=":fa-jpy:" class="editormd-emoji-btn"><i class="fa fa-jpy fa-emoji" title="jpy"></i></a>
							<a href="javascript:;" value=":fa-krw:" title=":fa-krw:" class="editormd-emoji-btn"><i class="fa fa-krw fa-emoji" title="krw"></i></a>
							<a href="javascript:;" value=":fa-money:" title=":fa-money:" class="editormd-emoji-btn"><i class="fa fa-money fa-emoji" title="money"></i></a>
							<a href="javascript:;" value=":fa-rmb:" title=":fa-rmb:" class="editormd-emoji-btn"><i class="fa fa-rmb fa-emoji" title="rmb"></i></a>
							<a href="javascript:;" value=":fa-rouble:" title=":fa-rouble:" class="editormd-emoji-btn"><i class="fa fa-rouble fa-emoji" title="rouble"></i></a>
							<a href="javascript:;" value=":fa-rub:" title=":fa-rub:" class="editormd-emoji-btn"><i class="fa fa-rub fa-emoji" title="rub"></i></a>
							<a href="javascript:;" value=":fa-ruble:" title=":fa-ruble:" class="editormd-emoji-btn"><i class="fa fa-ruble fa-emoji" title="ruble"></i></a>
							<a href="javascript:;" value=":fa-rupee:" title=":fa-rupee:" class="editormd-emoji-btn"><i class="fa fa-rupee fa-emoji" title="rupee"></i></a>
							<a href="javascript:;" value=":fa-shekel:" title=":fa-shekel:" class="editormd-emoji-btn"><i class="fa fa-shekel fa-emoji" title="shekel"></i></a>
							<a href="javascript:;" value=":fa-sheqel:" title=":fa-sheqel:" class="editormd-emoji-btn"><i class="fa fa-sheqel fa-emoji" title="sheqel"></i></a>
							<a href="javascript:;" value=":fa-try:" title=":fa-try:" class="editormd-emoji-btn"><i class="fa fa-try fa-emoji" title="try"></i></a>
							<a href="javascript:;" value=":fa-turkish-lira:" title=":fa-turkish-lira:" class="editormd-emoji-btn"><i class="fa fa-turkish-lira fa-emoji" title="turkish-lira"></i></a>
							<a href="javascript:;" value=":fa-usd:" title=":fa-usd:" class="editormd-emoji-btn"><i class="fa fa-usd fa-emoji" title="usd"></i></a>
							<a href="javascript:;" value=":fa-won:" title=":fa-won:" class="editormd-emoji-btn"><i class="fa fa-won fa-emoji" title="won"></i></a>
							<a href="javascript:;" value=":fa-yen:" title=":fa-yen:" class="editormd-emoji-btn"><i class="fa fa-yen fa-emoji" title="yen"></i></a>
							<a href="javascript:;" value=":fa-align-center:" title=":fa-align-center:" class="editormd-emoji-btn"><i class="fa fa-align-center fa-emoji" title="align-center"></i></a>
							<a href="javascript:;" value=":fa-align-justify:" title=":fa-align-justify:" class="editormd-emoji-btn"><i class="fa fa-align-justify fa-emoji" title="align-justify"></i></a>
							<a href="javascript:;" value=":fa-align-left:" title=":fa-align-left:" class="editormd-emoji-btn"><i class="fa fa-align-left fa-emoji" title="align-left"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-align-right:" title=":fa-align-right:" class="editormd-emoji-btn"><i class="fa fa-align-right fa-emoji" title="align-right"></i></a>
							<a href="javascript:;" value=":fa-bold:" title=":fa-bold:" class="editormd-emoji-btn"><i class="fa fa-bold fa-emoji" title="bold"></i></a>
							<a href="javascript:;" value=":fa-chain:" title=":fa-chain:" class="editormd-emoji-btn"><i class="fa fa-chain fa-emoji" title="chain"></i></a>
							<a href="javascript:;" value=":fa-chain-broken:" title=":fa-chain-broken:" class="editormd-emoji-btn"><i class="fa fa-chain-broken fa-emoji" title="chain-broken"></i></a>
							<a href="javascript:;" value=":fa-clipboard:" title=":fa-clipboard:" class="editormd-emoji-btn"><i class="fa fa-clipboard fa-emoji" title="clipboard"></i></a>
							<a href="javascript:;" value=":fa-columns:" title=":fa-columns:" class="editormd-emoji-btn"><i class="fa fa-columns fa-emoji" title="columns"></i></a>
							<a href="javascript:;" value=":fa-copy:" title=":fa-copy:" class="editormd-emoji-btn"><i class="fa fa-copy fa-emoji" title="copy"></i></a>
							<a href="javascript:;" value=":fa-cut:" title=":fa-cut:" class="editormd-emoji-btn"><i class="fa fa-cut fa-emoji" title="cut"></i></a>
							<a href="javascript:;" value=":fa-dedent:" title=":fa-dedent:" class="editormd-emoji-btn"><i class="fa fa-dedent fa-emoji" title="dedent"></i></a>
							<a href="javascript:;" value=":fa-eraser:" title=":fa-eraser:" class="editormd-emoji-btn"><i class="fa fa-eraser fa-emoji" title="eraser"></i></a>
							<a href="javascript:;" value=":fa-file:" title=":fa-file:" class="editormd-emoji-btn"><i class="fa fa-file fa-emoji" title="file"></i></a>
							<a href="javascript:;" value=":fa-file-o:" title=":fa-file-o:" class="editormd-emoji-btn"><i class="fa fa-file-o fa-emoji" title="file-o"></i></a>
							<a href="javascript:;" value=":fa-file-text:" title=":fa-file-text:" class="editormd-emoji-btn"><i class="fa fa-file-text fa-emoji" title="file-text"></i></a>
							<a href="javascript:;" value=":fa-file-text-o:" title=":fa-file-text-o:" class="editormd-emoji-btn"><i class="fa fa-file-text-o fa-emoji" title="file-text-o"></i></a>
							<a href="javascript:;" value=":fa-files-o:" title=":fa-files-o:" class="editormd-emoji-btn"><i class="fa fa-files-o fa-emoji" title="files-o"></i></a>
							<a href="javascript:;" value=":fa-floppy-o:" title=":fa-floppy-o:" class="editormd-emoji-btn"><i class="fa fa-floppy-o fa-emoji" title="floppy-o"></i></a>
							<a href="javascript:;" value=":fa-font:" title=":fa-font:" class="editormd-emoji-btn"><i class="fa fa-font fa-emoji" title="font"></i></a>
							<a href="javascript:;" value=":fa-header:" title=":fa-header:" class="editormd-emoji-btn"><i class="fa fa-header fa-emoji" title="header"></i></a>
							<a href="javascript:;" value=":fa-indent:" title=":fa-indent:" class="editormd-emoji-btn"><i class="fa fa-indent fa-emoji" title="indent"></i></a>
							<a href="javascript:;" value=":fa-italic:" title=":fa-italic:" class="editormd-emoji-btn"><i class="fa fa-italic fa-emoji" title="italic"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-link:" title=":fa-link:" class="editormd-emoji-btn"><i class="fa fa-link fa-emoji" title="link"></i></a>
							<a href="javascript:;" value=":fa-list:" title=":fa-list:" class="editormd-emoji-btn"><i class="fa fa-list fa-emoji" title="list"></i></a>
							<a href="javascript:;" value=":fa-list-alt:" title=":fa-list-alt:" class="editormd-emoji-btn"><i class="fa fa-list-alt fa-emoji" title="list-alt"></i></a>
							<a href="javascript:;" value=":fa-list-ol:" title=":fa-list-ol:" class="editormd-emoji-btn"><i class="fa fa-list-ol fa-emoji" title="list-ol"></i></a>
							<a href="javascript:;" value=":fa-list-ul:" title=":fa-list-ul:" class="editormd-emoji-btn"><i class="fa fa-list-ul fa-emoji" title="list-ul"></i></a>
							<a href="javascript:;" value=":fa-outdent:" title=":fa-outdent:" class="editormd-emoji-btn"><i class="fa fa-outdent fa-emoji" title="outdent"></i></a>
							<a href="javascript:;" value=":fa-paperclip:" title=":fa-paperclip:" class="editormd-emoji-btn"><i class="fa fa-paperclip fa-emoji" title="paperclip"></i></a>
							<a href="javascript:;" value=":fa-paragraph:" title=":fa-paragraph:" class="editormd-emoji-btn"><i class="fa fa-paragraph fa-emoji" title="paragraph"></i></a>
							<a href="javascript:;" value=":fa-paste:" title=":fa-paste:" class="editormd-emoji-btn"><i class="fa fa-paste fa-emoji" title="paste"></i></a>
							<a href="javascript:;" value=":fa-repeat:" title=":fa-repeat:" class="editormd-emoji-btn"><i class="fa fa-repeat fa-emoji" title="repeat"></i></a>
							<a href="javascript:;" value=":fa-rotate-left:" title=":fa-rotate-left:" class="editormd-emoji-btn"><i class="fa fa-rotate-left fa-emoji" title="rotate-left"></i></a>
							<a href="javascript:;" value=":fa-rotate-right:" title=":fa-rotate-right:" class="editormd-emoji-btn"><i class="fa fa-rotate-right fa-emoji" title="rotate-right"></i></a>
							<a href="javascript:;" value=":fa-save:" title=":fa-save:" class="editormd-emoji-btn"><i class="fa fa-save fa-emoji" title="save"></i></a>
							<a href="javascript:;" value=":fa-scissors:" title=":fa-scissors:" class="editormd-emoji-btn"><i class="fa fa-scissors fa-emoji" title="scissors"></i></a>
							<a href="javascript:;" value=":fa-strikethrough:" title=":fa-strikethrough:" class="editormd-emoji-btn"><i class="fa fa-strikethrough fa-emoji" title="strikethrough"></i></a>
							<a href="javascript:;" value=":fa-subscript:" title=":fa-subscript:" class="editormd-emoji-btn"><i class="fa fa-subscript fa-emoji" title="subscript"></i></a>
							<a href="javascript:;" value=":fa-superscript:" title=":fa-superscript:" class="editormd-emoji-btn"><i class="fa fa-superscript fa-emoji" title="superscript"></i></a>
							<a href="javascript:;" value=":fa-table:" title=":fa-table:" class="editormd-emoji-btn"><i class="fa fa-table fa-emoji" title="table"></i></a>
							<a href="javascript:;" value=":fa-text-height:" title=":fa-text-height:" class="editormd-emoji-btn"><i class="fa fa-text-height fa-emoji" title="text-height"></i></a>
							<a href="javascript:;" value=":fa-text-width:" title=":fa-text-width:" class="editormd-emoji-btn"><i class="fa fa-text-width fa-emoji" title="text-width"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-th:" title=":fa-th:" class="editormd-emoji-btn"><i class="fa fa-th fa-emoji" title="th"></i></a>
							<a href="javascript:;" value=":fa-th-large:" title=":fa-th-large:" class="editormd-emoji-btn"><i class="fa fa-th-large fa-emoji" title="th-large"></i></a>
							<a href="javascript:;" value=":fa-th-list:" title=":fa-th-list:" class="editormd-emoji-btn"><i class="fa fa-th-list fa-emoji" title="th-list"></i></a>
							<a href="javascript:;" value=":fa-underline:" title=":fa-underline:" class="editormd-emoji-btn"><i class="fa fa-underline fa-emoji" title="underline"></i></a>
							<a href="javascript:;" value=":fa-undo:" title=":fa-undo:" class="editormd-emoji-btn"><i class="fa fa-undo fa-emoji" title="undo"></i></a>
							<a href="javascript:;" value=":fa-unlink:" title=":fa-unlink:" class="editormd-emoji-btn"><i class="fa fa-unlink fa-emoji" title="unlink"></i></a>
							<a href="javascript:;" value=":fa-angle-double-down:" title=":fa-angle-double-down:" class="editormd-emoji-btn"><i class="fa fa-angle-double-down fa-emoji" title="angle-double-down"></i></a>
							<a href="javascript:;" value=":fa-angle-double-left:" title=":fa-angle-double-left:" class="editormd-emoji-btn"><i class="fa fa-angle-double-left fa-emoji" title="angle-double-left"></i></a>
							<a href="javascript:;" value=":fa-angle-double-right:" title=":fa-angle-double-right:" class="editormd-emoji-btn"><i class="fa fa-angle-double-right fa-emoji" title="angle-double-right"></i></a>
							<a href="javascript:;" value=":fa-angle-double-up:" title=":fa-angle-double-up:" class="editormd-emoji-btn"><i class="fa fa-angle-double-up fa-emoji" title="angle-double-up"></i></a>
							<a href="javascript:;" value=":fa-angle-down:" title=":fa-angle-down:" class="editormd-emoji-btn"><i class="fa fa-angle-down fa-emoji" title="angle-down"></i></a>
							<a href="javascript:;" value=":fa-angle-left:" title=":fa-angle-left:" class="editormd-emoji-btn"><i class="fa fa-angle-left fa-emoji" title="angle-left"></i></a>
							<a href="javascript:;" value=":fa-angle-right:" title=":fa-angle-right:" class="editormd-emoji-btn"><i class="fa fa-angle-right fa-emoji" title="angle-right"></i></a>
							<a href="javascript:;" value=":fa-angle-up:" title=":fa-angle-up:" class="editormd-emoji-btn"><i class="fa fa-angle-up fa-emoji" title="angle-up"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-down:" title=":fa-arrow-circle-down:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-down fa-emoji" title="arrow-circle-down"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-left:" title=":fa-arrow-circle-left:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-left fa-emoji" title="arrow-circle-left"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-o-down:" title=":fa-arrow-circle-o-down:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-down fa-emoji" title="arrow-circle-o-down"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-o-left:" title=":fa-arrow-circle-o-left:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-left fa-emoji" title="arrow-circle-o-left"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-o-right:" title=":fa-arrow-circle-o-right:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-right fa-emoji" title="arrow-circle-o-right"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-o-up:" title=":fa-arrow-circle-o-up:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-o-up fa-emoji" title="arrow-circle-o-up"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-arrow-circle-right:" title=":fa-arrow-circle-right:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-right fa-emoji" title="arrow-circle-right"></i></a>
							<a href="javascript:;" value=":fa-arrow-circle-up:" title=":fa-arrow-circle-up:" class="editormd-emoji-btn"><i class="fa fa-arrow-circle-up fa-emoji" title="arrow-circle-up"></i></a>
							<a href="javascript:;" value=":fa-arrow-down:" title=":fa-arrow-down:" class="editormd-emoji-btn"><i class="fa fa-arrow-down fa-emoji" title="arrow-down"></i></a>
							<a href="javascript:;" value=":fa-arrow-left:" title=":fa-arrow-left:" class="editormd-emoji-btn"><i class="fa fa-arrow-left fa-emoji" title="arrow-left"></i></a>
							<a href="javascript:;" value=":fa-arrow-right:" title=":fa-arrow-right:" class="editormd-emoji-btn"><i class="fa fa-arrow-right fa-emoji" title="arrow-right"></i></a>
							<a href="javascript:;" value=":fa-arrow-up:" title=":fa-arrow-up:" class="editormd-emoji-btn"><i class="fa fa-arrow-up fa-emoji" title="arrow-up"></i></a>
							<a href="javascript:;" value=":fa-arrows:" title=":fa-arrows:" class="editormd-emoji-btn"><i class="fa fa-arrows fa-emoji" title="arrows"></i></a>
							<a href="javascript:;" value=":fa-arrows-alt:" title=":fa-arrows-alt:" class="editormd-emoji-btn"><i class="fa fa-arrows-alt fa-emoji" title="arrows-alt"></i></a>
							<a href="javascript:;" value=":fa-arrows-h:" title=":fa-arrows-h:" class="editormd-emoji-btn"><i class="fa fa-arrows-h fa-emoji" title="arrows-h"></i></a>
							<a href="javascript:;" value=":fa-arrows-v:" title=":fa-arrows-v:" class="editormd-emoji-btn"><i class="fa fa-arrows-v fa-emoji" title="arrows-v"></i></a>
							<a href="javascript:;" value=":fa-caret-down:" title=":fa-caret-down:" class="editormd-emoji-btn"><i class="fa fa-caret-down fa-emoji" title="caret-down"></i></a>
							<a href="javascript:;" value=":fa-caret-left:" title=":fa-caret-left:" class="editormd-emoji-btn"><i class="fa fa-caret-left fa-emoji" title="caret-left"></i></a>
							<a href="javascript:;" value=":fa-caret-right:" title=":fa-caret-right:" class="editormd-emoji-btn"><i class="fa fa-caret-right fa-emoji" title="caret-right"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-down:" title=":fa-caret-square-o-down:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-down fa-emoji" title="caret-square-o-down"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-left:" title=":fa-caret-square-o-left:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-left fa-emoji" title="caret-square-o-left"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-right:" title=":fa-caret-square-o-right:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-right fa-emoji" title="caret-square-o-right"></i></a>
							<a href="javascript:;" value=":fa-caret-square-o-up:" title=":fa-caret-square-o-up:" class="editormd-emoji-btn"><i class="fa fa-caret-square-o-up fa-emoji" title="caret-square-o-up"></i></a>
							<a href="javascript:;" value=":fa-caret-up:" title=":fa-caret-up:" class="editormd-emoji-btn"><i class="fa fa-caret-up fa-emoji" title="caret-up"></i></a>
							<a href="javascript:;" value=":fa-chevron-circle-down:" title=":fa-chevron-circle-down:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-down fa-emoji" title="chevron-circle-down"></i></a>
							<a href="javascript:;" value=":fa-chevron-circle-left:" title=":fa-chevron-circle-left:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-left fa-emoji" title="chevron-circle-left"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-chevron-circle-right:" title=":fa-chevron-circle-right:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-right fa-emoji" title="chevron-circle-right"></i></a>
							<a href="javascript:;" value=":fa-chevron-circle-up:" title=":fa-chevron-circle-up:" class="editormd-emoji-btn"><i class="fa fa-chevron-circle-up fa-emoji" title="chevron-circle-up"></i></a>
							<a href="javascript:;" value=":fa-chevron-down:" title=":fa-chevron-down:" class="editormd-emoji-btn"><i class="fa fa-chevron-down fa-emoji" title="chevron-down"></i></a>
							<a href="javascript:;" value=":fa-chevron-left:" title=":fa-chevron-left:" class="editormd-emoji-btn"><i class="fa fa-chevron-left fa-emoji" title="chevron-left"></i></a>
							<a href="javascript:;" value=":fa-chevron-right:" title=":fa-chevron-right:" class="editormd-emoji-btn"><i class="fa fa-chevron-right fa-emoji" title="chevron-right"></i></a>
							<a href="javascript:;" value=":fa-chevron-up:" title=":fa-chevron-up:" class="editormd-emoji-btn"><i class="fa fa-chevron-up fa-emoji" title="chevron-up"></i></a>
							<a href="javascript:;" value=":fa-hand-o-down:" title=":fa-hand-o-down:" class="editormd-emoji-btn"><i class="fa fa-hand-o-down fa-emoji" title="hand-o-down"></i></a>
							<a href="javascript:;" value=":fa-hand-o-left:" title=":fa-hand-o-left:" class="editormd-emoji-btn"><i class="fa fa-hand-o-left fa-emoji" title="hand-o-left"></i></a>
							<a href="javascript:;" value=":fa-hand-o-right:" title=":fa-hand-o-right:" class="editormd-emoji-btn"><i class="fa fa-hand-o-right fa-emoji" title="hand-o-right"></i></a>
							<a href="javascript:;" value=":fa-hand-o-up:" title=":fa-hand-o-up:" class="editormd-emoji-btn"><i class="fa fa-hand-o-up fa-emoji" title="hand-o-up"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-down:" title=":fa-long-arrow-down:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-down fa-emoji" title="long-arrow-down"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-left:" title=":fa-long-arrow-left:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-left fa-emoji" title="long-arrow-left"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-right:" title=":fa-long-arrow-right:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-right fa-emoji" title="long-arrow-right"></i></a>
							<a href="javascript:;" value=":fa-long-arrow-up:" title=":fa-long-arrow-up:" class="editormd-emoji-btn"><i class="fa fa-long-arrow-up fa-emoji" title="long-arrow-up"></i></a>
							<a href="javascript:;" value=":fa-toggle-down:" title=":fa-toggle-down:" class="editormd-emoji-btn"><i class="fa fa-toggle-down fa-emoji" title="toggle-down"></i></a>
							<a href="javascript:;" value=":fa-toggle-left:" title=":fa-toggle-left:" class="editormd-emoji-btn"><i class="fa fa-toggle-left fa-emoji" title="toggle-left"></i></a>
							<a href="javascript:;" value=":fa-toggle-right:" title=":fa-toggle-right:" class="editormd-emoji-btn"><i class="fa fa-toggle-right fa-emoji" title="toggle-right"></i></a>
							<a href="javascript:;" value=":fa-toggle-up:" title=":fa-toggle-up:" class="editormd-emoji-btn"><i class="fa fa-toggle-up fa-emoji" title="toggle-up"></i></a>
							<a href="javascript:;" value=":fa-arrows-alt:" title=":fa-arrows-alt:" class="editormd-emoji-btn"><i class="fa fa-arrows-alt fa-emoji" title="arrows-alt"></i></a>
							<a href="javascript:;" value=":fa-backward:" title=":fa-backward:" class="editormd-emoji-btn"><i class="fa fa-backward fa-emoji" title="backward"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-compress:" title=":fa-compress:" class="editormd-emoji-btn"><i class="fa fa-compress fa-emoji" title="compress"></i></a>
							<a href="javascript:;" value=":fa-eject:" title=":fa-eject:" class="editormd-emoji-btn"><i class="fa fa-eject fa-emoji" title="eject"></i></a>
							<a href="javascript:;" value=":fa-expand:" title=":fa-expand:" class="editormd-emoji-btn"><i class="fa fa-expand fa-emoji" title="expand"></i></a>
							<a href="javascript:;" value=":fa-fast-backward:" title=":fa-fast-backward:" class="editormd-emoji-btn"><i class="fa fa-fast-backward fa-emoji" title="fast-backward"></i></a>
							<a href="javascript:;" value=":fa-fast-forward:" title=":fa-fast-forward:" class="editormd-emoji-btn"><i class="fa fa-fast-forward fa-emoji" title="fast-forward"></i></a>
							<a href="javascript:;" value=":fa-forward:" title=":fa-forward:" class="editormd-emoji-btn"><i class="fa fa-forward fa-emoji" title="forward"></i></a>
							<a href="javascript:;" value=":fa-pause:" title=":fa-pause:" class="editormd-emoji-btn"><i class="fa fa-pause fa-emoji" title="pause"></i></a>
							<a href="javascript:;" value=":fa-play:" title=":fa-play:" class="editormd-emoji-btn"><i class="fa fa-play fa-emoji" title="play"></i></a>
							<a href="javascript:;" value=":fa-play-circle:" title=":fa-play-circle:" class="editormd-emoji-btn"><i class="fa fa-play-circle fa-emoji" title="play-circle"></i></a>
							<a href="javascript:;" value=":fa-play-circle-o:" title=":fa-play-circle-o:" class="editormd-emoji-btn"><i class="fa fa-play-circle-o fa-emoji" title="play-circle-o"></i></a>
							<a href="javascript:;" value=":fa-step-backward:" title=":fa-step-backward:" class="editormd-emoji-btn"><i class="fa fa-step-backward fa-emoji" title="step-backward"></i></a>
							<a href="javascript:;" value=":fa-step-forward:" title=":fa-step-forward:" class="editormd-emoji-btn"><i class="fa fa-step-forward fa-emoji" title="step-forward"></i></a>
							<a href="javascript:;" value=":fa-stop:" title=":fa-stop:" class="editormd-emoji-btn"><i class="fa fa-stop fa-emoji" title="stop"></i></a>
							<a href="javascript:;" value=":fa-youtube-play:" title=":fa-youtube-play:" class="editormd-emoji-btn"><i class="fa fa-youtube-play fa-emoji" title="youtube-play"></i></a>
							<a href="javascript:;" value=":fa-report an issue with Adblock Plus:" title=":fa-report an issue with Adblock Plus:" class="editormd-emoji-btn"><i class="fa fa-report an issue with Adblock Plus fa-emoji" title="report an issue with Adblock Plus"></i></a>
							<a href="javascript:;" value=":fa-adn:" title=":fa-adn:" class="editormd-emoji-btn"><i class="fa fa-adn fa-emoji" title="adn"></i></a>
							<a href="javascript:;" value=":fa-android:" title=":fa-android:" class="editormd-emoji-btn"><i class="fa fa-android fa-emoji" title="android"></i></a>
							<a href="javascript:;" value=":fa-angellist:" title=":fa-angellist:" class="editormd-emoji-btn"><i class="fa fa-angellist fa-emoji" title="angellist"></i></a>
							<a href="javascript:;" value=":fa-apple:" title=":fa-apple:" class="editormd-emoji-btn"><i class="fa fa-apple fa-emoji" title="apple"></i></a>
							<a href="javascript:;" value=":fa-behance:" title=":fa-behance:" class="editormd-emoji-btn"><i class="fa fa-behance fa-emoji" title="behance"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-behance-square:" title=":fa-behance-square:" class="editormd-emoji-btn"><i class="fa fa-behance-square fa-emoji" title="behance-square"></i></a>
							<a href="javascript:;" value=":fa-bitbucket:" title=":fa-bitbucket:" class="editormd-emoji-btn"><i class="fa fa-bitbucket fa-emoji" title="bitbucket"></i></a>
							<a href="javascript:;" value=":fa-bitbucket-square:" title=":fa-bitbucket-square:" class="editormd-emoji-btn"><i class="fa fa-bitbucket-square fa-emoji" title="bitbucket-square"></i></a>
							<a href="javascript:;" value=":fa-bitcoin:" title=":fa-bitcoin:" class="editormd-emoji-btn"><i class="fa fa-bitcoin fa-emoji" title="bitcoin"></i></a>
							<a href="javascript:;" value=":fa-btc:" title=":fa-btc:" class="editormd-emoji-btn"><i class="fa fa-btc fa-emoji" title="btc"></i></a>
							<a href="javascript:;" value=":fa-buysellads:" title=":fa-buysellads:" class="editormd-emoji-btn"><i class="fa fa-buysellads fa-emoji" title="buysellads"></i></a>
							<a href="javascript:;" value=":fa-cc-amex:" title=":fa-cc-amex:" class="editormd-emoji-btn"><i class="fa fa-cc-amex fa-emoji" title="cc-amex"></i></a>
							<a href="javascript:;" value=":fa-cc-discover:" title=":fa-cc-discover:" class="editormd-emoji-btn"><i class="fa fa-cc-discover fa-emoji" title="cc-discover"></i></a>
							<a href="javascript:;" value=":fa-cc-mastercard:" title=":fa-cc-mastercard:" class="editormd-emoji-btn"><i class="fa fa-cc-mastercard fa-emoji" title="cc-mastercard"></i></a>
							<a href="javascript:;" value=":fa-cc-paypal:" title=":fa-cc-paypal:" class="editormd-emoji-btn"><i class="fa fa-cc-paypal fa-emoji" title="cc-paypal"></i></a>
							<a href="javascript:;" value=":fa-cc-stripe:" title=":fa-cc-stripe:" class="editormd-emoji-btn"><i class="fa fa-cc-stripe fa-emoji" title="cc-stripe"></i></a>
							<a href="javascript:;" value=":fa-cc-visa:" title=":fa-cc-visa:" class="editormd-emoji-btn"><i class="fa fa-cc-visa fa-emoji" title="cc-visa"></i></a>
							<a href="javascript:;" value=":fa-codepen:" title=":fa-codepen:" class="editormd-emoji-btn"><i class="fa fa-codepen fa-emoji" title="codepen"></i></a>
							<a href="javascript:;" value=":fa-connectdevelop:" title=":fa-connectdevelop:" class="editormd-emoji-btn"><i class="fa fa-connectdevelop fa-emoji" title="connectdevelop"></i></a>
							<a href="javascript:;" value=":fa-css3:" title=":fa-css3:" class="editormd-emoji-btn"><i class="fa fa-css3 fa-emoji" title="css3"></i></a>
							<a href="javascript:;" value=":fa-dashcube:" title=":fa-dashcube:" class="editormd-emoji-btn"><i class="fa fa-dashcube fa-emoji" title="dashcube"></i></a>
							<a href="javascript:;" value=":fa-delicious:" title=":fa-delicious:" class="editormd-emoji-btn"><i class="fa fa-delicious fa-emoji" title="delicious"></i></a>
							<a href="javascript:;" value=":fa-deviantart:" title=":fa-deviantart:" class="editormd-emoji-btn"><i class="fa fa-deviantart fa-emoji" title="deviantart"></i></a>
							<a href="javascript:;" value=":fa-digg:" title=":fa-digg:" class="editormd-emoji-btn"><i class="fa fa-digg fa-emoji" title="digg"></i></a>
							<a href="javascript:;" value=":fa-dribbble:" title=":fa-dribbble:" class="editormd-emoji-btn"><i class="fa fa-dribbble fa-emoji" title="dribbble"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-dropbox:" title=":fa-dropbox:" class="editormd-emoji-btn"><i class="fa fa-dropbox fa-emoji" title="dropbox"></i></a>
							<a href="javascript:;" value=":fa-drupal:" title=":fa-drupal:" class="editormd-emoji-btn"><i class="fa fa-drupal fa-emoji" title="drupal"></i></a>
							<a href="javascript:;" value=":fa-empire:" title=":fa-empire:" class="editormd-emoji-btn"><i class="fa fa-empire fa-emoji" title="empire"></i></a>
							<a href="javascript:;" value=":fa-facebook:" title=":fa-facebook:" class="editormd-emoji-btn"><i class="fa fa-facebook fa-emoji" title="facebook"></i></a>
							<a href="javascript:;" value=":fa-facebook-f:" title=":fa-facebook-f:" class="editormd-emoji-btn"><i class="fa fa-facebook-f fa-emoji" title="facebook-f"></i></a>
							<a href="javascript:;" value=":fa-facebook-official:" title=":fa-facebook-official:" class="editormd-emoji-btn"><i class="fa fa-facebook-official fa-emoji" title="facebook-official"></i></a>
							<a href="javascript:;" value=":fa-facebook-square:" title=":fa-facebook-square:" class="editormd-emoji-btn"><i class="fa fa-facebook-square fa-emoji" title="facebook-square"></i></a>
							<a href="javascript:;" value=":fa-flickr:" title=":fa-flickr:" class="editormd-emoji-btn"><i class="fa fa-flickr fa-emoji" title="flickr"></i></a>
							<a href="javascript:;" value=":fa-forumbee:" title=":fa-forumbee:" class="editormd-emoji-btn"><i class="fa fa-forumbee fa-emoji" title="forumbee"></i></a>
							<a href="javascript:;" value=":fa-foursquare:" title=":fa-foursquare:" class="editormd-emoji-btn"><i class="fa fa-foursquare fa-emoji" title="foursquare"></i></a>
							<a href="javascript:;" value=":fa-ge:" title=":fa-ge:" class="editormd-emoji-btn"><i class="fa fa-ge fa-emoji" title="ge"></i></a>
							<a href="javascript:;" value=":fa-git:" title=":fa-git:" class="editormd-emoji-btn"><i class="fa fa-git fa-emoji" title="git"></i></a>
							<a href="javascript:;" value=":fa-git-square:" title=":fa-git-square:" class="editormd-emoji-btn"><i class="fa fa-git-square fa-emoji" title="git-square"></i></a>
							<a href="javascript:;" value=":fa-github:" title=":fa-github:" class="editormd-emoji-btn"><i class="fa fa-github fa-emoji" title="github"></i></a>
							<a href="javascript:;" value=":fa-github-alt:" title=":fa-github-alt:" class="editormd-emoji-btn"><i class="fa fa-github-alt fa-emoji" title="github-alt"></i></a>
							<a href="javascript:;" value=":fa-github-square:" title=":fa-github-square:" class="editormd-emoji-btn"><i class="fa fa-github-square fa-emoji" title="github-square"></i></a>
							<a href="javascript:;" value=":fa-gittip:" title=":fa-gittip:" class="editormd-emoji-btn"><i class="fa fa-gittip fa-emoji" title="gittip"></i></a>
							<a href="javascript:;" value=":fa-google:" title=":fa-google:" class="editormd-emoji-btn"><i class="fa fa-google fa-emoji" title="google"></i></a>
							<a href="javascript:;" value=":fa-google-plus:" title=":fa-google-plus:" class="editormd-emoji-btn"><i class="fa fa-google-plus fa-emoji" title="google-plus"></i></a>
							<a href="javascript:;" value=":fa-google-plus-square:" title=":fa-google-plus-square:" class="editormd-emoji-btn"><i class="fa fa-google-plus-square fa-emoji" title="google-plus-square"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-google-wallet:" title=":fa-google-wallet:" class="editormd-emoji-btn"><i class="fa fa-google-wallet fa-emoji" title="google-wallet"></i></a>
							<a href="javascript:;" value=":fa-gratipay:" title=":fa-gratipay:" class="editormd-emoji-btn"><i class="fa fa-gratipay fa-emoji" title="gratipay"></i></a>
							<a href="javascript:;" value=":fa-hacker-news:" title=":fa-hacker-news:" class="editormd-emoji-btn"><i class="fa fa-hacker-news fa-emoji" title="hacker-news"></i></a>
							<a href="javascript:;" value=":fa-html5:" title=":fa-html5:" class="editormd-emoji-btn"><i class="fa fa-html5 fa-emoji" title="html5"></i></a>
							<a href="javascript:;" value=":fa-instagram:" title=":fa-instagram:" class="editormd-emoji-btn"><i class="fa fa-instagram fa-emoji" title="instagram"></i></a>
							<a href="javascript:;" value=":fa-ioxhost:" title=":fa-ioxhost:" class="editormd-emoji-btn"><i class="fa fa-ioxhost fa-emoji" title="ioxhost"></i></a>
							<a href="javascript:;" value=":fa-joomla:" title=":fa-joomla:" class="editormd-emoji-btn"><i class="fa fa-joomla fa-emoji" title="joomla"></i></a>
							<a href="javascript:;" value=":fa-jsfiddle:" title=":fa-jsfiddle:" class="editormd-emoji-btn"><i class="fa fa-jsfiddle fa-emoji" title="jsfiddle"></i></a>
							<a href="javascript:;" value=":fa-lastfm:" title=":fa-lastfm:" class="editormd-emoji-btn"><i class="fa fa-lastfm fa-emoji" title="lastfm"></i></a>
							<a href="javascript:;" value=":fa-lastfm-square:" title=":fa-lastfm-square:" class="editormd-emoji-btn"><i class="fa fa-lastfm-square fa-emoji" title="lastfm-square"></i></a>
							<a href="javascript:;" value=":fa-leanpub:" title=":fa-leanpub:" class="editormd-emoji-btn"><i class="fa fa-leanpub fa-emoji" title="leanpub"></i></a>
							<a href="javascript:;" value=":fa-linkedin:" title=":fa-linkedin:" class="editormd-emoji-btn"><i class="fa fa-linkedin fa-emoji" title="linkedin"></i></a>
							<a href="javascript:;" value=":fa-linkedin-square:" title=":fa-linkedin-square:" class="editormd-emoji-btn"><i class="fa fa-linkedin-square fa-emoji" title="linkedin-square"></i></a>
							<a href="javascript:;" value=":fa-linux:" title=":fa-linux:" class="editormd-emoji-btn"><i class="fa fa-linux fa-emoji" title="linux"></i></a>
							<a href="javascript:;" value=":fa-maxcdn:" title=":fa-maxcdn:" class="editormd-emoji-btn"><i class="fa fa-maxcdn fa-emoji" title="maxcdn"></i></a>
							<a href="javascript:;" value=":fa-meanpath:" title=":fa-meanpath:" class="editormd-emoji-btn"><i class="fa fa-meanpath fa-emoji" title="meanpath"></i></a>
							<a href="javascript:;" value=":fa-medium:" title=":fa-medium:" class="editormd-emoji-btn"><i class="fa fa-medium fa-emoji" title="medium"></i></a>
							<a href="javascript:;" value=":fa-openid:" title=":fa-openid:" class="editormd-emoji-btn"><i class="fa fa-openid fa-emoji" title="openid"></i></a>
							<a href="javascript:;" value=":fa-pagelines:" title=":fa-pagelines:" class="editormd-emoji-btn"><i class="fa fa-pagelines fa-emoji" title="pagelines"></i></a>
							<a href="javascript:;" value=":fa-paypal:" title=":fa-paypal:" class="editormd-emoji-btn"><i class="fa fa-paypal fa-emoji" title="paypal"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-pied-piper:" title=":fa-pied-piper:" class="editormd-emoji-btn"><i class="fa fa-pied-piper fa-emoji" title="pied-piper"></i></a>
							<a href="javascript:;" value=":fa-pied-piper-alt:" title=":fa-pied-piper-alt:" class="editormd-emoji-btn"><i class="fa fa-pied-piper-alt fa-emoji" title="pied-piper-alt"></i></a>
							<a href="javascript:;" value=":fa-pinterest:" title=":fa-pinterest:" class="editormd-emoji-btn"><i class="fa fa-pinterest fa-emoji" title="pinterest"></i></a>
							<a href="javascript:;" value=":fa-pinterest-p:" title=":fa-pinterest-p:" class="editormd-emoji-btn"><i class="fa fa-pinterest-p fa-emoji" title="pinterest-p"></i></a>
							<a href="javascript:;" value=":fa-pinterest-square:" title=":fa-pinterest-square:" class="editormd-emoji-btn"><i class="fa fa-pinterest-square fa-emoji" title="pinterest-square"></i></a>
							<a href="javascript:;" value=":fa-qq:" title=":fa-qq:" class="editormd-emoji-btn"><i class="fa fa-qq fa-emoji" title="qq"></i></a>
							<a href="javascript:;" value=":fa-ra:" title=":fa-ra:" class="editormd-emoji-btn"><i class="fa fa-ra fa-emoji" title="ra"></i></a>
							<a href="javascript:;" value=":fa-rebel:" title=":fa-rebel:" class="editormd-emoji-btn"><i class="fa fa-rebel fa-emoji" title="rebel"></i></a>
							<a href="javascript:;" value=":fa-reddit:" title=":fa-reddit:" class="editormd-emoji-btn"><i class="fa fa-reddit fa-emoji" title="reddit"></i></a>
							<a href="javascript:;" value=":fa-reddit-square:" title=":fa-reddit-square:" class="editormd-emoji-btn"><i class="fa fa-reddit-square fa-emoji" title="reddit-square"></i></a>
							<a href="javascript:;" value=":fa-renren:" title=":fa-renren:" class="editormd-emoji-btn"><i class="fa fa-renren fa-emoji" title="renren"></i></a>
							<a href="javascript:;" value=":fa-sellsy:" title=":fa-sellsy:" class="editormd-emoji-btn"><i class="fa fa-sellsy fa-emoji" title="sellsy"></i></a>
							<a href="javascript:;" value=":fa-share-alt:" title=":fa-share-alt:" class="editormd-emoji-btn"><i class="fa fa-share-alt fa-emoji" title="share-alt"></i></a>
							<a href="javascript:;" value=":fa-share-alt-square:" title=":fa-share-alt-square:" class="editormd-emoji-btn"><i class="fa fa-share-alt-square fa-emoji" title="share-alt-square"></i></a>
							<a href="javascript:;" value=":fa-shirtsinbulk:" title=":fa-shirtsinbulk:" class="editormd-emoji-btn"><i class="fa fa-shirtsinbulk fa-emoji" title="shirtsinbulk"></i></a>
							<a href="javascript:;" value=":fa-simplybuilt:" title=":fa-simplybuilt:" class="editormd-emoji-btn"><i class="fa fa-simplybuilt fa-emoji" title="simplybuilt"></i></a>
							<a href="javascript:;" value=":fa-skyatlas:" title=":fa-skyatlas:" class="editormd-emoji-btn"><i class="fa fa-skyatlas fa-emoji" title="skyatlas"></i></a>
							<a href="javascript:;" value=":fa-skype:" title=":fa-skype:" class="editormd-emoji-btn"><i class="fa fa-skype fa-emoji" title="skype"></i></a>
							<a href="javascript:;" value=":fa-slack:" title=":fa-slack:" class="editormd-emoji-btn"><i class="fa fa-slack fa-emoji" title="slack"></i></a>
							<a href="javascript:;" value=":fa-slideshare:" title=":fa-slideshare:" class="editormd-emoji-btn"><i class="fa fa-slideshare fa-emoji" title="slideshare"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-soundcloud:" title=":fa-soundcloud:" class="editormd-emoji-btn"><i class="fa fa-soundcloud fa-emoji" title="soundcloud"></i></a>
							<a href="javascript:;" value=":fa-spotify:" title=":fa-spotify:" class="editormd-emoji-btn"><i class="fa fa-spotify fa-emoji" title="spotify"></i></a>
							<a href="javascript:;" value=":fa-stack-exchange:" title=":fa-stack-exchange:" class="editormd-emoji-btn"><i class="fa fa-stack-exchange fa-emoji" title="stack-exchange"></i></a>
							<a href="javascript:;" value=":fa-stack-overflow:" title=":fa-stack-overflow:" class="editormd-emoji-btn"><i class="fa fa-stack-overflow fa-emoji" title="stack-overflow"></i></a>
							<a href="javascript:;" value=":fa-steam:" title=":fa-steam:" class="editormd-emoji-btn"><i class="fa fa-steam fa-emoji" title="steam"></i></a>
							<a href="javascript:;" value=":fa-steam-square:" title=":fa-steam-square:" class="editormd-emoji-btn"><i class="fa fa-steam-square fa-emoji" title="steam-square"></i></a>
							<a href="javascript:;" value=":fa-stumbleupon:" title=":fa-stumbleupon:" class="editormd-emoji-btn"><i class="fa fa-stumbleupon fa-emoji" title="stumbleupon"></i></a>
							<a href="javascript:;" value=":fa-stumbleupon-circle:" title=":fa-stumbleupon-circle:" class="editormd-emoji-btn"><i class="fa fa-stumbleupon-circle fa-emoji" title="stumbleupon-circle"></i></a>
							<a href="javascript:;" value=":fa-tencent-weibo:" title=":fa-tencent-weibo:" class="editormd-emoji-btn"><i class="fa fa-tencent-weibo fa-emoji" title="tencent-weibo"></i></a>
							<a href="javascript:;" value=":fa-trello:" title=":fa-trello:" class="editormd-emoji-btn"><i class="fa fa-trello fa-emoji" title="trello"></i></a>
							<a href="javascript:;" value=":fa-tumblr:" title=":fa-tumblr:" class="editormd-emoji-btn"><i class="fa fa-tumblr fa-emoji" title="tumblr"></i></a>
							<a href="javascript:;" value=":fa-tumblr-square:" title=":fa-tumblr-square:" class="editormd-emoji-btn"><i class="fa fa-tumblr-square fa-emoji" title="tumblr-square"></i></a>
							<a href="javascript:;" value=":fa-twitch:" title=":fa-twitch:" class="editormd-emoji-btn"><i class="fa fa-twitch fa-emoji" title="twitch"></i></a>
							<a href="javascript:;" value=":fa-twitter:" title=":fa-twitter:" class="editormd-emoji-btn"><i class="fa fa-twitter fa-emoji" title="twitter"></i></a>
							<a href="javascript:;" value=":fa-twitter-square:" title=":fa-twitter-square:" class="editormd-emoji-btn"><i class="fa fa-twitter-square fa-emoji" title="twitter-square"></i></a>
							<a href="javascript:;" value=":fa-viacoin:" title=":fa-viacoin:" class="editormd-emoji-btn"><i class="fa fa-viacoin fa-emoji" title="viacoin"></i></a>
							<a href="javascript:;" value=":fa-vimeo-square:" title=":fa-vimeo-square:" class="editormd-emoji-btn"><i class="fa fa-vimeo-square fa-emoji" title="vimeo-square"></i></a>
							<a href="javascript:;" value=":fa-vine:" title=":fa-vine:" class="editormd-emoji-btn"><i class="fa fa-vine fa-emoji" title="vine"></i></a>
							<a href="javascript:;" value=":fa-vk:" title=":fa-vk:" class="editormd-emoji-btn"><i class="fa fa-vk fa-emoji" title="vk"></i></a>
							<a href="javascript:;" value=":fa-wechat:" title=":fa-wechat:" class="editormd-emoji-btn"><i class="fa fa-wechat fa-emoji" title="wechat"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-weibo:" title=":fa-weibo:" class="editormd-emoji-btn"><i class="fa fa-weibo fa-emoji" title="weibo"></i></a>
							<a href="javascript:;" value=":fa-weixin:" title=":fa-weixin:" class="editormd-emoji-btn"><i class="fa fa-weixin fa-emoji" title="weixin"></i></a>
							<a href="javascript:;" value=":fa-whatsapp:" title=":fa-whatsapp:" class="editormd-emoji-btn"><i class="fa fa-whatsapp fa-emoji" title="whatsapp"></i></a>
							<a href="javascript:;" value=":fa-windows:" title=":fa-windows:" class="editormd-emoji-btn"><i class="fa fa-windows fa-emoji" title="windows"></i></a>
							<a href="javascript:;" value=":fa-wordpress:" title=":fa-wordpress:" class="editormd-emoji-btn"><i class="fa fa-wordpress fa-emoji" title="wordpress"></i></a>
							<a href="javascript:;" value=":fa-xing:" title=":fa-xing:" class="editormd-emoji-btn"><i class="fa fa-xing fa-emoji" title="xing"></i></a>
							<a href="javascript:;" value=":fa-xing-square:" title=":fa-xing-square:" class="editormd-emoji-btn"><i class="fa fa-xing-square fa-emoji" title="xing-square"></i></a>
							<a href="javascript:;" value=":fa-yahoo:" title=":fa-yahoo:" class="editormd-emoji-btn"><i class="fa fa-yahoo fa-emoji" title="yahoo"></i></a>
							<a href="javascript:;" value=":fa-yelp:" title=":fa-yelp:" class="editormd-emoji-btn"><i class="fa fa-yelp fa-emoji" title="yelp"></i></a>
							<a href="javascript:;" value=":fa-youtube:" title=":fa-youtube:" class="editormd-emoji-btn"><i class="fa fa-youtube fa-emoji" title="youtube"></i></a>
							<a href="javascript:;" value=":fa-youtube-play:" title=":fa-youtube-play:" class="editormd-emoji-btn"><i class="fa fa-youtube-play fa-emoji" title="youtube-play"></i></a>
							<a href="javascript:;" value=":fa-youtube-square:" title=":fa-youtube-square:" class="editormd-emoji-btn"><i class="fa fa-youtube-square fa-emoji" title="youtube-square"></i></a>
							<a href="javascript:;" value=":fa-ambulance:" title=":fa-ambulance:" class="editormd-emoji-btn"><i class="fa fa-ambulance fa-emoji" title="ambulance"></i></a>
							<a href="javascript:;" value=":fa-h-square:" title=":fa-h-square:" class="editormd-emoji-btn"><i class="fa fa-h-square fa-emoji" title="h-square"></i></a>
							<a href="javascript:;" value=":fa-heart:" title=":fa-heart:" class="editormd-emoji-btn"><i class="fa fa-heart fa-emoji" title="heart"></i></a>
							<a href="javascript:;" value=":fa-heart-o:" title=":fa-heart-o:" class="editormd-emoji-btn"><i class="fa fa-heart-o fa-emoji" title="heart-o"></i></a>
							<a href="javascript:;" value=":fa-heartbeat:" title=":fa-heartbeat:" class="editormd-emoji-btn"><i class="fa fa-heartbeat fa-emoji" title="heartbeat"></i></a>
							<a href="javascript:;" value=":fa-hospital-o:" title=":fa-hospital-o:" class="editormd-emoji-btn"><i class="fa fa-hospital-o fa-emoji" title="hospital-o"></i></a>
							<a href="javascript:;" value=":fa-medkit:" title=":fa-medkit:" class="editormd-emoji-btn"><i class="fa fa-medkit fa-emoji" title="medkit"></i></a>
							<a href="javascript:;" value=":fa-plus-square:" title=":fa-plus-square:" class="editormd-emoji-btn"><i class="fa fa-plus-square fa-emoji" title="plus-square"></i></a>
						</div>
						<div class="editormd-grid-table-row">
							<a href="javascript:;" value=":fa-stethoscope:" title=":fa-stethoscope:" class="editormd-emoji-btn"><i class="fa fa-stethoscope fa-emoji" title="stethoscope"></i></a>
							<a href="javascript:;" value=":fa-user-md:" title=":fa-user-md:" class="editormd-emoji-btn"><i class="fa fa-user-md fa-emoji" title="user-md"></i></a>
							<a href="javascript:;" value=":fa-wheelchair:" title=":fa-wheelchair:" class="editormd-emoji-btn"><i class="fa fa-wheelchair fa-emoji" title="wheelchair"></i></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
							<a href="javascript:;" value=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>