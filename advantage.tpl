<div class="imagetextadv">
	<style scoped>
		.imagetextadv h1 {
			font-size:150%;
			margin-top:10px;
		}
		.imagetextadv .descr {
			height: {config.height}px;
		}
		.imagetextadv img {
			border-radius:0;
		}
	</style>
	<div class="row">
		{data.list::item}
	</div>
</div>
{item:}
	<div class="col-lg-4 col-sm-6 descr">
		<img src="{...dir}{file}" alt="{name}" title="{name}" class="img-circle">
		{title}
	</div>