<div class="imagetextsteps">
	<div class="row font space" style="font-size:45px; font-weight:bold;text-align:center">
		<style scoped>
			.imagetextsteps {

			}
			.imagetextsteps .step {
				cursor:pointer;
			}
			.imagetextsteps .step .title {
				font-size: 2rem;
			}
			.imagetextsteps .foot {
				opacity:0.3;
			}
			.imagetextsteps .hover .foot {
				opacity:0.7;
			}
			.imagetextsteps .hover {
				color: rgb(163,5,11);
			}
			.imagetextsteps .active {
				text-shadow: 1px 1px 1px gray;
				color: rgb(227,30,37);
			}
			.imagetextsteps .active .foot {
				opacity:1;
			}
			.imagetextsteps .text {
				display:none;
				padding-left:20px;
			}
			.imagetextsteps h1 {
				font-size:45px;
			}
		</style>
		<a href="#step-text">
			{data.list::showname}
		</a>
		<script>
			domready( function () {
				var div = $('.imagetextsteps');
				var steps = div.find('.step');
				var texts = div.find('.text');
				steps.hover(function(){
					var step = this;
					steps.removeClass('active');
					$(this).addClass('active');
					steps.each(function(){
						if (!step) {
							$(this).removeClass('hover');
							return;
						}
						if (step == this) step = false;
						$(this).addClass('hover');
					});
				}).mouseenter(function(){
					var num = steps.index(this);
					var now = texts.eq(num);
					texts.stop().not(now).slideUp('slow');
					now.slideDown('slow');
					
				});
			});
		</script>
	</div>

	<div class="space" id="step-text">
		<section>
			{data.list::showtext}
			<div style="clear:both"></div>
		</section>
	</div>
</div>
{showtext:}
	<div class="text"{~first():firstshow}>
		<div class="row">
			<div class="col-sm-8">
				{title}
			</div>
			<div class="col-sm-4">
				<img class="img-responsive" src="/{...dir}{file}">
			</div>
		</div>
	</div>
	{firstshow:} style="display:block"
{showname:}
	<div class="col-xs-4 col-sm-2 step">
		<div class="row">
			<div class="col-xs-12 col-sm-12 num">
				<img class="img-responsive" src="/{...dir}{file}">
			</div>
		</div>
		<div class="title hidden-xs">{name}</div>
	</div>