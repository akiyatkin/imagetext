<div style="width:calc(100%+60px)" id="mebel-na-zakaz" class="carousel mainslide slide" data-ride="carousel">
	<style scoped>
		/* Since positioning the image, we need to help out the caption */
		.mainslide .carousel-caption {
			z-index: 10;
		}
		.mainslide .carousel-control {
			color:black;
		}
		.mainslide .carousel-control.left {
			background-image: linear-gradient(to right,rgba(255,0,0,.5) 0,rgba(0,0,0,.0001) 100%);
			background-image: none;
		}
		.mainslide .carousel-control.right {
			background-image: linear-gradient(to left,rgba(255,055,0,.5) 0,rgba(0,0,0,.0001) 100%);
			background-image: none;
		}
		/* Declare heights because of positioning of img element */
		
		.mainslide .carousel-caption {
			padding-bottom: 60px;
			
		}
		.mainslide .carousel-caption h1 {
			padding:20px 30px;
			background-color: rgba(255,255,255,0.4);
			background-color: rgba(0,0,0,0.4);
		}
		.mainslide .carousel-indicators li {
			width: 30px;
			height: 30px;
			margin-left:10px;
			border-radius:20px;	
			background-color: rgba(200,200,200,0.4);
			background-color: rgba(160,190,240,1);

			transition: 0.7s;
			
		}
		.mainslide .carousel-indicators .active {
			width: 30px;
			height: 30px;
			border-radius:15px;	
			background-color: rgb(255,0,0);
		}
		.mainslide .item {
			height: 400px;
			background-size:cover;
		}
	</style>
	<!-- Indicators -->
	<ol class="carousel-indicators">
		{data.list::mslidenums}
	</ol>
	<div class="carousel-inner lightlinks" role="listbox">
		{data.list::mslide}
	</div>
	<a class="left carousel-control" href="#mebel-na-zakaz" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#mebel-na-zakaz" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div><!-- /.mainslide -->
{mslidenums:}
	<li data-target="#mebel-na-zakaz" data-slide-to="{~key}"{~first()?:mslidenumactive}></li>
	{mslidenumactive:} class="active"
{mslide:}
	<div class="item {~first()?:active}" style="background-image:url('/-imager/?src={...dir}{file}&amp;w=1600&amp;h=800&amp;crop=1');">
			<div class="container">
				<div class="carousel-caption">
					<h1>{title}</h1>
				</div>
			</div>
		</div>