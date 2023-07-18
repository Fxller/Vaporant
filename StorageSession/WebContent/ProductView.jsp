<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.getSession().setAttribute("tipo", "guest");
	
	Collection<?> products = (Collection<?>) session.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	ProductBean product = (ProductBean) session.getAttribute("product");
	String user = (String) request.getSession().getAttribute("user");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<link href = "ProductStyle.css" rel = "stylesheet" type = "text/css">
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/splidejs/4.1.4/js/splide.min.js" integrity="sha512-4TcjHXQMLM7Y6eqfiasrsnRCc8D/unDeY1UGKGgfwyLUCTsHYMxF7/UHayjItKQKIoP6TTQ6AMamb9w2GMAvNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/splidejs/4.1.4/css/splide.min.css" integrity="sha512-KhFXpe+VJEu5HYbJyKQs9VvwGB+jQepqb4ZnlhUF/jQGxYJcjdxOTf6cr445hOc791FFLs18DKVpfrQnONOB1g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
	.splide__slide img {
  		width: 100%;
  		height: 96%;
  		object-fit: cover;	
  		border-radius: 5%;
  		padding-right: 5px;
	}
	.splide__slide > div {
		text-align: center;
	}
	.splide__pagination {
	display: none;
	}
	
#heroSection {
  height: 50vh;
  width: 100%;
  background-color: black;
  display: flex;
  align-items: center;
}

.heroVideoContainer {
  width: 100%;
  height: 100%;
  opacity: 0.4;
  overflow: hidden;
}

.heroVideoContainer video {
  width: 100%;
  height: 200%;
  object-fit: cover;
  transform: translateY(-5%);
}

.heroText {
  position: absolute;
  height: 100%;
  width: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.heroText > h1 {
  color: white;
  font-size: 48px;
}
	
	</style>
	<title>Vaporant</title>
</head>

<body>
	<jsp:include page="Header.jsp" />
		<div id="heroSection">
  			<div class="heroVideoContainer">
    			<video src="herovideo.mp4" autoplay loop playsinline muted></video>
  			</div>
  			<div class="heroText">
    			<h1>IL PIACERE DELLO SVAPO</h1>
  			</div>
		</div>
		<br>
		<div class = "slider">
		<section id="image-carousel" class="splide" aria-label="Beautiful Images">
  			<div class="splide__track">
				<ul class="splide__list">
					<li class="splide__slide">
						<img src="img1.jpg" alt="">
						<div>
							Description 01
						</div>
					</li>

					<li class="splide__slide">
						<img src="img2.jpg" alt="">
						<div>
							Description 02
						</div>
					</li>
					<li class="splide__slide">
						<img src="img3.jpg" alt="">
						<div>
							Description 03
						</div>
					</li>

					<li class="splide__slide">
						<img src="img4.jpg" alt="">
						<div>
							Description 04
						</div>
					</li>
					<li class="splide__slide">
						<img src="img4.jpg" alt="">
						<div>
							Description 05
						</div>
					</li>
				</ul>
  			</div>
		</section>
		</div>
		<br>
		<script>
		document.addEventListener( 'DOMContentLoaded', function () {
			  new Splide( '#image-carousel', {
					perPage    : 4,
					type: "loop",
					breakpoints: {
						640: {
							perPage: 1,
						},
					},
			  } ).mount();
			} );
		</script>
	<jsp:include page="Footer.jsp" />
</body>
</html>